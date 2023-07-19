import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:mobidoc/features/common/mixin/theme_mixin.dart';
import 'package:mobidoc/features/services/screen/services_screen.dart';
import 'package:mobidoc/features/services/screen/services_screen_model.dart';

ServicesScreenWidgetModel defaultServicesScreenWidgetModelFactory(
    BuildContext context) {
  return ServicesScreenWidgetModel(ServicesScreenModel());
}

/// Default widget model for ServicesScreenWidget
class ServicesScreenWidgetModel
    extends WidgetModel<ServicesScreenWidget, ServicesScreenModel>
    with ThemeWMMixin
    implements IServicesScreenWidgetModel {
  ServicesScreenWidgetModel(ServicesScreenModel model) : super(model);
}

abstract class IServicesScreenWidgetModel extends IWidgetModel
    with ThemeIModelMixin {}
