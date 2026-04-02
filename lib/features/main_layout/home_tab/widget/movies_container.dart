import 'package:flutter/material.dart';
import 'package:movies_app/core/constant/app_assets.dart';
import 'package:movies_app/core/extensions/responsive_padding_extension.dart';
import 'package:movies_app/core/extensions/responsive_size_extension.dart';
import 'package:movies_app/core/extensions/responsive_sized_box_extension.dart';
import 'package:movies_app/core/theme/app_colors.dart';
import 'package:movies_app/core/theme/app_text_styles.dart';

class MoviesContainer extends StatelessWidget {
  final String? i;
  final String? img;
  const MoviesContainer({super.key, this.i, this.img});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: (i != null) ? 300.height : 220.height,
          width: (i != null) ? null : 150.width,
          margin: (i != null) ? EdgeInsets.symmetric(horizontal: 5.width) : EdgeInsets.zero,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: AssetImage(i ?? img ?? AppAssets.movie), fit: BoxFit.cover),
          ),
        ),

        Padding(
          padding: 10.allPadding,
          child: Container(
            height: 30.height,
            width: 60.width,
            decoration: BoxDecoration(
              color: AppColors.backgroundColor.withValues(alpha: 0.7),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '7.7',
                  style: AppTextStyles.regular16(),
                ),

                5.horizontalSizedBox,
                Icon(Icons.star, color: Colors.amber, size: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
