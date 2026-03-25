import 'package:flutter/material.dart';
import 'package:movies_app/core/theme/app_colors.dart';


class AppTextStyles {
  static TextStyle regular14({Color color = AppColors.white}) {
    return TextStyle(fontSize: 14, color: color);
  }

  static TextStyle bold14({Color color = AppColors.white}) {
    return TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: color);
  }

  static TextStyle regular16({Color color = AppColors.white}) {
    return TextStyle(fontSize: 16, color: color);
  }

  static TextStyle medium16({Color color = AppColors.white}) {
    return TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: color);
  }

  static TextStyle regular20({Color color = AppColors.white}) {
    return TextStyle(fontSize: 20, color: color);
  }
}
