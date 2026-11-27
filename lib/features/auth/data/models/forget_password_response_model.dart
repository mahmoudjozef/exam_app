import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/forget_password_entity.dart';

part 'forget_password_response_model.g.dart';

@JsonSerializable(createToJson: false)
class ForgetPasswordResponseModel {
  final String? message;

  ForgetPasswordResponseModel({this.message});

  factory ForgetPasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordResponseModelFromJson(json);

  ForgetPasswordEntity toEntity() => ForgetPasswordEntity(message: message ?? "");
}