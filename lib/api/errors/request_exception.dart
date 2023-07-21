import 'package:dio/dio.dart';

class RequestException extends DioError {
  final String message;

  RequestException(this.message, {required super.requestOptions});

  @override
  String toString() {
    return 'RequestException: $message';
  }
}
