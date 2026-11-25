import 'package:json_annotation/json_annotation.dart';

part 'verify_reset_code_request_model.g.dart';

@JsonSerializable()
class VerifyResetCodeRequestModel {
  @JsonKey(name: 'code')
  final String code;

  const VerifyResetCodeRequestModel({
    required this.code,
  });

  factory VerifyResetCodeRequestModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyResetCodeRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyResetCodeRequestModelToJson(this);
}