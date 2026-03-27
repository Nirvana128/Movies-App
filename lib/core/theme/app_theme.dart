import 'package:flutter/material.dart';
import 'package:movies_app/core/theme/app_text_styles.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get theme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.backgroundColor,

    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.primaryColor, size: 22),
      backgroundColor: AppColors.backgroundColor,
      elevation: 0,
      centerTitle: true,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: AppTextStyles.regular14(color: AppColors.primaryColor),
    ),

    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        minimumSize: WidgetStateProperty.all(Size(0, 0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textStyle: WidgetStateProperty.all(
          TextStyle(decoration: TextDecoration.underline, fontSize: 12),
        ),
      ),
    ),
  );
}
