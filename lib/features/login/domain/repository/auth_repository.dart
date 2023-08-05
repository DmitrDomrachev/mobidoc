import 'package:mobidoc/api/service/api_client.dart';
import 'package:mobidoc/features/login/domain/repository/auth_repository.dart';
import 'package:mobidoc/features/login/model/user_login_model.dart';
import 'package:mobidoc/persistence/storage/auth_storage/auth_storage.dart';

class AuthRepository {
  final ApiClient apiClient;
  final AuthStorage authStorage;

  AuthRepository(this.apiClient, this.authStorage);

  @override
  Future<String?> getToken() {
    return authStorage.readJWT();
  }

  @override
  Future<String> requestToken(UserLoginModel loginModel) async {
    return (await apiClient.getJWT(loginModel)).token;
  }

  @override
  Future<void> saveToken(String value) async {
    await authStorage.saveJWT(value);
  }
}
