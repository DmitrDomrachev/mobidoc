import 'package:json_annotation/json_annotation.dart';

part 'doctor.g.dart';

/// Doctor model.
@JsonSerializable()
class Doctor {
  /// Doctor`s id.
  final int id;

  /// Doctor`s name.
  final String name;

  /// Doctor`s bio.
  final String bio;

  /// Doctor`s photo.
  final String? photo;

  /// Doctor`s speciality.
  final String speciality;

  /// The time when the doctor's record was created on the server.
  final DateTime createdAt;

  /// Create an instance [Doctor].
  Doctor(
    this.id,
    this.name,
    this.bio,
    this.photo,
    this.speciality,
    this.createdAt,
  );

  /// From json factory.
  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);
}
