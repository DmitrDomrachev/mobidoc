import 'package:mobidoc/api/data/doctor/doctor.dart';
import 'package:mobidoc/api/data/result.dart';
import 'package:mobidoc/api/errors/request_exception.dart';
import 'package:mobidoc/api/service/api_client.dart';
import 'package:mobidoc/features/doctors/domain/repository/doctor_repository.dart';

class DoctorRepositoryImpl implements DoctorRepository {
  DoctorRepositoryImpl(this._client);

  final ApiClient _client;

  @override
  Future<Result<List<Doctor>>> getDoctors() async {
    try {
      final result = await _client.getDoctors();
      return Success(result);
    } on RequestException catch (e) {
      return Error(e);
    }
  }
}
