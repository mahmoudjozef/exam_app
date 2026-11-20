import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      primaryColor: AppColors.primaryColor,
      //edit here
      scaffoldBackgroundColor: AppColors.white,

      // AppBar Theme
      appBarTheme: AppBarTheme(
        titleTextStyle: AppTextStyles.medium20Black,
        backgroundColor: AppColors.white,
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.always, // add here
        labelStyle: AppTextStyles.regular16Grey,
        hintStyle: AppTextStyles.bodyLarge,
        errorStyle: const TextStyle(color: AppColors.errorColor), //add here
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
          ),
        ),

        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
          ),
          borderSide: BorderSide(color: AppColors.grayColor, width: 1),
        ),

        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
          ),
          borderSide: BorderSide(color: AppColors.primaryColor, width: 4),
        ),

        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
          ),
          borderSide: BorderSide(color: AppColors.errorColor, width: 1),
        ),

        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
          ),
          borderSide: BorderSide(color: AppColors.errorColor, width: 4),
        ),
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(0, 48),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          textStyle: AppTextStyles.labelLarge,
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.offWhite,
          disabledBackgroundColor: AppColors.grayColor,
        ),
      ),
    );
  }
}
