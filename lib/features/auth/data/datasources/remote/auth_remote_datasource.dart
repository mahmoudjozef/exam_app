import 'package:exam_app/config/base_responce/base_responce.dart';
import 'package:exam_app/features/auth/data/models/responses/auth_response_model.dart';
import 'package:exam_app/features/auth/domain/entities/user_entity.dart';

abstract class AuthRemoteDatasource {
  Future<BaseResponce<AuthResponse>> signup();
}
