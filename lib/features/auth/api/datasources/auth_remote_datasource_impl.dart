import 'package:exam_app/config/base_responce/base_responce.dart';
import 'package:exam_app/features/auth/api/api_client/auth_api_client.dart';
import 'package:exam_app/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:exam_app/features/auth/data/models/forget_password_request_model.dart';
import 'package:exam_app/features/auth/data/models/forget_password_response_model.dart';
import 'package:exam_app/features/auth/data/models/reset_password_request_model.dart';
import 'package:exam_app/features/auth/data/models/reset_password_response_model.dart';
import 'package:exam_app/features/auth/data/models/verify_reset_code_request_model.dart';
import 'package:exam_app/features/auth/data/models/verify_reset_code_response_model.dart';
import '../../../../config/base_responce/safe_api_call.dart';



class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final AuthApiClient authApiClient;

  AuthRemoteDatasourceImpl(this.authApiClient);

  @override
  Future<BaseResponse<ForgetPasswordResponseModel>> forgetPasswordDataSource(
      String email,
      ) {
    return safeApiCall(
          () => authApiClient.forgetPassword(
        ForgetPasswordRequestModel(email: email),
      ),
    );
  }

  @override
  Future<BaseResponse<VerifyResetCodeResponseModel>> verifyResetCodeModel(
      String code,
      ) {
    return safeApiCall(
          () => authApiClient.verifyResetCode(
        VerifyResetCodeRequestModel(code: code),
      ),
    );
  }

  @override
  Future<BaseResponse<ResetPasswordResponseModel>> resetPassword(
      String newPassword,
      String email,
      ) {
    return safeApiCall(
          () => authApiClient.resetPassword(
        ResetPasswordRequestModel(newPassword: newPassword, email: email),
      ),
    );
  }
}



