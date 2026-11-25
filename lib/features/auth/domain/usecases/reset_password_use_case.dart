

import 'package:exam_app/config/base_responce/base_responce.dart';
import 'package:exam_app/features/auth/domain/entities/reset_password_entity.dart';
import 'package:exam_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';


@singleton
class ResetPasswordUseCase {

  final AuthRepo authRepo;

  ResetPasswordUseCase(this.authRepo);


  Future<BaseResponse<ResetPasswordEntity>>call(String newPassword){
    return authRepo.resetPassword(newPassword);
  }
}