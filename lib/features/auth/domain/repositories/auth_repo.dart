import 'package:exam_app/config/base_responce/base_responce.dart';
abstract class AuthRepo {
  Future<BaseResponse>forgetPassword();
}