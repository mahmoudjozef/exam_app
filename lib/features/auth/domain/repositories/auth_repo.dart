import 'package:exam_app/config/base_responce/base_responce.dart';
import 'package:exam_app/features/auth/data/models/dto/login_request_model.dart';
import 'package:exam_app/features/auth/data/models/responses/signup_request_model.dart';
import 'package:exam_app/features/auth/domain/entities/user_entity.dart';

// HomeRepoContract
abstract interface class AuthRepo {
  Future<BaseResponse<UserEntity>> signup(SignupRequest request);
  Future<BaseResponse<UserEntity>> login(LoginRequestModel request, bool rememberMe);
}
