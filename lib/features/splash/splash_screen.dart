import 'dart:async';
import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),

            Center(
              child: Image.asset(
                'assets/images/play_icon.png',
                width: 253,
                height: 253,
                fit: BoxFit.contain,
              ),
            ),

            const Spacer(),

            Column(
              children: [
                Image.asset(
                  'assets/images/route_logo.png',
                  width: 180,
                  height: 76,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 10),

                Image.asset(
                  'assets/images/supervised_by.png',
                  width: 244,
                  height: 38,
                  fit: BoxFit.contain,
                ),
              ],
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}