


import 'package:exam_app/config/base_responce/base_responce.dart';
import 'package:exam_app/features/auth/data/models/forget_password_response.dart';

abstract class AuthRemoteDatasource {
  Future<BaseResponse<ForgetPasswordResponseModel>>forgetPassword({required String email});
}