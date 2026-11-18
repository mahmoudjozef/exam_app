import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/features/auth/presentation/cubit/signup/signup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignupViewmodel>(
      create: (context) => getIt<SignupViewmodel>(),
       child: Scaffold(),
    );
  }
}
