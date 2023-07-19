import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:mobidoc/features/navigation/domain/entity/app_route_names.dart';

/// Main widget for [ServicesScreen] module.
@RoutePage(name: AppRouteNames.servicesScreen)
class ServicesScreen extends StatelessWidget {
  /// Create an instance [ServicesScreen].
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Services screen'),
    );
  }
}
