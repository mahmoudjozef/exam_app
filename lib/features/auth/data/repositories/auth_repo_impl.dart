import 'package:exam_app/config/base_responce/base_responce.dart';
import 'package:exam_app/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:exam_app/features/auth/data/models/responses/auth_response_model.dart';
import 'package:exam_app/features/auth/domain/entities/user_entity.dart';
import 'package:exam_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  AuthRemoteDatasource authRemoteDatasource;
  AuthRepoImpl(this.authRemoteDatasource);

  @override
  Future<BaseResponce<UserEntity>> login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<BaseResponce<UserEntity>> signup() async {
    final BaseResponce<AuthResponse> result = await authRemoteDatasource
        .signup();
    switch (result) {
      case SuccessBaseResponce<AuthResponse>():
        UserEntity userEntity = result.data.user.toDomain();
        return SuccessBaseResponce<UserEntity>(data: userEntity);
      case ErrorBaseResponce<AuthResponse>():
        return ErrorBaseResponce<UserEntity>.fromErrorMag(result.errorMsg);
    }
  }
}
