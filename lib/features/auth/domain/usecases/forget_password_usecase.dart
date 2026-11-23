

import 'package:exam_app/config/base_responce/base_responce.dart';
import 'package:exam_app/features/auth/domain/repositories/auth_repo.dart';

class ForgetPasswordUseCase {
  final AuthRepo authRepo;

  ForgetPasswordUseCase(this.authRepo);
  Future<BaseResponse>call(){
    return authRepo.forgetPassword();
  }
}