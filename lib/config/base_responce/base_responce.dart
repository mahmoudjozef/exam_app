import "package:dio/dio.dart";

sealed class BaseResponce<T> {}

class SuccessBaseResponce<T> extends BaseResponce {
  T data;
  SuccessBaseResponce({required this.data});
}

class ErrorBaseResponce<T> extends BaseResponce {
  String errorMsg;
  ErrorBaseResponce.fromErrorMag(this.errorMsg);
  // main constructr
  ErrorBaseResponce({Object? errorObj})
    : errorMsg = errorObj == null ? '' : _getErrorMsg(errorObj);
  //logic msg
  static String _getErrorMsg(Object error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
          return 'No Intarnet';
        case DioExceptionType.badResponse:
          int statusCode = error.response?.statusCode ?? 404;
          return _getStatusCodeErrorMsg(statusCode);
        default:
          return '';
      }
    }
    return '';
  }

  static String _getStatusCodeErrorMsg(int code) {
    switch (code) {
      case 400:
        return 'This is 400 code';
      case 404:
        return 'This is 404 code';
      case 403:
        return 'UnAuthorized';
      case 500:
        return 'Server Error';
      default:
        return '';
    }
  }
}
