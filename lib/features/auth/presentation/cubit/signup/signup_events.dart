import 'package:exam_app/features/auth/data/models/responses/signup_request_model.dart';

sealed class SignupEvents {}

class GetUser extends SignupEvents {
  final SignupRequest request;
  GetUser(this.request);
}

class GetAllDataEvent extends SignupEvents {
    final SignupRequest request;
  GetAllDataEvent(this.request);
} //get All Data
