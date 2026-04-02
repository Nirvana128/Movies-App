import 'package:flutter/material.dart';
import 'package:movies_app/core/constant/app_assets.dart';
import 'package:movies_app/core/extensions/responsive_size_extension.dart';
import 'package:movies_app/core/theme/app_colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                height: 600.height,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppAssets.movie),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                height: 600.height,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.backgroundColor.withValues(alpha: 0.8),
                      AppColors.backgroundColor.withValues(alpha: 0.6),
                      AppColors.backgroundColor
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    Image.asset(AppAssets.availableNow),
                    const SizedBox(height: 16),
                    Image.asset(AppAssets.watchNow),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
