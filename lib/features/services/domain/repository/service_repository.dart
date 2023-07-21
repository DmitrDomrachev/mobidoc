import 'package:mobidoc/api/data/result.dart';
import 'package:mobidoc/api/data/service/service.dart';

abstract interface class ServiceRepository {
  Future<Result<List<Service>>> getServices();
}
