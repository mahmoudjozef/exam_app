import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/utils/app_validation.dart';
import 'package:exam_app/features/auth/presentation/cubit/forget_password/forget_password_cubit.dart';
import 'package:exam_app/features/auth/presentation/cubit/forget_password/forget_password_events.dart';
import 'package:exam_app/features/auth/presentation/cubit/forget_password/forget_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import 'custom_button.dart';
import 'auth_header.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  final TextEditingController _emailController = TextEditingController();

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<ForgetPasswordCubit>(),
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          final data = state.sendEmailState.data;

          if (data != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: AppColors.primaryColor,
                content: Center(
                  child: Text(
                    data.message,
                  ),
                ),
              ),
            );
            context.push('/email-verification', extra: _emailController.text);
          }
        },
        builder: (context, state) {
          final isLoading = state.sendEmailState.isLoading;
          final errorMessage = state.sendEmailState.errorMessage;

          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Form(
              key: _globalKey,
              child: Column(
                children: [
                  SizedBox(height: 32.h),

                  const AuthHeader(
                    title: AppConstants.forgetPasswordTitle,
                    subtitle: AppConstants.forgetPasswordSubtitle,
                  ),

                  SizedBox(height: 24.h),

                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: AppValidation.emailValidation,
                    decoration: InputDecoration(
                      labelText: AppConstants.emailLabel,
                      hintText: AppConstants.emailHint,
                    ),
                  ),

                  if (errorMessage != null)
                    Text(
                      errorMessage,
                      style: const TextStyle(color: Colors.red),
                    ),

                  SizedBox(height: 32.h),

                  isLoading
                      ? CircularProgressIndicator(color: AppColors.primaryColor)
                      : CustomButton(
                          text: AppConstants.continueButton,
                          onPressed: () {
                            if (isLoading) return;

                            if (_globalKey.currentState!.validate()) {
                              context.read<ForgetPasswordCubit>().addEvent(
                                SendEmailEvent(_emailController.text.trim()),
                              );
                            }
                          },
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
