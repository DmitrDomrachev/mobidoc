import 'package:mobidoc/api/data/result.dart';
import 'package:mobidoc/api/data/service/service.dart';
import 'package:mobidoc/api/errors/request_exception.dart';
import 'package:mobidoc/api/service/api_client.dart';
import 'package:mobidoc/features/services/domain/repository/service_repository.dart';

/// Implementation [ServiceRepository].
class ServiceRepositoryImpl implements ServiceRepository {
  final ApiClient _client;

  /// Create an instance [ServiceRepositoryImpl].
  ServiceRepositoryImpl(this._client);

  @override
  Future<Result<List<Service>>> getServices() async {
    try {
      final result = await _client.getServices();
      return Success(result);
    } on RequestException catch (e) {
      return Error(e);
    }
  }
}
