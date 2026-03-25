import 'package:flutter/material.dart';
import 'package:movies_app/core/theme/app_text_styles.dart';
import '../theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final dynamic prefixIcon;
  final bool isPassword;
  final Widget? suffixIcon;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.isPassword = false,
    this.suffixIcon,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      style: AppTextStyles.regular16(color: AppColors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyles.regular16(color: AppColors.white),
        prefixIcon: prefixIcon is IconData
            ? Icon(prefixIcon, color: AppColors.white)
            : ImageIcon(AssetImage(prefixIcon), color: AppColors.white),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: AppColors.secondaryBackgroundColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
