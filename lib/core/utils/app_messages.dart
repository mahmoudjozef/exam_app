import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AppMessages {
  AppMessages._();

  static void showSuccess(BuildContext context, String message) {
    _show(context, message, AppColors.primaryColor);
  }

  static void showError(BuildContext context, String message) {
    _show(context, message, AppColors.errorColor);
  }

  static void _show(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Center(child: Text(message)),
          backgroundColor: color,
        ),
      );
  }
}