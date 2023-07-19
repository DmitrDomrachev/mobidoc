import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:mobidoc/features/card/screen/card_screen.dart';
import 'package:mobidoc/features/chat/screen/chat_screen.dart';
import 'package:mobidoc/features/dash/screen/dash_screen_export.dart';
import 'package:mobidoc/features/debug/screens/debug_screen/debug_screen_export.dart';
import 'package:mobidoc/features/debug/screens/log_history_screen/log_history_export.dart';
import 'package:mobidoc/features/home/screen/home_screen_export.dart';
import 'package:mobidoc/features/info/screen/info_screen_export.dart';
import 'package:mobidoc/features/login/screen/login_screen_export.dart';
import 'package:mobidoc/features/main/screen/main_screen_export.dart';
import 'package:mobidoc/features/navigation/domain/entity/home/home_route.dart';
import 'package:mobidoc/features/navigation/domain/entity/login/login_route.dart';
import 'package:mobidoc/features/navigation/domain/entity/onboaring/onboarding_routes.dart';
import 'package:mobidoc/features/onboarding/screen/onboarding_screen_export.dart';
import 'package:mobidoc/features/services/screen/services_export.dart';
import 'package:mobidoc/features/temp/screens/temp_screen/temp_screen_export.dart';

part 'app_router.gr.dart';

/// When you add route with screen don't forget add imports of screen and screen_widget_model

@AutoRouterConfig(
  replaceInRouteName: 'ScreenWidget|Screen,Route',
)

/// Main point of the application navigation.
class AppRouter extends _$AppRouter {
  static final AppRouter _router = AppRouter._();

  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes =>
      [
        onboardingRoute,
        loginRoute,
        homeRoute,
      ];

  AppRouter._();

  /// Singleton instance of [AppRouter].
  factory AppRouter.instance() => _router;
}
