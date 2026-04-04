import 'package:dio/dio.dart';
import 'package:movies_app/api/api_end_points.dart';
import 'package:movies_app/models/new_movies_model/new_movies_model.dart';

class ApiManager {
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiEndPoints.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Future<NewMoviesModel> getNewMovies() async {
    try {
      final response = await dio.get(
        ApiEndPoints.listMovies,
        queryParameters: {
          'sort_by': 'date_added',
        },
      );
      return NewMoviesModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.data != null) {
        throw Exception(e.response?.statusMessage ?? 'Unknown Error from Server');
      } else {
        throw Exception(e.message ?? 'Network Error');
      }
    } catch (e) {
      throw Exception('Unknown Error: $e');
    }
  }

  Future<NewMoviesModel> getMoviesByGenre(String genre) async {
    try {
      final response = await dio.get(
        ApiEndPoints.listMovies,
        queryParameters: {'sort_by': 'date_added', 'genre': genre},
      );
      return NewMoviesModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.data != null) {
        throw Exception(
          e.response?.statusMessage ?? 'Unknown Error from Server',
        );
      } else {
        throw Exception(e.message ?? 'Network Error');
      }
    } catch (e) {
      throw Exception('Unknown Error: $e');
    }
  }
}
