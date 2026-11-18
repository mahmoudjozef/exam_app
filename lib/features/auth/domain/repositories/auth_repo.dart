import 'package:exam_app/config/base_responce/base_responce.dart';
import 'package:exam_app/features/auth/domain/entities/user_entity.dart';
// HomeRepoContract
abstract class AuthRepo {
Future<BaseResponce<UserEntity>> signup();
Future<BaseResponce<UserEntity>> login();
}
