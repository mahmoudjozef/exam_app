
import 'package:exam_app/config/base_responce/base_responce.dart';
import 'package:exam_app/features/auth/data/models/responses/signup_request_model.dart';
import 'package:exam_app/features/auth/domain/entities/user_entity.dart';
import 'package:exam_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignupUsecase {
  final AuthRepo authRepo;
  SignupUsecase(this.authRepo);
  Future<BaseResponse<UserEntity>> call(SignupRequest request) {
    return authRepo.signup(request);
  }
}
