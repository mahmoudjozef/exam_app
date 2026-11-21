import 'package:dio/dio.dart';
import 'package:exam_app/core/constants/app_constants.dart';
import 'package:exam_app/core/constants/app_endpoints.dart';
import 'package:injectable/injectable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
@module
@singleton
abstract class DioModule {
  Dio get dio => Dio(
    BaseOptions(
      baseUrl: AppEndpoints.baseUrl,
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  );
}
