import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/core/constants/app_constants.dart';
import 'package:exam_app/core/constants/app_validation.dart';
import 'package:exam_app/core/theme/app_text_styles.dart';
import 'package:exam_app/features/auth/presentation/cubit/login/login_events.dart';
import 'package:exam_app/features/auth/presentation/cubit/login/login_state.dart';
import 'package:exam_app/features/auth/presentation/cubit/login/login_viewmodel.dart';
import 'package:exam_app/features/auth/presentation/widgets/remember_me_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _passwordCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _rememberMe = ValueNotifier<bool>(false);
  @override
  void dispose() {
    _emailCtrl;
    _passwordCtrl;
    _rememberMe;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginViewmodel>(),
      child: Scaffold(
        appBar: AppBar(title: Text(AppConstants.login)),
        body: Form(
          key: _formKey,
          child: BlocListener<LoginViewmodel, LoginState>(
            listener: (context, state) {
              final s = state.loginStete;
              if (s.errorMessage != null) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(s.errorMessage!)));
                }
              if (s.data != null) {
                context.go('/Screentest');
              }
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                child: Column(
                  spacing: 15,
                  children: [
                    //email
                    TextFormField(
                      controller: _emailCtrl,
                      validator: (value) {
                        return AppValidation.email(value);
                      },
                      decoration: InputDecoration(
                        labelText: AppConstants.emailLabel,
                        hintText: AppConstants.emailHint,
                      ),
                    ),
                    //pass
                    TextFormField(
                      controller: _passwordCtrl,
                      validator: (value) {
                        return AppValidation.password(value);
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: AppConstants.passwordLabel,
                        hintText: AppConstants.passwordHint,
                      ),
                    ),
                    ValueListenableBuilder<bool>(
                      valueListenable: _rememberMe,
                      builder: (context, value, child) => RememberMeWidget(
                        userOnPressed: value,
                        onChanged: (newValue) => _rememberMe.value = newValue,
                      ),
                    ),
                    SizedBox(
                      width: 343,
                      child: BlocBuilder<LoginViewmodel, LoginState>(
                        buildWhen: (previous, current) =>
                            previous.loginStete.isLoading !=
                            current.loginStete.isLoading,
                        builder: (context, state) {
                          final isLoding = state.loginStete.isLoading;
                          return ElevatedButton(
                            onPressed: isLoding
                                ? null
                                : () {
                                    if (_formKey.currentState!.validate()) {
                                      context
                                          .read<LoginViewmodel>()
                                          .loginOnEvent(
                                            LoginOnPressedEvent(
                                              email: _emailCtrl.text,
                                              password: _passwordCtrl.text,
                                              rememberMe: _rememberMe.value,
                                            ),
                                          );
                                    }
                                  },
                            child: isLoding
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : Text(AppConstants.login),
                          );
                        },
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: AppConstants.dontHaveAnAccount,
                        style: AppTextStyles.regular16Black,
                        children: [
                          TextSpan(
                            text: AppConstants.signUpTitle,
                            style: AppTextStyles.medium16PrimaryUnderline,
                            recognizer: TapGestureRecognizer()..onTap = () {
                              context.go('/SignupView');
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
