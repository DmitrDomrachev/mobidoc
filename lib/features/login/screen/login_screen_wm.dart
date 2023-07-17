import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobidoc/features/common/mixin/theme_mixin.dart';
import 'package:mobidoc/features/login/model/user_login_model.dart';
import 'package:mobidoc/features/login/screen/login_screen_widget.dart';
import 'package:mobidoc/features/login/screen/login_screen_model.dart';
import 'package:mobidoc/features/navigation/domain/entity/app_route_paths.dart';

/// Factory for [LoginScreenWM].
LoginScreenWM loginScreenWMFactory(BuildContext _) {
  return LoginScreenWM(LoginScreenModel());
}

/// Widget model for [LoginScreen].
class LoginScreenWM extends WidgetModel<LoginScreen, LoginScreenModel>
    with ThemeWMMixin
    implements ILoginScreenWM {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  final _loginState = EntityStateNotifier<UserLoginModel>();

  @override
  TextEditingController get loginController => _loginController;

  @override
  TextEditingController get passwordController => _passwordController;

  @override
  ListenableState<EntityState<UserLoginModel>> get loginState => _loginState;

  /// Create an instance [LoginScreenWM].
  LoginScreenWM(super.model);

  @override
  Future<void> login() async {
    _loginState.loading();

    try {
      final user = await _checkUserData(
        _loginController.value.text,
        _passwordController.value.text,
      );
      _loginState.content(user);
      _navigateToHomeScreen(context);
    } catch (_) {
      _loginState.error();
    }
  }

  void _navigateToHomeScreen(BuildContext context) {
    context.router.replaceNamed(AppRoutePaths.homePath);
  }

  Future<UserLoginModel> _checkUserData(String login, String password) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    if (login == '1' && password == '1') {
      return UserLoginModel(
        login: login,
        password: password,
        token: 'testToken',
      );
    }
    throw Exception();
  }
}

/// Interface of [ILoginScreenWM].
abstract class ILoginScreenWM extends IWidgetModel with ThemeIModelMixin {
  /// TextEditingController for login textField.
  TextEditingController get loginController;

  /// TextEditingController for password textField.
  TextEditingController get passwordController;

  /// Listener current state [UserLoginModel].
  ListenableState<EntityState<UserLoginModel>> get loginState;

  /// Method to login.
  Future<void> login();
}
