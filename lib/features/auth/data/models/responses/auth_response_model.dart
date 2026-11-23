import 'package:exam_app/features/auth/data/models/dto/user_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'auth_response_model.g.dart';

@JsonSerializable()
class AuthResponse {
  final String message;
  final String token;
  final User user;

  AuthResponse({
    required this.message,
    required this.token,
    required this.user,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}