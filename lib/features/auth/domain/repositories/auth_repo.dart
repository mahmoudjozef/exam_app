import 'package:exam_app/config/base_responce/base_responce.dart';
import 'package:exam_app/features/auth/domain/entities/forget_password_entity.dart';
import 'package:exam_app/features/auth/domain/entities/reset_password_entity.dart';
import 'package:exam_app/features/auth/domain/entities/verify_reset_code_entity.dart';

abstract class AuthRepo {
  Future<BaseResponse<ForgetPasswordEntity>> forgetPassword({
    required String email,
  });

  Future<BaseResponse<VerifyResetCodeEntity>> verifyResetCode({
    required String code,
  });


  Future<BaseResponse<ResetPasswordEntity>>resetPassword(String newPassword);
}
