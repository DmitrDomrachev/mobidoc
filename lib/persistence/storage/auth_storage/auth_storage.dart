abstract interface class AuthStorage {
  Future<void> saveJWT(String value);

  Future<String?> readJWT();
}
