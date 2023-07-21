import 'package:json_annotation/json_annotation.dart';

part 'service.g.dart';

@JsonSerializable()
class Service {
  final int id;
  final String title;
  final String description;
  final DateTime createdAt;

  Service(this.id, this.title, this.description, this.createdAt);

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceToJson(this);
}
