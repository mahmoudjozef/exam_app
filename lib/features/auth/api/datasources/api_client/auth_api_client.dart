import 'package:dio/dio.dart';
import 'package:exam_app/core/constants/app_endpoints.dart';
import 'package:exam_app/features/auth/data/models/forget_password_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants/api_constants.dart';

part 'auth_api_client.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AuthApiClient  {
  factory AuthApiClient(Dio dio, {String? baseUrl}) = _AuthApiClient;

  @POST(AppEndpoints.forgetPasswordEndPoint)
  Future<List<ForgetPasswordResponseModel>> forgetPassword(@Body() String email);
}