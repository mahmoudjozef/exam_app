import 'package:exam_app/features/auth/data/models/responses/signup_request_model.dart';

sealed class SignupEvents {}

class GetUser extends SignupEvents {
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String rePassword;
  final String phone;
  GetUser({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.rePassword,
    required this.phone,
  });
}

class GetAllDataEvent extends SignupEvents {
  final SignupRequest request;
  GetAllDataEvent(this.request);
} //get All Data
