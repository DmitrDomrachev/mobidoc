import 'package:mobidoc/api/data/service/service.dart';

abstract interface class ServiceRepository {
  Future<List<Service>> getServices();
}
