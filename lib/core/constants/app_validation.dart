import 'package:exam_app/core/constants/validation_constants.dart';

class AppValidation {
  AppValidation._();
  static String? userName(String? v) {
    if (v == null || v.trim().isEmpty) {
      return ValidationConstants.usernameEmpty;
    }
    if (v.trim().length < 3) {
      return ValidationConstants.usernameletters;
    }
    if (!RegExp(ValidationConstants.usernamePattern).hasMatch(v)) {
      return ValidationConstants.usernameInvalid;
    }
    return null;
  }

  static String? lastAndFirstName(String? v) {
    if (v == null || v.trim().isEmpty) {
      return ValidationConstants.firstNameEmpty;
    }
    if (v.trim().length < 3) {
      return ValidationConstants.firstNameletters;
    }
    if (!RegExp(ValidationConstants.firstNamePattern).hasMatch(v)) {
      return ValidationConstants.firstNameInvalid;
    }
    return null;
  }

  static String? email(String? v) {
    if (v == null || v.trim().isEmpty) {
      return ValidationConstants.emailEmpty;
    }
    if (!RegExp(ValidationConstants.emailPattern).hasMatch(v)) {
      return ValidationConstants.emailInvalid;
    }
    return null;
  }

  static String? password(String? v) {
    if (v == null || v.isEmpty) {
      return ValidationConstants.passwordRequired;
    }
    if (v.length < 8) {
      return ValidationConstants.passwordTooShort;
    }
    return null;
  }

  static String? rePassword(String? v, String passCtrl) {
    if (v == null || v.isEmpty) {
      return ValidationConstants.confirmPasswordRequired;
    }
    if (v != passCtrl) {
      return ValidationConstants.passwordsDontMatch;
    }
    return null;
  }

  static String? phone(String? v) {
    if (v == null || v.trim().isEmpty) {
      return ValidationConstants.phoneRequired;
    }
    if (!RegExp(ValidationConstants.phonePattern).hasMatch(v.trim())) {
      return ValidationConstants.phoneInvalid;
    }
    return null;
  }
}
