import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobidoc/features/navigation/domain/entity/app_route_names.dart';

@RoutePage(
  name: AppRouteNames.loginScreen,
)
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hello'),
      ),
    );
  }
}
