import 'package:mobidoc/features/login/domain/repository/auth_repository.dart';
import 'package:mobidoc/features/login/model/user_login_model.dart';

class AuthInteractor {
  final AuthRepository _repository;

  AuthInteractor(this._repository);

  Future<bool> isAuth() async {
    final token = await _repository.getToken();
    return (token) != null;
  }

  Future<void> login(UserLoginModel loginModel) async {
    await _repository.saveToken(await _repository.requestToken(loginModel));
  }
}
