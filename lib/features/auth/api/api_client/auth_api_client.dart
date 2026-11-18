import 'package:dio/dio.dart';
import 'package:exam_app/core/constants/app_endpoints.dart';
import 'package:exam_app/features/auth/data/models/responses/auth_response_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_client.g.dart';

@lazySingleton
@RestApi()
abstract class AuthApiClient {
  @factoryMethod
  factory AuthApiClient(Dio dio) = _AuthApiClient;

  @POST(AppEndpoints.signUp)
  Future<AuthResponse> signUp();
}
