import 'package:auto_route/auto_route.dart';
import 'package:mobidoc/features/navigation/domain/entity/app_route_paths.dart';
import 'package:mobidoc/features/navigation/domain/entity/card/card_route.dart';
import 'package:mobidoc/features/navigation/domain/entity/doctors/doctors_route.dart';
import 'package:mobidoc/features/navigation/domain/entity/main/main_route.dart';
import 'package:mobidoc/features/navigation/domain/entity/services/services_route.dart';
import 'package:mobidoc/features/navigation/service/app_router.dart';

/// All routes for the home feature.
final homeRoute = AutoRoute(
  page: HomeRouter.page,
  path: AppRoutePaths.homePath,
  children: [
    mainRoute,
    cardRoute,
    servicesRoute,
    doctorsRoute,
  ],
);
