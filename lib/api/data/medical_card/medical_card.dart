import 'package:json_annotation/json_annotation.dart';

part 'medical_card.g.dart';

@JsonSerializable()
class MedicalCard {
  final int id;
  final String name;
  final String description;
  final int number;

  MedicalCard(this.id, this.name, this.description, this.number);

  factory MedicalCard.fromJson(Map<String, dynamic> json) =>
      _$MedicalCardFromJson(json);
}
