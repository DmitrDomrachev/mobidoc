import 'package:mobidoc/api/data/doctor/doctor.dart';
import 'package:mobidoc/api/data/result.dart';

abstract interface class DoctorRepository {
  Future<Result<List<Doctor>>> getDoctors();
}
