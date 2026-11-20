import 'package:exam_app/config/base_responce/base_responce.dart';
import 'package:exam_app/features/auth/data/models/responses/signup_request_model.dart';
import 'package:exam_app/features/auth/domain/entities/user_entity.dart';
// HomeRepoContract
abstract class AuthRepo {
Future<BaseResponce<UserEntity>> signup(SignupRequest request);
Future<BaseResponce<UserEntity>> login();
}
