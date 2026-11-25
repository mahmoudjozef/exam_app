import 'dart:developer';

import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/core/constants/app_validation.dart';
import 'package:exam_app/core/constants/app_constants.dart';
import 'package:exam_app/core/theme/app_text_styles.dart';
import 'package:exam_app/features/auth/presentation/cubit/signup/signup_events.dart';
import 'package:exam_app/features/auth/presentation/cubit/signup/signup_state.dart';
import 'package:exam_app/features/auth/presentation/cubit/signup/signup_viewmodel.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _formKey = GlobalKey<FormState>();
  final _usernameCtrl = TextEditingController();
  final _firstNameCtrl = TextEditingController();
  final _lastNameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _rePasswordCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();

  @override
  void dispose() {
    _usernameCtrl.dispose();
    _firstNameCtrl.dispose();
    _lastNameCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _rePasswordCtrl.dispose();
    _phoneCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignupViewmodel>(
      create: (context) => getIt<SignupViewmodel>(),
      child: Scaffold(
        appBar: AppBar(title: Text(AppConstants.signUpTitle)),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Form(
            key: _formKey,
            child: BlocListener<SignupViewmodel, SignupState>(
              listenWhen: (previous, current) =>
                  previous.userStete != current.userStete,
              listener: (context, state) {
                final s = state.userStete;
                if (s.errorMessage != null) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(s.errorMessage!)));
                }
                if (s.data != null) {
                  log(
                    '>>>>>>>>>>Signup success: ${s.data}',
                    name: 'SignupView',
                  );
                  context.go('/login');
                }
              },
              child: SingleChildScrollView(
                child: Column(
                  spacing: 24,
                  children: [
                    //userName
                    TextFormField(
                      controller: _usernameCtrl,
                      decoration: const InputDecoration(
                        labelText: AppConstants.usernameLabel,
                        hintText: AppConstants.usernameHint,
                      ),
                      validator: (v) {
                        return AppValidation.userName(v);
                      },
                    ),
                    // last and firs name
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _firstNameCtrl,
                            decoration: const InputDecoration(
                              labelText: AppConstants.firstNameLabel,
                              hintText: AppConstants.firstNameHint,
                            ),
                            validator: (v) {
                              return AppValidation.lastAndFirstName(v);
                            },
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: TextFormField(
                            controller: _lastNameCtrl,
                            decoration: const InputDecoration(
                              labelText: AppConstants.lastNameLabel,
                              hintText: AppConstants.lastNameHint,
                            ),
                            validator: (v) {
                              return AppValidation.lastAndFirstName(v);
                            },
                          ),
                        ),
                      ],
                    ),
                    //email
                    TextFormField(
                      controller: _emailCtrl,
                      decoration: const InputDecoration(
                        labelText: AppConstants.emailLabel,
                        hintText: AppConstants.emailHint,
                      ),
                      validator: (v) {
                        return AppValidation.email(v);
                      },
                    ),
                    // pass and repass
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _passwordCtrl,
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: AppConstants.passwordLabel,
                              hintText: AppConstants.passwordHint,
                            ),
                            validator: (v) {
                              return AppValidation.password(v);
                            },
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: TextFormField(
                            obscureText: true,
                            controller: _rePasswordCtrl,
                            decoration: const InputDecoration(
                              labelText: AppConstants.confirmPasswordLabel,
                              hintText: AppConstants.confirmPasswordHint,
                            ),
                            validator: (v) {
                              return AppValidation.rePassword(
                                v,
                                _passwordCtrl.text,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    //phone
                    TextFormField(
                      controller: _phoneCtrl,
                      decoration: const InputDecoration(
                        labelText: AppConstants.phoneLabel,
                        hintText: AppConstants.phoneHint,
                      ),
                      validator: (v) {
                        return AppValidation.phone(v);
                      },
                    ),
                    SizedBox(
                      width: 343.w,
                      child: BlocBuilder<SignupViewmodel, SignupState>(
                        buildWhen: (previous, current) =>
                            previous.userStete.isLoading !=
                            current.userStete.isLoading,
                        builder: (context, state) {
                          final isLoading = state.userStete.isLoading;
                          return ElevatedButton(
                            onPressed: isLoading
                                ? null
                                : () {
                                    if (_formKey.currentState!.validate()) {
                                      context.read<SignupViewmodel>().onEvent(
                                        GetUser(
                                          username: _usernameCtrl.text,
                                          firstName: _firstNameCtrl.text,
                                          lastName: _lastNameCtrl.text,
                                          email: _emailCtrl.text,
                                          password: _passwordCtrl.text,
                                          rePassword: _rePasswordCtrl.text,
                                          phone: _phoneCtrl.text,
                                        ),
                                      );
                                    }
                                  },
                            child: isLoading
                                ? const CircularProgressIndicator()
                                : Text(AppConstants.signUpButton),
                          );
                        },
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: AppConstants.alreadyHaveAccount,
                        style: AppTextStyles.regular16Black,
                        children: [
                          TextSpan(
                            text: AppConstants.login,
                            style: AppTextStyles.medium16PrimaryUnderline,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.go('/LoginView');
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
