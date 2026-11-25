import 'package:exam_app/config/base_responce/base_responce.dart';
import 'package:exam_app/features/auth/data/models/dto/login_request_model.dart';
import 'package:exam_app/features/auth/data/models/responses/auth_response_model.dart';
import 'package:exam_app/features/auth/data/models/responses/signup_request_model.dart';

abstract interface class AuthRemoteDatasource {
  Future<BaseResponse<AuthResponse>> signup(SignupRequest request);
  Future<BaseResponse<AuthResponse>> login(LoginRequestModel loginRequest);
}
