import 'package:dio/dio.dart';
import 'package:mobidoc/persistence/storage/auth_storage/auth_storage.dart';

/// JwtInterceptor is responsible for automatically attaching a JWT token
/// to the headers of outgoing API requests.
class JwtInterceptor extends Interceptor {
  /// The storage handler used to retrieve the JWT token.
  final AuthStorage authStorage;

  /// Creates an instance of [JwtInterceptor].
  JwtInterceptor(this.authStorage);

  /// This method is called automatically before each API request is sent.
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await authStorage.readJWT();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }
}
