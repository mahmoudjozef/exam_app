


import 'package:exam_app/config/base_responce/base_responce.dart';
import 'package:exam_app/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:exam_app/features/auth/data/models/forget_password_response.dart';

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource{
  @override
  Future<BaseResponse<ForgetPasswordResponseModel>> forgetPassword({required String email}) {
    // TODO: implement forgetPassword
    throw UnimplementedError();
  }
}