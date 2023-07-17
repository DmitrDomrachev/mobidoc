import 'package:auto_route/auto_route.dart';
import 'package:mobidoc/features/navigation/domain/entity/app_route_paths.dart';
import 'package:mobidoc/features/navigation/service/router.dart';

/// Route for the main feature.
final chatRoute = AutoRoute(
  page: ChatRouter.page,
  path: AppRoutePaths.chatPath,
);
