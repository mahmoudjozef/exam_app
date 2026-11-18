import 'package:exam_app/config/base_responce/base_responce.dart';
import 'package:exam_app/features/auth/api/api_client/auth_api_client.dart';
import 'package:exam_app/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:exam_app/features/auth/data/models/responses/auth_response_model.dart';
import 'package:exam_app/features/auth/domain/entities/user_entity.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRemoteDatasource)
class AuthRemoteDatasourceImpl extends AuthRemoteDatasource {
  AuthApiClient authApiClient;
  AuthRemoteDatasourceImpl(this.authApiClient);

  @override
  Future<BaseResponce<AuthResponse>> signup() async {
    // TODO: implement signup
    try {
      //Success
      final AuthResponse authResponse = await authApiClient.signUp();
      final successObj = SuccessBaseResponce<AuthResponse>(data: authResponse);
      return successObj;
    } catch (e) {
      //Error
      return ErrorBaseResponce<AuthResponse>(errorObj: e);
    }
  }
}
