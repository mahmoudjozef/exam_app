import 'package:exam_app/config/base_responce/base_responce.dart';
import 'package:exam_app/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:exam_app/features/auth/data/models/forget_password_response_model.dart';
import 'package:exam_app/features/auth/domain/entities/forget_password_entity.dart';
import 'package:exam_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';


@LazySingleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo{

  final AuthRemoteDatasource authRemoteDatasource;

  AuthRepoImpl(this.authRemoteDatasource);

  @override
  Future<BaseResponse<ForgetPasswordEntity>> forgetPassword({required String email})async {
    var response =await  authRemoteDatasource.forgetPasswordDataSource(email);

    switch(response){
      case SuccessBaseResponse<ForgetPasswordResponseModel>():
        final ForgetPasswordEntity forgetPasswordEntity = ForgetPasswordEntity(code: response.data?.code ?? "");
        return SuccessBaseResponse(data: forgetPasswordEntity);
      case ErrorBaseResponse<ForgetPasswordResponseModel>():
        return ErrorBaseResponse.fromErrorMessage(response.errorMessage);
    }
  }

}