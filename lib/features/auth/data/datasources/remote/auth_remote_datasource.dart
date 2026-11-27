


import 'package:exam_app/config/base_responce/base_responce.dart';
import 'package:exam_app/features/auth/data/models/forget_password_response_model.dart';
import 'package:exam_app/features/auth/data/models/reset_password_response_model.dart';
import 'package:exam_app/features/auth/data/models/verify_reset_code_response_model.dart';


abstract interface class AuthRemoteDatasource {
  Future<BaseResponse<ForgetPasswordResponseModel>>forgetPasswordDataSource(String email);

  Future<BaseResponse<VerifyResetCodeResponseModel>>verifyResetCodeModel(String code);


  Future<BaseResponse<ResetPasswordResponseModel>>resetPassword(String newPassword, String email);
}