import 'package:auto_route/annotations.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:mobidoc/features/navigation/domain/entity/app_route_names.dart';
import 'package:mobidoc/features/services/screen/services_screen_export.dart';

// TODO: cover with documentation
/// Main widget for ServicesScreen module
@RoutePage(name: AppRouteNames.servicesScreen)
class ServicesScreenWidget
    extends ElementaryWidget<IServicesScreenWidgetModel> {
  const ServicesScreenWidget({
    Key? key,
    WidgetModelFactory wmFactory = defaultServicesScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IServicesScreenWidgetModel wm) {
    return Center(
      child: Text('Services screen'),
    );
  }
}
