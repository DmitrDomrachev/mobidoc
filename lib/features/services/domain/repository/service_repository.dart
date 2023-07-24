import 'package:mobidoc/api/data/result.dart';
import 'package:mobidoc/api/data/service/service.dart';

/// Interface of the Service repository.
abstract interface class ServiceRepository {
  /// Function that returns a list of services.
  Future<Result<List<Service>>> getServices();
}
