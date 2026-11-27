import 'package:exam_app/features/auth/presentation/views/reset_password_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/views/email_verification_view.dart';
import '../../features/auth/presentation/views/forget_password_view.dart';



class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/forget_password',
    routes: [
      GoRoute(
        path: '/forget_password',
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
        path: '/email-verification',
        builder: (context, state) {
          final email = state.extra as String;

          return EmailVerificationView(
            email: email,
          );
        },
      ),

      GoRoute(
        path: '/reset-password',
        builder: (context, state) =>
            ResetPasswordView(email: state.extra as String),
      ),
    ],
  );
}