import 'package:exam_app/core/constants/app_constants.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class RememberMeWidget extends StatelessWidget {
  RememberMeWidget({
    super.key,
    required this.userOnPressed,
    required this.onChanged,
  });
  bool userOnPressed;
  ValueChanged<bool> onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        InkWell(
          onTap: () => onChanged(!userOnPressed),
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: AppColors.grayColor, width: 2),
              borderRadius: BorderRadius.circular(2),
            ),
            child: userOnPressed
                ? Icon(Icons.check, size: 14, color: AppColors.grayColor)
                : null,
          ),
        ),
        Text(AppConstants.rememberMe),
      ],
    );
  }
}
