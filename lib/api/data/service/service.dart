import 'package:json_annotation/json_annotation.dart';

part 'service.g.dart';

/// Service model.
@JsonSerializable()
class Service {
  /// Service id.
  final int id;

  /// Service title.
  final String title;

  /// Service description.
  final String description;

  /// The time when the service record was created on the server.
  final DateTime createdAt;

  /// Create an instance [Service].
  Service(this.id, this.title, this.description, this.createdAt);

  /// From json factory.
  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
}
