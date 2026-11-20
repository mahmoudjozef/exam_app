import 'dart:developer';

import 'package:exam_app/config/base_responce/base_responce.dart';
import 'package:exam_app/features/auth/api/api_client/auth_api_client.dart';
import 'package:exam_app/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:exam_app/features/auth/data/models/responses/auth_response_model.dart';
import 'package:exam_app/features/auth/data/models/responses/signup_request_model.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
@LazySingleton(as: AuthRemoteDatasource)
class AuthRemoteDatasourceImpl extends AuthRemoteDatasource {
  AuthApiClient authApiClient;
  AuthRemoteDatasourceImpl(this.authApiClient);

  @override
  Future<BaseResponce<AuthResponse>> signup(SignupRequest request) async {
    // TODO: implement signup
    try {
      //Success
      log('3- DATASOURCE CALLING API WITH: ${request.toJson()}'); //ai
      final AuthResponse authResponse = await authApiClient.signUp(request);
      debugPrint('3- DATASOURCE SUCCESS: ${authResponse.message}');//ai
      final successObj = SuccessBaseResponce<AuthResponse>(data: authResponse);
      return successObj;
    } catch (e, stack) {
      //Error
      log('3- DATASOURCE ERROR: $e');//ai
      if (e is DioException) {
        log('3- DIO STATUS CODE: ${e.response?.statusCode}');//ai
        log('3- DIO RESPONSE DATA: ${e.response?.data}');//ai
        log('3- DIO REQUEST DATA: ${e.requestOptions.data}');//ai
      }
      log('3- STACK: $stack');//ai
      return ErrorBaseResponce<AuthResponse>(errorObj: e);
    }
  }
}
