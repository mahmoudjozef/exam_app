import 'package:exam_app/config/base_responce/base_responce.dart';

Future<BaseResponse<T>> safeApiCall<T>(Future<T> Function() apiCall) async {
  try {
    return SuccessBaseResponse<T>(data: await apiCall());
  } catch (e) {
    return ErrorBaseResponse<T>(error: e);
  }
}