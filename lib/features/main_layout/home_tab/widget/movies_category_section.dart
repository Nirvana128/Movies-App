import 'package:flutter/material.dart';
import 'package:movies_app/core/extensions/responsive_padding_extension.dart';
import 'package:movies_app/core/extensions/responsive_size_extension.dart';
import 'package:movies_app/core/extensions/responsive_sized_box_extension.dart';
import 'package:movies_app/core/theme/app_colors.dart';
import 'package:movies_app/core/theme/app_text_styles.dart';
import 'package:movies_app/features/main_layout/home_tab/widget/movies_container.dart';
import 'package:movies_app/models/new_movies_model/movie.dart';

class MoviesCategorySection extends StatelessWidget {
  final String title;
  final List<Movie> movies;
  const MoviesCategorySection({
    super.key,
    required this.title,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 16.horizontalPadding,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.regular20()),
              Spacer(),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                    decoration: TextDecoration.none,
                  ),
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      'See All',
                      style: AppTextStyles.regular14(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    3.horizontalSizedBox,
                    Icon(
                      Icons.arrow_forward,
                      size: 12,
                      color: AppColors.primaryColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
    
          6.verticalSizedBox,
          SizedBox(
            height: 220.height,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return MoviesContainer(movie: movies[index],);
              },
              separatorBuilder: (context, index) {
                return 16.horizontalSizedBox;
              },
            ),
          ),
        ],
      ),
    );
  }
}
