import 'package:exam_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/di/di.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/app_messages.dart';
import '../../../../core/utils/app_validation.dart';
import '../cubit/reset_password/reset_password_cubit.dart';
import '../cubit/reset_password/reset_password_events.dart';
import '../cubit/reset_password/reset_password_state.dart';
import 'auth_header.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class ResetPasswordViewBody extends StatefulWidget {
  final String email;

  const ResetPasswordViewBody({super.key, required this.email});

  @override
  State<ResetPasswordViewBody> createState() => _ResetPasswordViewBodyState();
}

class _ResetPasswordViewBodyState extends State<ResetPasswordViewBody> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<ResetPasswordCubit>(),
      child: BlocListener<ResetPasswordCubit, ResetPasswordState>(
        listenWhen: (previous, current) =>
            previous.resetPassword != current.resetPassword,
        listener: (context, state) {
          final result = state.resetPassword;
          if (result.data != null) {
            AppMessages.showSuccess(context, AppConstants.resetPasswordSuccess);
            // context.go('/login');
          } else if (result.errorMessage != null) {
            AppMessages.showError(context, result.errorMessage!);
          }
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 32.h),
                const AuthHeader(
                  title: AppConstants.resetPasswordTitle,
                  subtitle: AppConstants.resetPasswordSubtitle,
                  subtitleMaxWidth: 320,
                ),
                SizedBox(height: 24.h),
                CustomTextField(
                  controller: _passwordController,
                  label: AppConstants.newPasswordLabel,
                  hint: AppConstants.passwordHint,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  validator: AppValidation.passwordValidation,
                ),
                SizedBox(height: 24.h),
                CustomTextField(
                  controller: _confirmPasswordController,
                  label: AppConstants.confirmPassword,
                  hint: AppConstants.confirmPassword,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) => AppValidation.confirmPasswordValidation(
                    value,
                    _passwordController.text,
                  ),
                ),
                SizedBox(height: 48.h),
                BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
                  buildWhen: (previous, current) =>
                      previous.resetPassword.isLoading !=
                      current.resetPassword.isLoading,
                  builder: (context, state) {
                    return CustomButton(
                      text: AppConstants.continueButton,
                      isLoading: state.resetPassword.isLoading,
                      onPressed: () => _onContinue(context),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onContinue(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;

    context.read<ResetPasswordCubit>().addEvent(
      ResetPasswordEvent(_passwordController.text, widget.email),
    );
  }

}
