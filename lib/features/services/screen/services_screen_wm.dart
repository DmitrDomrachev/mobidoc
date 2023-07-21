import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
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
  final _services = StateNotifier<List<Service>>(initValue: []);

  @override
  ListenableState<List<Service>> get services => _services;

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _loadServices();
  }

  Future<void> _loadServices() async {
    try {
      _services.accept(await model.serviceRepository.getServices());
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

abstract class IServicesScreenWidgetModel extends IWidgetModel
    with ThemeIModelMixin {
  ListenableState<List<Service>> get services;
}
