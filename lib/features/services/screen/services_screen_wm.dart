import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:mobidoc/api/data/result.dart';
import 'package:mobidoc/api/data/service/service.dart';
import 'package:mobidoc/features/app/di/app_scope.dart';
import 'package:mobidoc/features/common/mixin/theme_mixin.dart';
import 'package:mobidoc/features/services/screen/services_screen.dart';
import 'package:mobidoc/features/services/screen/services_screen_model.dart';
import 'package:provider/provider.dart';

ServicesScreenWidgetModel defaultServicesScreenWidgetModelFactory(
    BuildContext context) {
  final appDependencies = context.read<IAppScope>();

  return ServicesScreenWidgetModel(
    ServicesScreenModel(appDependencies.serviceRepository),
  );
}

/// Default widget model for ServicesScreenWidget
class ServicesScreenWidgetModel
    extends WidgetModel<ServicesScreenWidget, ServicesScreenModel>
    with ThemeWMMixin
    implements IServicesScreenWidgetModel {
  ServicesScreenWidgetModel(ServicesScreenModel model) : super(model);

  final _services = StateNotifier<Result<List<Service>>>(initValue: Loading());

  @override
  ListenableState<Result<List<Service>>> get services => _services;

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

abstract class IServicesScreenWidgetModel extends IWidgetModel
    with ThemeIModelMixin {
  ListenableState<Result<List<Service>>> get services;

  Future<void> loadServices();
}
