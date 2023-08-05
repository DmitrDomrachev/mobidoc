import 'package:mobidoc/persistence/storage/auth_storage/auth_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthStorageImpl implements AuthStorage {
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
