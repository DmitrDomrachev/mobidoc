import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:mobidoc/api/data/doctor/doctor.dart';
import 'package:mobidoc/features/app/di/app_scope.dart';
import 'package:mobidoc/features/common/mixin/theme_mixin.dart';
import 'package:mobidoc/features/doctors/screen/doctors_screen.dart';
import 'package:mobidoc/features/doctors/screen/doctors_screen_model.dart';
import 'package:provider/provider.dart';

DoctorsScreenWidgetModel defaultDoctorsScreenWidgetModelFactory(
  BuildContext context,
) {
  final appDependencies = context.read<IAppScope>();
  return DoctorsScreenWidgetModel(
    DoctorsScreenModel(appDependencies.doctorRepository),
  );
}

/// Default widget model for DoctorsScreenWidget.
class DoctorsScreenWidgetModel
    extends WidgetModel<DoctorsScreenWidget, DoctorsScreenModel>
    with ThemeWMMixin
    implements IDoctorsScreenWidgetModel {
  DoctorsScreenWidgetModel(DoctorsScreenModel model) : super(model);
  final _doctors = StateNotifier<List<Doctor>>(initValue: []);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _loadDoctors();
  }

  Future<void> _loadDoctors() async {
    try {
      _doctors.accept(await model.repository.getDoctors());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  ListenableState<List<Doctor>> get doctors => _doctors;
}

abstract class IDoctorsScreenWidgetModel extends IWidgetModel
    with ThemeIModelMixin {
  ListenableState<List<Doctor>> get doctors;
}
