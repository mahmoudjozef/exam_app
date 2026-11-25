import 'package:exam_app/features/auth/data/models/dto/login_request_model.dart';

sealed class LoginEvents {}

class LoginOnPressedEvent extends LoginEvents {
  final String email;
  final String password;
  final bool rememberMe;

  LoginOnPressedEvent({
    required this.email,
    required this.password,
    required this.rememberMe,
  });
}

class LoginAllData extends LoginEvents {
  LoginRequestModel loginRequestModel;
  final bool rememberMe;
  LoginAllData(this.loginRequestModel, this.rememberMe);
}
