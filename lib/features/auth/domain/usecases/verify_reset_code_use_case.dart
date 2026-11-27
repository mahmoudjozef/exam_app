

import 'package:exam_app/config/base_responce/base_responce.dart';
import 'package:exam_app/features/auth/domain/entities/verify_reset_code_entity.dart';
import 'package:exam_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerifyResetCodeUseCase {
  final AuthRepo authRepo;

  VerifyResetCodeUseCase(this.authRepo);


  Future<BaseResponse<VerifyResetCodeEntity>>call({required String code}){
    return authRepo.verifyResetCode(code: code);
  }
}