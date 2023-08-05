import 'package:mobidoc/persistence/storage/auth_storage/auth_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Implementation of the AuthStorage interface.
class AuthStorageImpl implements AuthStorage {
  /// Creates an instance of [AuthStorageImpl].
  AuthStorageImpl();

  @override
  Future<String?> readJWT() async {
    return (await SharedPreferences.getInstance()).getString('jwt');
  }

  @override
  Future<void> saveJWT(String value) async {
    await (await SharedPreferences.getInstance()).setString('jwt', value);
  }
}
