import 'package:flutter/material.dart';
import 'package:movies_app/core/responsive/responsive_config.dart';

extension ResponsivePadding on num {
  EdgeInsets get rightPadding =>
      EdgeInsets.only(right: this * ResponsiveConfig.widthRatio);
  EdgeInsets get leftPadding =>
      EdgeInsets.only(left: this * ResponsiveConfig.widthRatio);
  EdgeInsets get topPadding =>
      EdgeInsets.only(top: this * ResponsiveConfig.heightRatio);
  EdgeInsets get bottomPadding =>
      EdgeInsets.only(bottom: this * ResponsiveConfig.heightRatio);

  EdgeInsets get horizontalPadding =>
      EdgeInsets.symmetric(horizontal: this * ResponsiveConfig.widthRatio);

  EdgeInsets get verticalPadding =>
      EdgeInsets.symmetric(vertical: this * ResponsiveConfig.heightRatio);

  EdgeInsets get allPadding => EdgeInsets.fromLTRB(
    this * ResponsiveConfig.widthRatio,
    this * ResponsiveConfig.heightRatio,
    this * ResponsiveConfig.widthRatio,
    this * ResponsiveConfig.heightRatio,
  );
}