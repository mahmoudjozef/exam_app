import 'dart:developer';

import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/core/constants/app_constants.dart';
import 'package:exam_app/core/theme/app_text_styles.dart';
import 'package:exam_app/features/auth/data/models/responses/signup_request_model.dart';
import 'package:exam_app/features/auth/presentation/cubit/signup/signup_events.dart';
import 'package:exam_app/features/auth/presentation/cubit/signup/signup_state.dart';
import 'package:exam_app/features/auth/presentation/cubit/signup/signup_viewmodel.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            child: BlocConsumer<SignupViewmodel, SignupState>(
              listener: (context, state) {
                if (state.errorMsg != null) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.errorMsg!)));
                }
                if (state.userStete != null) {
                  log(
                    '>>>>>>>>>>Signup success: ${state.userStete}',
                    name: 'SignupView',
                  );
                  
                }
              },
              builder: (context, state) {
                return SingleChildScrollView(
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
                          if (v == null || v.trim().isEmpty) {
                            return AppConstants.usernameEmpty;
                          }
                          if (v.trim().length < 3) {
                            return AppConstants.usernameletters;
                          }
                          if (!RegExp(AppConstants.usernamePattern)
                              .hasMatch(v)) {
                            return AppConstants.usernameInvalid;
                          }
                          return null;
                        },
                      ),
                      //row (first and last name)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //firstName
                          Expanded(
                            child: TextFormField(
                              controller: _firstNameCtrl,
                              decoration: const InputDecoration(
                                labelText: AppConstants.firstNameLabel,
                                hintText: AppConstants.firstNameHint,
                              ),
                              validator: (v) {
                                if (v == null || v.trim().isEmpty) {
                                  return AppConstants.firstNameEmpty;
                                }
                                if (v.trim().length < 3) {
                                  return AppConstants.firstNameletters;
                                }
                                if (!RegExp(AppConstants.firstNamePattern)
                                    .hasMatch(v)) {
                                  return AppConstants.firstNameInvalid;
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(width: 16.w),
                          //lastName
                          Expanded(
                            child: TextFormField(
                              controller: _lastNameCtrl,
                              decoration: const InputDecoration(
                                labelText: AppConstants.lastNameLabel,
                                hintText: AppConstants.lastNameHint,
                              ),
                              validator: (v) {
                                if (v == null || v.trim().isEmpty) {
                                  return AppConstants.lastNameEmpty;
                                }
                                if (v.trim().length < 3) {
                                  return AppConstants.lastNameletters;
                                }
                                if (!RegExp(AppConstants.lastNamePattern)
                                    .hasMatch(v)) {
                                  return AppConstants.lastNameInvalid;
                                }
                                return null;
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
                          if (v == null || v.trim().isEmpty) {
                            return AppConstants.emailEmpty;
                          }
                          if (!RegExp(AppConstants.emailPattern).hasMatch(v)) {
                            return AppConstants.emailInvalid;
                          }
                          return null;
                        },
                      ),
                      //row (pass and confirm)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _passwordCtrl,
                              decoration: const InputDecoration(
                                labelText: AppConstants.passwordLabel,
                                hintText: AppConstants.passwordHint,
                              ),
                              validator: (v) {
                                if (v == null || v.isEmpty) {
                                  return AppConstants.passwordRequired;
                                }
                                if (v.length < 8) {
                                  return AppConstants.passwordTooShort;
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(width: 16.w),
                          //rePass
                          Expanded(
                            child: TextFormField(
                              controller: _rePasswordCtrl,
                              decoration: const InputDecoration(
                                labelText: AppConstants.confirmPasswordLabel,
                                hintText: AppConstants.confirmPasswordHint,
                              ),
                              validator: (v) {
                                if (v == null || v.isEmpty) {
                                  return AppConstants.confirmPasswordRequired;
                                }
                                if (v != _passwordCtrl.text) {
                                  return AppConstants.passwordsDontMatch;
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      //phoneNamber
                      TextFormField(
                        controller: _phoneCtrl,
                        decoration: const InputDecoration(
                          labelText: AppConstants.phoneLabel,
                          hintText: AppConstants.phoneHint,
                        ),
                        validator: (v) {
                          if (v == null || v.trim().isEmpty) {
                            return AppConstants.phoneRequired;
                          }
                          if (!RegExp(AppConstants.phonePattern)
                              .hasMatch(v.trim())) {
                            return AppConstants.phoneInvalid;
                          }
                          return null;
                        },
                      ),

                      //elevveted button
                      SizedBox(
                        width: 343.w,
                        child: ElevatedButton(
                          onPressed: state.isLoading
                              ? null
                              : () {
                                  if (_formKey.currentState!.validate()) {
                                    final request = SignupRequest(
                                      username: _usernameCtrl.text.trim(),
                                      firstName: _firstNameCtrl.text.trim(),
                                      lastName: _lastNameCtrl.text.trim(),
                                      email: _emailCtrl.text.trim(),
                                      password: _passwordCtrl.text,
                                      rePassword: _rePasswordCtrl.text,
                                      phone: _phoneCtrl.text.trim(),
                                    );
                                    log('1- VIEW REQUEST: ${request.toJson()}');
                                    context.read<SignupViewmodel>().onEvent(
                                      GetUser(request),
                                    );
                                  }
                                },
                          child: state.isLoading
                              ? const CircularProgressIndicator()
                              : Text(AppConstants.signUpButton),
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
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}