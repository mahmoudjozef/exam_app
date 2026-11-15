
import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  // Headings
  static const TextStyle medium20Black = TextStyle(
    fontFamily: 'Inter',
    fontSize: 20,
    fontWeight: FontWeight.w500,
    height: 1.0,
    color: AppColors.blackColor,
  );

  static const TextStyle medium20Primary = TextStyle(
    fontFamily: 'Inter',
    fontSize: 20,
    fontWeight: FontWeight.w500,
    height: 1.0,
    letterSpacing: 1.0,
    color: AppColors.primaryColor,
  );

  static const TextStyle semiBold20Black = TextStyle(
    fontFamily: 'Inter',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.0,
    letterSpacing: 0,
    color: AppColors.blackColor,
  );

  static const TextStyle medium18Black = TextStyle(
    fontFamily: 'Inter',
    fontSize: 18,
    fontWeight: FontWeight.w500,
    height: 1.0,
    letterSpacing: 0,
    color: AppColors.blackColor,
  );

  // Body Styles
  static const TextStyle bodySmallGray = TextStyle(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    color: AppColors.textGray,
  );

  static const TextStyle regular13Black = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 1.0,
    letterSpacing: 0,
    color: AppColors.blackColor,
  );

  static const TextStyle regular13Primary = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 1.0,
    letterSpacing: 0,
    color: AppColors.primaryColor,
  );

  static const TextStyle medium13Black = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13,
    fontWeight: FontWeight.w500,
    height: 1.0,
    letterSpacing: 0,
    color: AppColors.blackColor,
  );

  static const TextStyle regular16Black = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    height: 1.0,
    letterSpacing: 0,
    color: AppColors.blackColor,
  );

  static const TextStyle regular16Grey = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.0,
    letterSpacing: 0,
    color: AppColors.grayColor,
  );

  static const TextStyle medium16Primary = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.0,
    letterSpacing: 0,
    color: AppColors.primaryColor,
  );

  static const TextStyle medium14Gray = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.0,
    letterSpacing: 0,
    color: AppColors.grayColor,
  );

  static const TextStyle medium14RobotoGray = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 20 / 14,
    letterSpacing: 0.1,
    color: AppColors.grayColor,
  );

  static const TextStyle regular24RobotoError = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 24,
    fontWeight: FontWeight.w400,
    height: 1.0,
    letterSpacing: 0.5,
    color: AppColors.errorColor,
  );

  // Underline Styles
  static const TextStyle regular12BlackUnderline = TextStyle(
    fontFamily: 'Inter',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.0,
    letterSpacing: 0,
    decoration: TextDecoration.underline,
    color: AppColors.blackColor,
  );

  static const TextStyle medium16PrimaryUnderline = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.0,
    letterSpacing: 0,
    decoration: TextDecoration.underline,
    color: AppColors.primaryColor,
  );

  // Label Styles
  static const TextStyle labelLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    color: AppColors.offWhite,
  );

  static const TextStyle labelMedium = TextStyle(
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    color: AppColors.grayColor,
  );

  // Status Styles
  static const TextStyle bodySmallError = TextStyle(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    color: AppColors.errorColor,
  );

  static const TextStyle bodyLargeSuccess = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    color: AppColors.successColor,
  );

  static const TextStyle bodyLargeError = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    color: AppColors.errorColor,
  );

  static const TextStyle semiBold12Primary = TextStyle(
    fontFamily: 'Inter',
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 1.0,
    letterSpacing: 0,
    color: AppColors.primaryColor,
  );
}
