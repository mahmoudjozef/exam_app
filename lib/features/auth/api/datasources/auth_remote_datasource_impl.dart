import 'package:exam_app/config/base_responce/base_responce.dart';
import 'package:exam_app/features/auth/api/api_client/auth_api_client.dart';
import 'package:exam_app/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:exam_app/features/auth/data/models/forget_password_request_model.dart';
import 'package:exam_app/features/auth/data/models/forget_password_response_model.dart';
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
      return SuccessBaseResponse<ForgetPasswordResponseModel>(data: forgetPasswordResponseModel);
    } on Exception catch (e) {
      return ErrorBaseResponse<ForgetPasswordResponseModel>(error: e);
    }
  }
}
