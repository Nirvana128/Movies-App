import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/constant/app_assets.dart';
import 'package:movies_app/core/extensions/responsive_size_extension.dart';
import 'package:movies_app/core/theme/app_colors.dart';
import 'package:movies_app/features/main_layout/home_tab/widget/movies_container.dart';

class NewMoviesSection extends StatelessWidget {
  const NewMoviesSection({
    super.key,
    required this.imageList,
  });

  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 600.height,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.movie),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          height: 600.height,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.backgroundColor.withValues(alpha: 0.8),
                AppColors.backgroundColor.withValues(alpha: 0.6),
                AppColors.backgroundColor,
              ],
            ),
          ),
          child: Column(
            children: [
              Image.asset(AppAssets.availableNow),
              Spacer(),
              CarouselSlider(
                options: CarouselOptions(
                  height: 300.height,
                  viewportFraction: 0.5,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.30,
                  scrollDirection: Axis.horizontal,
                ),
                items: imageList.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return MoviesContainer(i: i);
                    },
                  );
                }).toList(),
              ),
              Spacer(),
              Image.asset(AppAssets.watchNow),
            ],
          ),
        ),
      ],
    );
  }
}
