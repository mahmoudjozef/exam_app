import 'package:dio/dio.dart';

import '../../core/constants/api_constants.dart';

sealed class BaseResponse<T> {}

class SuccessBaseResponse<T> extends BaseResponse<T> {
  T data;

  SuccessBaseResponse({required this.data});
}

class ErrorBaseResponse<T> extends BaseResponse<T> {
  String errorMessage;

  ErrorBaseResponse.fromErrorMessage(this.errorMessage);

  ErrorBaseResponse({Object? errorObject})
      : errorMessage = errorObject == null
      ? ApiConstants.generalErrorMessage
      : _getErrorMessage(errorObject);

  static String _getErrorMessage(Object errorObject) {
    if (errorObject is DioException) {
      switch (errorObject.type) {
        case DioExceptionType.connectionTimeout:
          return 'Connection timed out. Please check your internet connection and try again.';

        case DioExceptionType.sendTimeout:
          return 'The request is taking too long to send. Please try again.';

        case DioExceptionType.receiveTimeout:
          return 'The server is taking too long to respond. Please try again later.';

        case DioExceptionType.badCertificate:
          return 'A secure connection could not be established. Please try again later.';

        case DioExceptionType.badResponse:
          return _handleBadResponse(errorObject);

        case DioExceptionType.cancel:
          return 'The request was cancelled. Please try again.';

        case DioExceptionType.connectionError:
          return 'No internet connection. Please check your network and try again.';

        case DioExceptionType.unknown:
          return 'Something went wrong. Please try again later.';

        case DioExceptionType.transformTimeout:
          return 'The request took too long to process. Please try again.';
      }
    }

    return 'An unexpected error occurred. Please try again later.';
  }


  static String _handleBadResponse(DioException error) {
    final responseData = error.response?.data;

    if (responseData is Map<String, dynamic>) {
      final message = responseData['message'];

      if (message is String && message.isNotEmpty) {
        return message;
      }
    }

    switch (error.response?.statusCode) {
      case 400:
        return 'Invalid request. Please check your information.';

      case 401:
        return 'Your session has expired. Please log in again.';

      case 403:
        return 'You do not have permission to perform this action.';

      case 404:
        return 'The requested resource was not found.';

      case 422:
        return 'Invalid information. Please review your input.';

      case 429:
        return 'Too many requests. Please wait a moment and try again.';

      case 500:
      case 501:
      case 502:
      case 503:
      case 504:
        return 'Something went wrong on our server. Please try again later.';

      default:
        return 'Unable to complete your request. Please try again.';
    }
  }
}
