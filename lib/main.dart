import 'package:flutter/material.dart';
import 'package:movies_app/core/constant/app_routes.dart';
import 'package:movies_app/core/theme/app_theme.dart';
import 'package:movies_app/features/auth_flow/views/register_view.dart';
import 'package:movies_app/features/onboarding/onboarding_screen.dart';
import 'package:movies_app/features/splash/splash_screen.dart';

void main() {
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: AppTheme.theme,
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (context) => const SplashScreen(),
        AppRoutes.onboarding: (context) => const OnboardingScreen(),
        AppRoutes.register: (context) => const RegisterView(),
      },
    );
  }
}