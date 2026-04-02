import 'package:flutter/material.dart';
import 'package:movies_app/core/constant/app_assets.dart';
import 'package:movies_app/core/extensions/responsive_sized_box_extension.dart';
import 'package:movies_app/features/main_layout/home_tab/widget/movies_category_section.dart';
import 'package:movies_app/features/main_layout/home_tab/widget/new_movies_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> imageList = [
      AppAssets.movie,
      AppAssets.movie,
      AppAssets.movie,
      AppAssets.movie,
      AppAssets.movie,
    ];

    return Column(
      children: [
        NewMoviesSection(imageList: imageList),

        25.verticalSizedBox,
        MoviesCategorySection(),

        25.verticalSizedBox,
        MoviesCategorySection(),

        25.verticalSizedBox,
        MoviesCategorySection(),
      ],
    );
  }
}
