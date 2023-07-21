import 'package:mobidoc/api/data/doctor/doctor.dart';
import 'package:mobidoc/api/service/api_client.dart';
import 'package:mobidoc/features/doctors/domain/repository/doctor_repository.dart';

class DoctorRepositoryImpl implements DoctorRepository {
  DoctorRepositoryImpl(this._client);

  final ApiClient _client;

  @override
  Future<List<Doctor>> getDoctors() {
    return _client.getDoctors();
  }
}
