import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  // Headings
  static TextStyle get medium20Black => TextStyle(
    fontFamily: 'Inter',
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
    height: 1.0,
    color: AppColors.blackColor,
  );

  static TextStyle get medium20Primary => TextStyle(
    fontFamily: 'Inter',
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
    height: 1.0,
    letterSpacing: 1.0,
    color: AppColors.primaryColor,
  );

  static TextStyle get semiBold20Black => TextStyle(
    fontFamily: 'Inter',
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    height: 1.0,
    letterSpacing: 0,
    color: AppColors.blackColor,
  );

  static TextStyle get medium18Black => TextStyle(
    fontFamily: 'Inter',
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    height: 1.0,
    letterSpacing: 0,
    color: AppColors.blackColor,
  );

  // Body Styles
  static TextStyle get bodySmallGray => const TextStyle(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    color: AppColors.textGray,
  );

  static TextStyle get regular13Black => TextStyle(
    fontFamily: 'Inter',
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    height: 1.0,
    letterSpacing: 0,
    color: AppColors.blackColor,
  );

  static TextStyle get regular13Primary => TextStyle(
    fontFamily: 'Inter',
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    height: 1.0,
    letterSpacing: 0,
    color: AppColors.primaryColor,
  );

  static TextStyle get medium13Black => TextStyle(
    fontFamily: 'Inter',
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
    height: 1.0,
    letterSpacing: 0,
    color: AppColors.blackColor,
  );

  static TextStyle get regular16Black => TextStyle(
    fontFamily: 'Inter',
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    height: 1.0,
    letterSpacing: 0,
    color: AppColors.blackColor,
  );

  static TextStyle get regular16Grey => TextStyle(
    fontFamily: 'Inter',
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    height: 1.0,
    letterSpacing: 0,
    color: AppColors.grayColor,
  );

  static TextStyle get medium16Primary => TextStyle(
    fontFamily: 'Inter',
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    height: 1.0,
    letterSpacing: 0,
    color: AppColors.primaryColor,
  );

  static TextStyle get medium14Gray => TextStyle(
    fontFamily: 'Inter',
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    height: 1.0,
    letterSpacing: 0,
    color: AppColors.grayColor,
  );

  static TextStyle get medium14RobotoGray => TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    height: 20 / 14,
    letterSpacing: 0.1,
    color: AppColors.grayColor,
  );

  static TextStyle get regular24RobotoError => TextStyle(
    fontFamily: 'Roboto',
    fontSize: 24.sp,
    fontWeight: FontWeight.w400,
    height: 1.0,
    letterSpacing: 0.5,
    color: AppColors.errorColor,
  );

  static TextStyle get bodyLarge => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.lightGray,
    height: 1.5,
  );

  // Underline Styles
  static TextStyle get regular12BlackUnderline => TextStyle(
    fontFamily: 'Inter',
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    height: 1.0,
    letterSpacing: 0,
    decoration: TextDecoration.underline,
    color: AppColors.blackColor,
  );

  static TextStyle get medium16PrimaryUnderline => TextStyle(
    fontFamily: 'Inter',
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    height: 1.0,
    letterSpacing: 0,
    decoration: TextDecoration.underline,
    color: AppColors.primaryColor,
  );

  // Label Styles
  static TextStyle get labelLarge => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    color: AppColors.offWhite,
  );
  static TextStyle get labelMedium => const TextStyle(
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    color: AppColors.grayColor,
  );
  static TextStyle get label12Regular => const TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    color: AppColors.grayColor,
    fontSize: 12,
  );
  // hint Styles
  static TextStyle get hint12Regular => const TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    color: AppColors.lightGray,
    fontSize: 14,
  );
  // Status Styles
  static TextStyle get bodySmallError => const TextStyle(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    color: AppColors.errorColor,
  );

  static TextStyle get bodyLargeSuccess => TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    color: AppColors.successColor,
  );

  static TextStyle get bodyLargeError => TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    color: AppColors.errorColor,
  );

  static TextStyle get semiBold12Primary => TextStyle(
    fontFamily: 'Inter',
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    height: 1.0,
    letterSpacing: 0,
    color: AppColors.primaryColor,
  );
}
