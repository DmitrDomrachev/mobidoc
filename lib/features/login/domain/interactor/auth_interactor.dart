import 'package:mobidoc/features/login/domain/repository/auth_repository.dart';
import 'package:mobidoc/features/login/model/user_login_model.dart';

/// Interactor for authorization logic.
class AuthInteractor {
  final AuthRepository _repository;

  /// Create an instance [AuthInteractor].
  AuthInteractor(this._repository);

  /// This method asynchronously checks if a JWT token exists in the local storage.
  Future<bool> isAuth() async {
    return (await _repository.getToken()) != null;
  }

  /// Request a new JWT from the server and save it to local storage.
  Future<void> login(UserLoginModel loginModel) async {
    await _repository.saveToken(await _repository.requestToken(loginModel));
  }
}
