import 'package:exam_app/features/auth/domain/entities/verify_reset_code_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verify_reset_code_response_model.g.dart';

@JsonSerializable()
class VerifyResetCodeResponseModel {
  final String status;
  final String message;

  const VerifyResetCodeResponseModel({
    required this.status,
    required this.message,
  });

  VerifyResetCodeEntity toEntity() {
    return VerifyResetCodeEntity(status: status, message: message);
  }

  factory VerifyResetCodeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyResetCodeResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyResetCodeResponseModelToJson(this);
}
