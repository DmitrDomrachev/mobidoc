import 'package:mobidoc/api/data/service/service.dart';
import 'package:mobidoc/api/service/api_client.dart';
import 'package:mobidoc/features/services/domain/repository/service_repository.dart';

class ServiceRepositoryImpl implements ServiceRepository {
  final ApiClient _client;

  ServiceRepositoryImpl(this._client);

  @override
  Future<List<Service>> getServices() {
    return _client.getServices();
  }
}
