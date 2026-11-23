
import 'package:json_annotation/json_annotation.dart';

part 'forget_password_request_model.g.dart';

@JsonSerializable(createFactory: false)
class ForgetPasswordRequestModel {
  final String email;

  ForgetPasswordRequestModel({required this.email});

  Map<String, dynamic> toJson() => _$ForgetPasswordRequestModelToJson(this);
}