import 'dart:developer';

import 'package:exam_app/config/base_responce/base_responce.dart';
import 'package:exam_app/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:exam_app/features/auth/data/models/forget_password_response_model.dart';
import 'package:exam_app/features/auth/data/models/reset_password_response_model.dart';
import 'package:exam_app/features/auth/data/models/verify_reset_code_response_model.dart';
import 'package:exam_app/features/auth/domain/entities/forget_password_entity.dart';
import 'package:exam_app/features/auth/domain/entities/reset_password_entity.dart';
import 'package:exam_app/features/auth/domain/entities/verify_reset_code_entity.dart';
import 'package:exam_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDatasource authRemoteDatasource;

  AuthRepoImpl(this.authRemoteDatasource);

  @override
  Future<BaseResponse<ForgetPasswordEntity>> forgetPassword({
    required String email,
  }) async {
    var response = await authRemoteDatasource.forgetPasswordDataSource(
      "mohamed@gmail.com",
    );

    switch (response) {
      case SuccessBaseResponse<ForgetPasswordResponseModel>():
        final ForgetPasswordEntity forgetPasswordEntity = ForgetPasswordEntity(
          code: response.data.code ?? "",
        );
        log("Sent email success in datasource");
        return SuccessBaseResponse(data: forgetPasswordEntity);
      case ErrorBaseResponse<ForgetPasswordResponseModel>():
        return ErrorBaseResponse.fromErrorMessage(response.errorMessage);
    }
  }

  @override
  Future<BaseResponse<VerifyResetCodeEntity>> verifyResetCode({
    required String code,
  }) async {
    var response = await authRemoteDatasource.verifyResetCodeModel(code);

    switch (response) {
      case SuccessBaseResponse<VerifyResetCodeResponseModel>():
        VerifyResetCodeResponseModel verifyResetCodeResponseModel =
            response.data;
        return SuccessBaseResponse<VerifyResetCodeEntity>(
          data: verifyResetCodeResponseModel.toEntity(),
        );
      case ErrorBaseResponse<VerifyResetCodeResponseModel>():
        return ErrorBaseResponse<VerifyResetCodeEntity>.fromErrorMessage(
          response.errorMessage,
        );
    }
  }

  @override
  Future<BaseResponse<ResetPasswordEntity>> resetPassword(
    String newPassword,
  ) async {
    var result = await authRemoteDatasource.resetPassword(newPassword);

    switch (result) {
      case SuccessBaseResponse<ResetPasswordResponseModel>():
        ResetPasswordResponseModel resetPasswordResponseModel = result.data;
        return SuccessBaseResponse<ResetPasswordEntity>(
          data: resetPasswordResponseModel.toEntity(),
        );
      case ErrorBaseResponse<ResetPasswordResponseModel>():
        return ErrorBaseResponse<ResetPasswordEntity>.fromErrorMessage(
          result.errorMessage,
        );
    }
  }
}
