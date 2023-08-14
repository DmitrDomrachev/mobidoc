import 'package:mobidoc/api/service/api_client.dart';
import 'package:mobidoc/features/login/model/user_login_model.dart';
import 'package:mobidoc/persistence/storage/auth_storage/auth_storage.dart';

/// AuthRepository is a class responsible for managing user authentication and token handling.
class AuthRepository {
  final ApiClient _apiClient;
  final AuthStorage _authStorage;

  /// Creates an instance [AuthRepository].
  AuthRepository(this._apiClient, this._authStorage);

  /// Retrieves the JWT from local storage.
  Future<String?> getToken() {
    return _authStorage.readJWT();
  }

  /// Requests a new JWT from the server using the provided [loginModel].
  Future<String> requestToken(UserLoginModel loginModel) async {
    return (await _apiClient.getJWT(loginModel)).token;
  }

  /// Saves the provided [value] as the JWT into local storage.
  Future<void> saveToken(String value) async {
    await _authStorage.saveJWT(value);
  }
}
