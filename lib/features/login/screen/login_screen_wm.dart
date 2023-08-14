import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobidoc/features/app/di/app_scope.dart';
import 'package:mobidoc/features/common/mixin/theme_mixin.dart';
import 'package:mobidoc/features/login/model/login_state.dart';
import 'package:mobidoc/features/login/model/user_login_model.dart';
import 'package:mobidoc/features/login/screen/login_screen.dart';
import 'package:mobidoc/features/login/screen/login_screen_model.dart';
import 'package:mobidoc/features/navigation/domain/entity/app_route_paths.dart';
import 'package:provider/provider.dart';

/// Factory for [LoginScreenWM].
LoginScreenWM loginScreenWMFactory(BuildContext context) {
  final appDependencies = context.read<IAppScope>();
  return LoginScreenWM(LoginScreenModel(appDependencies.authInteractor));
}

/// Widget model for [LoginScreen].
class LoginScreenWM extends WidgetModel<LoginScreen, LoginScreenModel>
    with ThemeWMMixin
    implements ILoginScreenWM {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  final _loginState =
      StateNotifier<LoginState>(initValue: UnauthenticatedLoginState());

  @override
  TextEditingController get loginController => _loginController;

  @override
  TextEditingController get passwordController => _passwordController;

  @override
  ListenableState<LoginState> get loginState => _loginState;

  /// Create an instance [LoginScreenWM].
  LoginScreenWM(super.model);

  @override
  Future<void> initWidgetModel() async {
    super.initWidgetModel();
    _loginState.addListener(() {
      if (_loginState.value is AuthenticatedLoginState) {
        _navigateToHomeScreen();
      }
    });
    if (await model.isAuth()) {
      _loginState.accept(AuthenticatedLoginState());
    }
  }

  @override
  Future<void> login() async {
    _loginState.accept(LoadingLoginState());

    final newState = await model.login(UserLoginModel(
      email: _loginController.value.text,
      password: _passwordController.value.text,
    ));
    _loginState.accept(newState);
  }


  void _navigateToHomeScreen() {
    context.router.replaceNamed(AppRoutePaths.homePath);
  }
}

/// Interface of [ILoginScreenWM].
abstract class ILoginScreenWM extends IWidgetModel with ThemeIModelMixin {
  /// TextEditingController for login textField.
  TextEditingController get loginController;

  /// TextEditingController for password textField.
  TextEditingController get passwordController;

  /// Listener current state [UserLoginModel].
  ListenableState<LoginState> get loginState;

  /// Method to login.
  Future<void> login();
}
