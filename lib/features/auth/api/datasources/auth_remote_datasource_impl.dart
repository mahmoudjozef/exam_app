import 'dart:developer';

import 'package:exam_app/config/base_responce/base_responce.dart';
import 'package:exam_app/features/auth/api/api_client/auth_api_client.dart';
import 'package:exam_app/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:exam_app/features/auth/data/models/forget_password_request_model.dart';
import 'package:exam_app/features/auth/data/models/forget_password_response_model.dart';
import 'package:exam_app/features/auth/data/models/reset_password_request_model.dart';
import 'package:exam_app/features/auth/data/models/reset_password_response_model.dart';
import 'package:exam_app/features/auth/data/models/verify_reset_code_request_model.dart';
import 'package:exam_app/features/auth/data/models/verify_reset_code_response_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRemoteDatasource)
class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  AuthApiClient authApiClient;

  AuthRemoteDatasourceImpl(this.authApiClient);

  @override
  Future<BaseResponse<ForgetPasswordResponseModel>> forgetPasswordDataSource(
    String email,
  ) async {
    try {
      ForgetPasswordResponseModel forgetPasswordResponseModel =
          await authApiClient.forgetPassword(
            ForgetPasswordRequestModel(email: email),
          );
      log("Sent email success in Remote data source");
      return SuccessBaseResponse<ForgetPasswordResponseModel>(
        data: forgetPasswordResponseModel,
      );
    }  catch (e) {
      log("Sent email failure in Remote data source");
      return ErrorBaseResponse<ForgetPasswordResponseModel>(error: e);
    }
  }

  @override
  Future<BaseResponse<VerifyResetCodeResponseModel>> verifyResetCodeModel(String code)async {
    try {
      var result = await authApiClient.verifyResetCode(VerifyResetCodeRequestModel(code: code));
      return SuccessBaseResponse<VerifyResetCodeResponseModel>(data: result);
    } catch (e) {
      return ErrorBaseResponse<VerifyResetCodeResponseModel>(error: e);
    }
  }

  @override
  Future<BaseResponse<ResetPasswordResponseModel>> resetPassword(String newPassword)async {
    try {
      var response = await authApiClient.resetPassword(ResetPasswordRequestModel(newPassword: newPassword));
      return SuccessBaseResponse<ResetPasswordResponseModel>(data: response);
    } catch (e) {
      return ErrorBaseResponse<ResetPasswordResponseModel>(error: e);
    }
  }
}
