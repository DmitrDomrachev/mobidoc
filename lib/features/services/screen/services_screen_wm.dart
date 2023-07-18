import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:mobidoc/features/services/screen/services_screen_export.dart';

abstract class IServicesScreenWidgetModel extends IWidgetModel {}

ServicesScreenWidgetModel defaultServicesScreenWidgetModelFactory(
    BuildContext _) {
  return ServicesScreenWidgetModel(ServicesScreenModel());
}

// TODO: cover with documentation
/// Default widget model for ServicesScreenWidget
class ServicesScreenWidgetModel
    extends WidgetModel<ServicesScreenWidget, ServicesScreenModel>
    implements IServicesScreenWidgetModel {
  ServicesScreenWidgetModel(ServicesScreenModel model) : super(model);
}
