import 'package:exam_app/config/di/di.dart'; // عدّل المسار حسب ملف getIt عندك
import 'package:exam_app/core/constants/app_assets.dart';
import 'package:exam_app/features/auth/data/datasources/local/auth_local_datasource.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _checkAuthAndNavigate();
  }

  Future<void> _checkAuthAndNavigate() async {
    await Future.delayed(const Duration(milliseconds: 800));

    final token = await getIt<AuthLocalDatasource>().getToken();

    if (!mounted) return;

    if (token != null && token.isNotEmpty) {
      context.go('/Screentest'); 
    } else {
      context.go('/LoginView'); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Image.asset(
          AppAssets.loginSplash,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}