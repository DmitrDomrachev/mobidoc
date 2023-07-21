import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:mobidoc/features/navigation/domain/entity/app_route_names.dart';

/// Main widget for CardScreen module.
@RoutePage(name: AppRouteNames.cardScreen)
class CardScreen extends StatelessWidget {
  /// Create an instance [CardScreen].
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Card screen'),
    );
  }
}
