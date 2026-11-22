import 'dart:developer';

import 'package:exam_app/config/base_responce/base_responce.dart';
import 'package:exam_app/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:exam_app/features/auth/data/models/responses/auth_response_model.dart';
import 'package:exam_app/features/auth/data/models/responses/signup_request_model.dart';
import 'package:exam_app/features/auth/domain/entities/user_entity.dart';
import 'package:exam_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  AuthRemoteDatasource authRemoteDatasource;
  AuthRepoImpl(this.authRemoteDatasource);

  @override
  Future<BaseResponse<UserEntity>> login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse<UserEntity>> signup(SignupRequest request) async {
    final BaseResponse<AuthResponse> result = await authRemoteDatasource.signup(
      request,
    );

    switch (result) {
      case SuccessBaseResponse<AuthResponse>():
        UserEntity userEntity = result.data.user.toDomain();
        return SuccessBaseResponse<UserEntity>(data: userEntity);
      case ErrorBaseResponse<AuthResponse>():
        return ErrorBaseResponse<UserEntity>.fromErrorMessage(
          result.errorMessage,
        );
    }
  }
}
