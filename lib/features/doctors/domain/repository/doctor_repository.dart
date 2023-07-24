import 'package:mobidoc/api/data/doctor/doctor.dart';
import 'package:mobidoc/api/data/result.dart';

/// Interface of the Doctors repository.
abstract interface class DoctorRepository {
  /// Function that returns a list of doctors.
  Future<Result<List<Doctor>>> getDoctors();
}
