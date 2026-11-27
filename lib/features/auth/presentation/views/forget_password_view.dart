import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/forget_password_view_body.dart';



class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: AppConstants.passwordAppBarTitle),
      body: SafeArea(child: ForgetPasswordViewBody()),
    );
  }
}