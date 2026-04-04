import 'package:flutter/material.dart';
import 'package:movies_app/api/api_manager.dart';
import 'package:movies_app/models/new_movies_model/movie.dart';

class HomeViewModel extends ChangeNotifier {
  List<Movie> movies = [];
  List<Movie> genreMovies = [];
  String errorMessage = '';
  bool isLoading = false;

  Future<void> fetchNewMovies() async {
    if (isLoading) return;
    try {
      final newMoviesResponse = await ApiManager().getNewMovies();
      final newMovies = newMoviesResponse.data?.movies ?? [];
      movies.addAll(newMovies);
      errorMessage = '';
    } catch (e) {
      errorMessage = e.toString().replaceAll('Exception: ', '');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  final List<String> availableGenres = [
    'Action',
    'Adventure',
    'Animation',
    'Comedy',
    'Crime',
    'Documentary',
    'Drama',
    'Family',
    'Fantasy',
    'History',
    'Horror',
    'Music',
    'Mystery',
    'Romance',
    'Sci-Fi',
    'Thriller',
  ];

  String genre1Title = '';
  String genre2Title = '';
  String genre3Title = '';
  List<Movie> genre1Movies = [];
  List<Movie> genre2Movies = [];
  List<Movie> genre3Movies = [];

  Future<void> fetchRandomCategories() async {
    isLoading = true;
    notifyListeners();

    try {
      var randomGenres = (List<String>.from(
        availableGenres,
      )..shuffle()).take(3).toList();

      genre1Title = randomGenres[0];
      genre2Title = randomGenres[1];
      genre3Title = randomGenres[2];

      var results = await Future.wait([
        ApiManager().getMoviesByGenre(genre1Title),
        ApiManager().getMoviesByGenre(genre2Title),
        ApiManager().getMoviesByGenre(genre3Title),
      ]);

      genre1Movies = results[0].data?.movies ?? [];
      genre2Movies = results[1].data?.movies ?? [];
      genre3Movies = results[2].data?.movies ?? [];

      errorMessage = '';
    } catch (e) {
      errorMessage = e.toString().replaceAll('Exception: ', '');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
