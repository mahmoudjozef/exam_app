import 'package:exam_app/config/base_responce/base_responce.dart';
import 'package:exam_app/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:exam_app/features/auth/data/models/forget_password_response_model.dart';
import 'package:exam_app/features/auth/data/models/reset_password_response_model.dart';
import 'package:exam_app/features/auth/data/models/verify_reset_code_response_model.dart';
import 'package:injectable/injectable.dart';
import '../../../../config/base_responce/safe_api_call.dart';


@Injectable(as: AuthRemoteDatasource)
class DummyAuthRemoteDataSourceImpl implements AuthRemoteDatasource {
  @override
  Future<BaseResponse<ForgetPasswordResponseModel>> forgetPasswordDataSource(
      String email,
      ) {
    return safeApiCall(
          () async => ForgetPasswordResponseModel(
        message: 'Reset code sent successfully',
      ),
    );
  }

  @override
  Future<BaseResponse<VerifyResetCodeResponseModel>> verifyResetCodeModel(
      String code,
      ) {
    return safeApiCall(
          () async => VerifyResetCodeResponseModel(
        status: 'success',
        message: 'Reset code verified successfully',
      ),
    );
  }

  @override
  Future<BaseResponse<ResetPasswordResponseModel>> resetPassword(
      String newPassword,
      String email,
      ) {
    return safeApiCall(
          () async => ResetPasswordResponseModel(
        message: 'Password reset successfully',
      ),
    );
  }
}