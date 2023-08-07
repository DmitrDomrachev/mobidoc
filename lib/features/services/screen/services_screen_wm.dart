import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:mobidoc/api/data/result.dart';
import 'package:mobidoc/api/data/service/service.dart';
import 'package:mobidoc/features/app/di/app_scope.dart';
import 'package:mobidoc/features/common/mixin/theme_mixin.dart';
import 'package:mobidoc/features/services/screen/services_screen.dart';
import 'package:mobidoc/features/services/screen/services_screen_model.dart';
import 'package:provider/provider.dart';

/// Factory [ServicesScreenWM].
ServicesScreenWM defaultServicesScreenWidgetModelFactory(
  BuildContext context,
) {
  final appDependencies = context.read<IAppScope>();

  return ServicesScreenWM(
    ServicesScreenModel(appDependencies.serviceRepository),
  );
}

/// Default widget model for ServicesScreenWidget.
class ServicesScreenWM extends WidgetModel<ServicesScreen, ServicesScreenModel>
    with ThemeWMMixin
    implements IServicesScreenWidgetModel {
  final _services = StateNotifier<Result<List<Service>>>(initValue: Loading());

  @override
  ListenableState<Result<List<Service>>> get services => _services;

  /// Create an instance [ServicesScreenWM].
  ServicesScreenWM(ServicesScreenModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    loadServices();
  }

  @override
  Future<void> loadServices() async {
    _services
      ..accept(Loading())
      ..accept(await model.serviceRepository.getServices());
  }
}

/// Interface of [ServicesScreenWM].
abstract class IServicesScreenWidgetModel extends IWidgetModel
    with ThemeIModelMixin {
  /// Listener list of services.
  ListenableState<Result<List<Service>>> get services;

  /// Function of loading the list of services.
  Future<void> loadServices();
}
