import 'package:flutter/material.dart';
import 'package:movies_app/core/theme/app_colors.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: AppColors.primaryColor,));
  }
}
