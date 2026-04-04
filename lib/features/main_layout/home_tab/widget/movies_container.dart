import 'package:flutter/material.dart';
import 'package:movies_app/core/extensions/responsive_padding_extension.dart';
import 'package:movies_app/core/extensions/responsive_size_extension.dart';
import 'package:movies_app/core/extensions/responsive_sized_box_extension.dart';
import 'package:movies_app/core/theme/app_colors.dart';
import 'package:movies_app/core/theme/app_text_styles.dart';
import 'package:movies_app/features/main_layout/home_tab/widget/movie_image.dart';
import 'package:movies_app/models/new_movies_model/movie.dart';

class MoviesContainer extends StatelessWidget {
  final Movie? i;
  const MoviesContainer({super.key, this.i});

  @override
  Widget build(BuildContext context) {
    final movie = i;
    return Stack(
      children: [
        Container(
          height: (i != null) ? 300.height : 220.height,
          width: (i != null) ? 220.width : 150.width,
          margin: (i != null)
              ? EdgeInsets.symmetric(horizontal: 5.width)
              : EdgeInsets.zero,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: MovieImage(movie: movie)
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
                  i?.rating.toString() ?? 'N/A',
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