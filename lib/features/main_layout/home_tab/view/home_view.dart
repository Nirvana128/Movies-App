import 'package:flutter/material.dart';
import 'package:movies_app/core/extensions/responsive_sized_box_extension.dart';
import 'package:movies_app/core/widgets/custom_error_widget.dart';
import 'package:movies_app/core/widgets/custom_loading_widget.dart';
import 'package:movies_app/core/widgets/empty_widget.dart';
import 'package:movies_app/features/main_layout/home_tab/view_model/home_view_model.dart';
import 'package:movies_app/features/main_layout/home_tab/widget/movies_category_section.dart';
import 'package:movies_app/features/main_layout/home_tab/widget/new_movies_section.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context){
        final homeViewModel = HomeViewModel();
        homeViewModel.fetchNewMovies();
        homeViewModel.fetchRandomCategories();
        return homeViewModel;
      },
      child: Consumer<HomeViewModel>(
        builder: (context, homeViewModel, child) {
          if (homeViewModel.isLoading) {
            return const CustomLoadingWidget();
          } else if (homeViewModel.errorMessage.isNotEmpty) {
            return CustomErrorWidget(errorMessage: homeViewModel.errorMessage);
          } else if (homeViewModel.movies.isNotEmpty) {
            return Column(
              children: [
                NewMoviesSection(imageList: homeViewModel.movies),

                25.verticalSizedBox,
                MoviesCategorySection(
                  title: homeViewModel.genre1Title,
                  movies: homeViewModel.genre1Movies,
                ),

                25.verticalSizedBox,
                MoviesCategorySection(
                  title: homeViewModel.genre2Title,
                  movies: homeViewModel.genre2Movies,
                ),

                25.verticalSizedBox,
                MoviesCategorySection(
                  title: homeViewModel.genre3Title,
                  movies: homeViewModel.genre3Movies,
                ),
              ],
            );
          } else {
            return const EmptyWidget();
          }
        },
      ),
    );
  }
}
