import '../constants/app_constants.dart';

class AppValidation {
  AppValidation._();

  static String? emailValidation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppConstants.emailRequired;
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value.trim())) {
      return AppConstants.emailInvalid;
    }

    return null;
  }

  static String? passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return AppConstants.passwordRequired;
    }
    if (value.length < 6) {
      return AppConstants.passwordMinLength;
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return AppConstants.passwordUpperCase;
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return AppConstants.passwordNumber;
    }
    return null;
  }

  static String? confirmPasswordValidation(String? value, String password) {
    if (value == null || value.isEmpty) {
      return AppConstants.confirmPasswordRequired;
    }
    if (value != password) {
      return AppConstants.passwordsNotMatch;
    }
    return null;
  }
}