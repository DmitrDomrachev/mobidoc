import 'package:auto_route/auto_route.dart';
import 'package:mobidoc/features/navigation/domain/entity/app_route_paths.dart';
import 'package:mobidoc/features/navigation/service/app_router.dart';

/// All routes for the info feature.
final infoRoutes = AutoRoute(
  page: InfoRouter.page,
  path: AppRoutePaths.infoPath,
);
