import 'package:auto_route/auto_route.dart';
import 'package:mobidoc/features/navigation/domain/entity/app_route_paths.dart';
import 'package:mobidoc/features/navigation/service/app_router.dart';

/// All routes for the dash feature.
final dashRoutes = AutoRoute(
  page: DashRouter.page,
  path: AppRoutePaths.dashPath,
);
