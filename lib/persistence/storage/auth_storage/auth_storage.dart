/// The AuthStorage is an abstract interface class defining
/// the contract for handling JWT storage.
abstract interface class AuthStorage {

  /// Saves the provided JWT value asynchronously.
  Future<void> saveJWT(String value);

  /// Retrieves the JWT value from storage asynchronously.
  Future<String?> readJWT();
}
