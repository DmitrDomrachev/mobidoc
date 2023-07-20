import 'package:json_annotation/json_annotation.dart';

part 'doctor.g.dart';

@JsonSerializable()
class Doctor {
  final int id;
  final String name;
  final String bio;
  final String? photo;
  final String speciality;
  final DateTime createdAt;

  Doctor(this.id, this.name, this.bio, this.photo, this.speciality,
      this.createdAt);

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorToJson(this);
}
