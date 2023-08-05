/// Model with user login data.
class UserLoginModel {
  /// User login.
  final String email;

  /// User password.
  final String password;

  /// Create an instance [UserLoginModel].
  const UserLoginModel({
    required this.email,
    required this.password,
  });

  @override
  String toString() {
    return 'UserLoginModel{login: $email, password: $password}';
  }

  Map<String, dynamic> toJson() =>
      {'email': email, 'password': password} as Map<String, dynamic>;
}
