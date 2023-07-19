import 'package:auto_route/auto_route.dart';
import 'package:mobidoc/features/navigation/domain/entity/app_route_paths.dart';
import 'package:mobidoc/features/navigation/service/app_router.dart';

/// Route for the main feature.
final mainRoute = AutoRoute(
  page: MainRouter.page,
  path: AppRoutePaths.mainPath,
);
