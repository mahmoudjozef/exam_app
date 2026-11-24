import 'package:exam_app/config/base_responce/base_responce.dart';
import 'package:exam_app/config/base_responce/safe_api_call.dart';
import 'package:exam_app/features/auth/api/api_client/auth_api_client.dart';
import 'package:exam_app/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:exam_app/features/auth/data/models/dto/login_request_model.dart';
import 'package:exam_app/features/auth/data/models/responses/auth_response_model.dart';
import 'package:exam_app/features/auth/data/models/responses/signup_request_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDatasource)
class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  AuthApiClient authApiClient;
  AuthRemoteDatasourceImpl(this.authApiClient);

  Future<BaseResponse<AuthResponse>> signup(SignupRequest request) async {
    return safeApiCall(() => authApiClient.signUp(request));
  }

  @override
  Future<BaseResponse<AuthResponse>> login(LoginRequestModel loginRequest) {
    return safeApiCall(() => authApiClient.login(loginRequest));
  }
}
