import 'package:exam_app/config/base_responce/base_responce.dart';
import 'package:exam_app/features/auth/domain/entities/forget_password_entity.dart';
abstract class AuthRepo {
  Future<BaseResponse<ForgetPasswordEntity>>forgetPassword({required String email});
}