import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_text_styles.dart';
import '../../../../core/constants/app_constants.dart';

class ResendCodeText extends StatelessWidget {
  const ResendCodeText({super.key, this.onResend});

  final VoidCallback? onResend;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: AppConstants.didntReceiveCode,
        style: AppTextStyles.regular16Black,
        children: [
          TextSpan(
            text: AppConstants.resend,
            style: AppTextStyles.medium16PrimaryUnderline.copyWith(
              fontWeight: FontWeight.w400,
            ),
            recognizer: TapGestureRecognizer()..onTap = onResend,
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}