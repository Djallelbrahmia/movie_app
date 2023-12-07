import 'package:movie_app/domain/entities/movie.dart';

abstract class PopularMoviesStates {}

class PopularMoviesStatesInitial extends PopularMoviesStates {}

class PopularMoviesStatesLoading extends PopularMoviesStates {}

class PopularMoviesStatesloaded extends PopularMoviesStates {
  final List<Movie> movies;

  PopularMoviesStatesloaded(this.movies);
}

class PopularMoviesStatesError extends PopularMoviesStates {
  final String error;

  PopularMoviesStatesError(this.error);
}
