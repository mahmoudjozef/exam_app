

import 'package:exam_app/config/base_responce/base_responce.dart';
import 'package:exam_app/features/auth/domain/entities/forget_password_entity.dart';
import 'package:exam_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@singleton
class ForgetPasswordUseCase {
  final AuthRepo authRepo;

  ForgetPasswordUseCase(this.authRepo);
  Future<BaseResponse<ForgetPasswordEntity>>call(String email){
    return authRepo.forgetPassword(email: email);
  }
}