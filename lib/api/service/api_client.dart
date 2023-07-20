import 'package:dio/dio.dart';
import 'package:mobidoc/api/data/doctor/doctor.dart';
import 'package:mobidoc/api/data/service/service.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;

  @GET('doctors')
  Future<List<Doctor>> getDoctors();

  @GET('services')
  Future<List<Service>> getServices();
}
