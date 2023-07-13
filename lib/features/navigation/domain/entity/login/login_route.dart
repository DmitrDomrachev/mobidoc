import 'package:auto_route/auto_route.dart';
import 'package:mobidoc/features/navigation/domain/entity/app_route_paths.dart';
import 'package:mobidoc/features/navigation/service/router.dart';

/// Route for the onboarding feature.
final loginRoute = AutoRoute(
    page: LoginRouter.page, path: AppRoutePaths.loginPath,);
