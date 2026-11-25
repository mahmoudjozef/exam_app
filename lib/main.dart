import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/core/theme/app_theme.dart';
import 'package:exam_app/features/auth/presentation/screens/ScreenTest.dart';
import 'package:exam_app/features/auth/presentation/screens/login_view.dart';
import 'package:exam_app/features/auth/presentation/screens/signup_view.dart';
import 'package:exam_app/features/auth/presentation/screens/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

void main() {
  configureDependencies();

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    initialLocation: '/SplashView',
    routes: [
      GoRoute(
        path: '/LoginView',
        builder: (context, state) =>  LoginView(),
      ),
      GoRoute(
        path: '/SplashView',
        builder: (context, state) =>  SplashView(),
      ),
       GoRoute(
        path: '/Screentest',
        builder: (context, state) =>  Screentest(),
      ),
      GoRoute(
        path: '/SignupView',
        builder: (context, state) =>  SignupView(),
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: _router,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
        );
      },
    );
  }
}
