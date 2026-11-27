import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/email_verification_view_body.dart';



class EmailVerificationView extends StatelessWidget {
  const EmailVerificationView({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: AppConstants.passwordAppBarTitle ,),
      body: SafeArea(child: EmailVerificationViewBody(email: email)),
    );
  }
}