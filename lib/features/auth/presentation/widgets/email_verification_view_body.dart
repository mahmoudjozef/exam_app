import 'package:exam_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/di/di.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/app_messages.dart';
import '../cubit/reset_code/verify_reset_code_cubit.dart';
import '../cubit/reset_code/verify_reset_code_events.dart';
import '../cubit/reset_code/verify_reset_code_state.dart';
import 'auth_header.dart';
import 'otp_input_row.dart';
import 'resend_code_text.dart';

class EmailVerificationViewBody extends StatefulWidget {
  final String email;

  const EmailVerificationViewBody({super.key, required this.email});

  @override
  State<EmailVerificationViewBody> createState() =>
      _EmailVerificationViewBodyState();
}

class _EmailVerificationViewBodyState extends State<EmailVerificationViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<VerifyResetCodeCubit>(),
      child: MultiBlocListener(
        listeners: [
          // Verify code listener
          BlocListener<VerifyResetCodeCubit, VerifyResetCodeState>(
            listenWhen: (previous, current) =>
            previous.verifyResetCode != current.verifyResetCode,
            // Verify code listener
            listener: (context, state) {
              final result = state.verifyResetCode;
              if (result.data != null) {
                context.push('/reset-password', extra: widget.email);
              }else if (result.errorMessage != null) {
                AppMessages.showError(context, result.errorMessage!);
              }
            },
          ),

          // Resend code listener
          BlocListener<VerifyResetCodeCubit, VerifyResetCodeState>(
            listenWhen: (previous, current) =>
            previous.resendCode != current.resendCode,
            // Resend code listener
            listener: (context, state) {
              final result = state.resendCode;
              if (result.data != null) {
                AppMessages.showSuccess(context, AppConstants.resendCodeSuccess);
              } else if (result.errorMessage != null) {
                AppMessages.showError(context, result.errorMessage!);
              }
            },
          ),
        ],
        child: BlocBuilder<VerifyResetCodeCubit, VerifyResetCodeState>(
          builder: (context, state) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  SizedBox(height: 32.h),
                  const AuthHeader(
                    title: AppConstants.emailVerificationTitle,
                    subtitle: AppConstants.emailVerificationSubtitle,
                    subtitleMaxWidth: 300,
                  ),
                  SizedBox(height: 32.h),
                  OtpInputRow(
                    onCompleted: (code) {
                      context.read<VerifyResetCodeCubit>().addEvent(
                        VerifyResetCodeEvent(code),
                      );
                    },
                  ),
                  SizedBox(height: 24.h),
                  ResendCodeText(
                    onResend: state.resendCode.isLoading
                        ? null
                        : () {
                      context.read<VerifyResetCodeCubit>().addEvent(
                        ResendCodeEvent(widget.email),
                      );
                    },
                  ),
                  if (state.verifyResetCode.isLoading ||
                      state.resendCode.isLoading)
                    Padding(
                      padding: EdgeInsets.only(top: 24.h),
                      child: const CircularProgressIndicator(),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}