
import 'package:json_annotation/json_annotation.dart';

part 'reset_password_request_model.g.dart';

@JsonSerializable()
class ResetPasswordRequestModel {
  @JsonKey(name: 'newPassword')
  final String newPassword;
  final String email;

  ResetPasswordRequestModel({
    required this.newPassword, required this.email,
  });

  factory ResetPasswordRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordRequestModelToJson(this);
}
