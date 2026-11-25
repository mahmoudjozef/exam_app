import 'package:exam_app/config/base_responce/base_responce.dart';
import 'package:exam_app/features/auth/data/models/dto/login_request_model.dart';
import 'package:exam_app/features/auth/domain/entities/user_entity.dart';
import 'package:exam_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUsecase {
  AuthRepo authRepo;
  LoginUsecase(this.authRepo);
  Future<BaseResponse<UserEntity>> call(
    LoginRequestModel request,
    bool rememberMe,
  ) {
    return authRepo.login(request, rememberMe);
  }
}
