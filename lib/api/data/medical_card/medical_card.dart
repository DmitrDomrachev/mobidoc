import 'package:json_annotation/json_annotation.dart';

part 'medical_card.g.dart';

/// MedicalCard model.
@JsonSerializable()
class MedicalCard {
  /// MedicalCard's id.
  final int id;

  /// MedicalCard's name.
  final String name;

  /// MedicalCard's description.
  final String description;

  /// MedicalCard's number.
  final int number;

  /// Create an instance of [MedicalCard].
  MedicalCard(this.id, this.name, this.description, this.number);

  /// From json factory.
  factory MedicalCard.fromJson(Map<String, dynamic> json) =>
      _$MedicalCardFromJson(json);
}