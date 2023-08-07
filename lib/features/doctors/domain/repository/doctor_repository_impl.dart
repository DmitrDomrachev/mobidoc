import 'package:mobidoc/api/data/doctor/doctor.dart';
import 'package:mobidoc/api/data/result.dart';
import 'package:mobidoc/api/errors/request_exception.dart';
import 'package:mobidoc/api/service/api_client.dart';
import 'package:mobidoc/features/doctors/domain/repository/doctor_repository.dart';

/// DoctorRepository implementation.
class DoctorRepositoryImpl implements DoctorRepository {
  final ApiClient _client;

  /// Create an instance [DoctorRepositoryImpl].
  DoctorRepositoryImpl(this._client);

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
