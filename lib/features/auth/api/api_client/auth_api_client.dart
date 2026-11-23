

import 'package:exam_app/features/auth/data/models/forget_password_request_model.dart';
import 'package:exam_app/features/auth/data/models/forget_password_response_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../../../../core/constants/app_endpoints.dart';

part 'auth_api_client.g.dart';

@RestApi(baseUrl: AppEndpoints.baseUrl)
abstract class AuthApiClient {
  @factoryMethod
  factory AuthApiClient(Dio dio) = _AuthApiClient;

  @POST(AppEndpoints.forgetPassword)
  Future<ForgetPasswordResponseModel> forgetPassword(@Body() ForgetPasswordRequestModel request);
}