/// Model with user login data.
class UserLoginModel {
  final String login;
  final String password;
  final String token;

  /// Create an instance [UserLoginModel].
  const UserLoginModel({
    required this.login,
    required this.password,
    required this.token,
  });

  @override
  String toString() {
    return 'UserLoginModel{login: $login, password: $password, token: $token}';
  }
}
