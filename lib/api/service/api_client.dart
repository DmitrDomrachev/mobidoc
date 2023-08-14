import 'package:dio/dio.dart';
import 'package:mobidoc/api/data/doctor/doctor.dart';
import 'package:mobidoc/api/data/medical_card/medical_card.dart';
import 'package:mobidoc/api/data/service/service.dart';
import 'package:mobidoc/api/data/token/token.dart';
import 'package:mobidoc/features/login/model/user_login_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

/// Abstract class for generating ApiClient.
@RestApi()
abstract class ApiClient {
  /// Factory for [ApiClient].
  factory ApiClient(Dio dio) = _ApiClient;

  /// A method that returns a list of [Doctor] from the server.
  @GET('doctors')
  Future<List<Doctor>> getDoctors();

  /// A method that returns a list of [Service] from the server.
  @GET('services')
  Future<List<Service>> getServices();

  /// A method that return a list of [Service] from the server.
  @GET('medical_cards')
  Future<List<MedicalCard>> getMedicalCards();

  /// A method that return a JWT token from the server.
  @POST('login_check')
  Future<Token> getJWT(@Body() UserLoginModel loginModel);

}
