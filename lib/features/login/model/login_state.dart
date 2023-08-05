sealed class LoginState {}

class UnauthenticatedLoginState extends LoginState {}

class AuthenticatedLoginState extends LoginState {}

class LoadingLoginState extends LoginState {}

class WrongDataLoginState extends LoginState {}

class RequestErrorLoginState extends LoginState {}
