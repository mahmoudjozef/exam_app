import 'package:injectable/injectable.dart';

import '../../../../config/base_responce/base_responce.dart';
import '../entities/forget_password_entity.dart';
import '../repositories/auth_repo.dart';

@injectable
class ResendCodeUseCase {
  final AuthRepo authRepo;

  ResendCodeUseCase(this.authRepo);
  Future<BaseResponse<ForgetPasswordEntity>>call(String email){
    return authRepo.forgetPassword(email: email);
  }
}