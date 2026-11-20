import "package:dio/dio.dart";
import "package:exam_app/core/constants/app_constants.dart";

sealed class BaseResponce<T> {}

class SuccessBaseResponce<T> extends BaseResponce<T> {
  T data;
  SuccessBaseResponce({required this.data});
}

class ErrorBaseResponce<T> extends BaseResponce<T> {
  String errorMsg;
  ErrorBaseResponce.fromErrorMag(this.errorMsg);
  // main constructr
  ErrorBaseResponce({Object? errorObj})
    : errorMsg = errorObj == null
          ? AppConstants.errorMsg
          : _getErrorMsg(errorObj);
  //logic msg
  static String _getErrorMsg(Object error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
          return 'No Intarnet';
        case DioExceptionType.badResponse:
          final serverMsg = _getServerMessage(error.response?.data);
          if (serverMsg != null) return serverMsg;
        default:
          return AppConstants.errorMsg;
      }
    }
    return AppConstants.errorMsg;
  }

  static String? _getServerMessage(dynamic data) {
    if (data is Map) {
      final msg = data['message'] ?? data['error'];
      if (msg is String && msg.isNotEmpty) return msg;
      if (msg is List && msg.isNotEmpty) return msg.join('\n');
    }
    if (data is String && data.isNotEmpty) return data;
    return null;
  }

  static String _getStatusCodeErrorMsg(int code) {
    switch (code) {
      case 400:
        return 'This is 400 code';
      case 404:
        return 'This is 404 code';
      case 403:
        return 'UnAuthorized';
      case 409:
        return 'This data already exists';
      case 500:
        return 'Server Error';
      default:
        return AppConstants.errorMsg;
    }
  }
}
