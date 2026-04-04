import 'package:flutter/material.dart';
import 'package:movies_app/api/api_manager.dart';
import 'package:movies_app/models/new_movies_model/movie.dart';


class HomeViewModel extends ChangeNotifier {
  List<Movie> movies = [];
  String errorMessage = '';
  bool isLoading = false;
  bool hasMore = true;

  Future<void> fetchNewMovies() async {
    if (isLoading) return;

    // isLoading = true;
    // if (page == 1) {
    //   movies = [];
    //   hasMore = true;
    // }
    // notifyListeners();

    try {
      final newMoviesResponse = await ApiManager().getNewMovies();
      final newMovies = newMoviesResponse.data?.movies ?? [];

      if (newMovies.isEmpty) {
        hasMore = false;
      } else {
        movies.addAll(newMovies);
        if (newMovies.length < 3) hasMore = false;
      }
      errorMessage = '';
    } catch (e) {
      errorMessage = e.toString().replaceAll('Exception: ', '');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
