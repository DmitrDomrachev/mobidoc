import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:mobidoc/api/data/doctor/doctor.dart';
import 'package:mobidoc/api/data/result.dart';
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
  final _doctors = StateNotifier<Result<List<Doctor>>>(initValue: Loading());

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    loadDoctors();
  }

  @override
  Future<void> loadDoctors() async {
    _doctors
      ..accept(Loading())
      ..accept(await model.doctorRepository.getDoctors());
  }

  @override
  ListenableState<Result<List<Doctor>>> get doctors => _doctors;
}

abstract class IDoctorsScreenWidgetModel extends IWidgetModel
    with ThemeIModelMixin {
  ListenableState<Result<List<Doctor>>> get doctors;

  Future<void> loadDoctors();
}
