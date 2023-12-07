import 'package:movie_app/domain/entities/movie.dart';

abstract class TrendingMoviesStates {}

class TrendingMoviesInitial extends TrendingMoviesStates {}

class TrendingMoviesLoading extends TrendingMoviesStates {}

class TrendingMoviesloaded extends TrendingMoviesStates {
  final List<Movie> movies;

  TrendingMoviesloaded(this.movies);
}

class TrendingMoviesError extends TrendingMoviesStates {
  final String error;

  TrendingMoviesError(this.error);
}
