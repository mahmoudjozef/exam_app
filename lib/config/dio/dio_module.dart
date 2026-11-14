import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
@module
@RestApi(baseUrl: '')
@singleton
abstract class DioModule {
  Dio get dio => Dio(
    BaseOptions(
      baseUrl: '',
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  );
}
