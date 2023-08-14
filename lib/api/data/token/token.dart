import 'package:json_annotation/json_annotation.dart';

part 'token.g.dart';

/// Token model.
@JsonSerializable()
class Token {
  /// The token value.
  final String token;

  /// Create an instance of [Token].
  Token(this.token);

  /// From json factory.
  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
}
