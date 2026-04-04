import 'package:flutter/material.dart';
import 'package:movies_app/core/extensions/responsive_padding_extension.dart';
import 'package:movies_app/core/extensions/responsive_size_extension.dart';
import 'package:movies_app/core/extensions/responsive_sized_box_extension.dart';
import 'package:movies_app/core/theme/app_colors.dart';
import 'package:movies_app/core/theme/app_text_styles.dart';
import 'package:movies_app/features/main_layout/home_tab/widget/movie_image.dart';
import 'package:movies_app/models/new_movies_model/movie.dart';

class MoviesContainer extends StatelessWidget {
  final Movie? movie;
  final bool isHeader;
  const MoviesContainer({super.key, this.movie, this.isHeader = false});

  @override
  Widget build(BuildContext context) {
    final movie = this.movie;
    return Stack(
      children: [
        Container(
          height: (isHeader) ? 300.height : 220.height,
          width: (isHeader) ? 220.width : 150.width,
          margin: (isHeader)
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
                  movie?.rating.toString() ?? 'N/A',
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