import 'package:elementary/elementary.dart';
import 'package:mobidoc/features/doctors/domain/repository/doctor_repository.dart';

/// Default Elementary model for DoctorsScreen module
class DoctorsScreenModel extends ElementaryModel {
  final DoctorRepository doctorRepository;

  DoctorsScreenModel(this.doctorRepository);
}
