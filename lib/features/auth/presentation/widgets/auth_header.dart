import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_text_styles.dart';


class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.subtitleMaxWidth = 270,
  });

  final String title;
  final String subtitle;
  final double subtitleMaxWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: AppTextStyles.medium18Black),
        SizedBox(height: 8.h),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: subtitleMaxWidth.w),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.medium14Gray.copyWith(
              fontWeight: FontWeight.w400,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}