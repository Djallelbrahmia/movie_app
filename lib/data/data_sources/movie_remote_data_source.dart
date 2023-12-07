import 'package:movie_app/data/models/movie_models.dart';

abstract class MovieRemoteDateSource {
  Future<List<MovieModel>> getTrendingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> searchMovies(String query);
}
