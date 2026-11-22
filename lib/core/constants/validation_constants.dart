class ValidationConstants {
  ValidationConstants._();
  // Validation
  static const String usernameEmpty = 'User name is empty';
  static const String usernameletters =
      'The UserName has fewer than 3 letters.';
  static const String usernameInvalid = 'Enter a valid user name';
  static const String usernamePattern = r'^[a-zA-Z0-9_.]+$';

  static const String firstNameEmpty = 'First name is empty';
  static const String firstNameletters =
      'The firstName has fewer than 3 letters.';
  static const String firstNameInvalid = 'Enter a valid first name';
  static const String firstNamePattern = r'^[a-zA-Z]+$';

  static const String lastNameEmpty = 'Last name is empty';
  static const String lastNameletters =
      'The lastName has fewer than 3 letters.';
  static const String lastNameInvalid = 'Enter a valid last name';
  static const String lastNamePattern = r'^[a-zA-Z]+$';

  static const String emailEmpty = 'Email is empty';
  static const String emailInvalid = 'Enter a valid email';
  static const String emailPattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

  static const String passwordRequired = 'Password is required';
  static const String passwordTooShort = 'Min 8 characters';
  static const String confirmPasswordRequired = 'Confirm your password';
  static const String passwordsDontMatch = "Passwords don't match";
  static const String phoneRequired = 'Phone is required';
  static const String phoneInvalid = 'Enter a valid phone number';
  static const String phonePattern = r'^01[0125][0-9]{8}$';
}
