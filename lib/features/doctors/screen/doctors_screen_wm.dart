import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:mobidoc/api/data/doctor/doctor.dart';
import 'package:mobidoc/api/data/result.dart';
import 'package:mobidoc/features/app/di/app_scope.dart';
import 'package:mobidoc/features/common/mixin/theme_mixin.dart';
import 'package:mobidoc/features/doctors/screen/doctors_screen.dart';
import 'package:mobidoc/features/doctors/screen/doctors_screen_model.dart';
import 'package:provider/provider.dart';

/// Factory [DoctorsScreenWM].
DoctorsScreenWM defaultDoctorsScreenWidgetModelFactory(
  BuildContext context,
) {
  final appDependencies = context.read<IAppScope>();
  return DoctorsScreenWM(
    DoctorsScreenModel(appDependencies.doctorRepository),
  );
}

/// Default widget model for DoctorsScreenWidget.
class DoctorsScreenWM extends WidgetModel<DoctorsScreen, DoctorsScreenModel>
    with ThemeWMMixin
    implements IDoctorsScreenWidgetModel {
  final _doctors = StateNotifier<Result<List<Doctor>>>(initValue: Loading());

  @override
  ListenableState<Result<List<Doctor>>> get doctors => _doctors;

  /// Create an instance[DoctorsScreenWM].
  DoctorsScreenWM(DoctorsScreenModel model) : super(model);

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
}

/// Interface of [DoctorsScreenWM].
abstract class IDoctorsScreenWidgetModel extends IWidgetModel
    with ThemeIModelMixin {
  /// Listener list of doctors.
  ListenableState<Result<List<Doctor>>> get doctors;

  /// Function of loading the list of doctors.
  Future<void> loadDoctors();
}
