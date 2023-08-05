/// LoginState is a sealed class representing the different states of a login process.
sealed class LoginState {}

/// Represents the state when the user is not authenticated.
class UnauthenticatedLoginState extends LoginState {}

/// Represents the state when the user is successfully authenticated.
class AuthenticatedLoginState extends LoginState {}

/// Represents the state when the login process is in progress and loading.
class LoadingLoginState extends LoginState {}

/// Represents the state when the provided login data is incorrect or invalid.
class WrongDataLoginState extends LoginState {}

/// Represents the state when an error occurs during the login process.
class RequestErrorLoginState extends LoginState {}
