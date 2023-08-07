import 'package:dio/dio.dart';

/// An exception that is thrown if an error in the client has been handled.
class RequestException extends DioError {
  /// Error information message.
  final String info;

  /// Create an instance [RequestException].
  RequestException(this.info, {required super.requestOptions});

  @override
  String toString() {
    return 'RequestException: $info';
  }
}
