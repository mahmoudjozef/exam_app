class AppConstants {
  // Screen
  static const String signUpTitle = 'Sign up';
  static const String signUpButton = 'Signup';
  static const String alreadyHaveAccount = 'Already have an account? ';
  static const String login = 'Login';

  // Labels (اللي فوق الحقل)
  static const String usernameLabel = 'User name';
  static const String firstNameLabel = 'First name';
  static const String lastNameLabel = 'Last name';
  static const String emailLabel = 'Email';
  static const String passwordLabel = 'Password';
  static const String confirmPasswordLabel = 'Confirm password';
  static const String phoneLabel = 'Phone number';

  // Hints (اللي جوه الحقل)
  static const String usernameHint = 'Enter your user name';
  static const String firstNameHint = 'Enter first name';
  static const String lastNameHint = 'Enter last name';
  static const String emailHint = 'Enter your email';
  static const String passwordHint = 'Enter password';
  static const String confirmPasswordHint = 'Confirm password';
  static const String phoneHint = 'Enter phone number';

  // Validation
  static const String usernameEmpty = 'User name is empty';
  static const String usernameletters ='The UserName has fewer than 3 letters.';
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

  // Messages
  static const String signupSuccess = 'Account created successfully';

  static const String errorMsg = 'Somting went worning';
}