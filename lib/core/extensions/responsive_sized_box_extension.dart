import 'package:flutter/material.dart';
import 'package:movies_app/core/responsive/responsive_config.dart';

extension ResponsiveSizedBoxExtension on num {
  Widget get verticalSizedBox =>
      SizedBox(height: this * ResponsiveConfig.heightRatio);

  Widget get horizontalSizedBox =>
      SizedBox(width: this * ResponsiveConfig.widthRatio);
}
