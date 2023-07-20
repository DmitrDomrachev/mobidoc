import 'package:mobidoc/api/data/doctor/doctor.dart';

abstract interface class DoctorRepository {
  Future<List<Doctor>> getDoctors();
}
