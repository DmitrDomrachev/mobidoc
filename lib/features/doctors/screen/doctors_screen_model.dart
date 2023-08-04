import 'package:elementary/elementary.dart';
import 'package:mobidoc/features/doctors/domain/repository/doctor_repository.dart';

///  Model for DoctorsScreen module.
class DoctorsScreenModel extends ElementaryModel {
  /// Variable for accessing the repository of doctors.
  final DoctorRepository doctorRepository;

  /// Create an instance [DoctorsScreenModel].
  DoctorsScreenModel(this.doctorRepository);
}
