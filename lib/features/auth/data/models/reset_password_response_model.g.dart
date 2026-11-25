// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordResponseModel _$ResetPasswordResponseModelFromJson(
  Map<String, dynamic> json,
) => ResetPasswordResponseModel(
  status: json['status'] as String?,
  message: json['message'] as String?,
);

Map<String, dynamic> _$ResetPasswordResponseModelToJson(
  ResetPasswordResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'message': instance.message};
