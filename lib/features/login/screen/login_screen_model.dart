import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';
import 'package:mobidoc/features/login/domain/interactor/auth_interactor.dart';
import 'package:mobidoc/features/login/model/login_state.dart';
import 'package:mobidoc/features/login/model/user_login_model.dart';
import 'package:mobidoc/features/login/screen/login_screen.dart';

/// Model fol [LoginScreen].
class LoginScreenModel extends ElementaryModel {
  final AuthInteractor _interactor;

  LoginScreenModel(this._interactor);

  Future<bool> isAuth() async {
    return _interactor.isAuth();
  }

  Future<LoginState> login(UserLoginModel loginModel) async {
    try {
      await _interactor.login(loginModel);
      return AuthenticatedLoginState();
    } on DioError catch (e) {
      if (e.toString() ==
          'RequestException: HTTP error: The request returned an invalid status code of 401.') {
        return WrongDataLoginState();
      }
      return RequestErrorLoginState();
    }
  }
}
