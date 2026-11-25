

import 'package:exam_app/features/auth/data/models/forget_password_request_model.dart';
import 'package:exam_app/features/auth/data/models/forget_password_response_model.dart';
import 'package:exam_app/features/auth/data/models/reset_password_request_model.dart';
import 'package:exam_app/features/auth/data/models/reset_password_response_model.dart';
import 'package:exam_app/features/auth/data/models/verify_reset_code_request_model.dart';
import 'package:exam_app/features/auth/data/models/verify_reset_code_response_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../../../../core/constants/app_endpoints.dart';

part 'auth_api_client.g.dart';

@RestApi(baseUrl: AppEndpoints.baseUrl)
@lazySingleton
abstract class AuthApiClient {
  @factoryMethod
  factory AuthApiClient(Dio dio) = _AuthApiClient;

  @POST(AppEndpoints.forgetPassword)
  Future<ForgetPasswordResponseModel> forgetPassword(@Body() ForgetPasswordRequestModel request);


  @POST(AppEndpoints.verifyResetCode)
  Future<VerifyResetCodeResponseModel> verifyResetCode(@Body() VerifyResetCodeRequestModel request);


  @POST(AppEndpoints.resetPassword)
  Future<ResetPasswordResponseModel> resetPassword(@Body() ResetPasswordRequestModel request);
}