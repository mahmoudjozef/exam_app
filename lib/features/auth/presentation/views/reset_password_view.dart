import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/reset_password_view_body.dart';


class ResetPasswordView extends StatelessWidget {
  final String email;

  const ResetPasswordView({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: AppConstants.passwordAppBarTitle),
      body: SafeArea(child: ResetPasswordViewBody(email: email)),
    );
  }
}