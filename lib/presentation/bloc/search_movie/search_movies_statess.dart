import 'package:movie_app/domain/entities/movie.dart';

abstract class SearchMoviesStates {}

class SearchMoviesStatesInitial extends SearchMoviesStates {}

class SearchMoviesStatesLoading extends SearchMoviesStates {}

class SearchMoviesStatesloaded extends SearchMoviesStates {
  final List<Movie> movies;

  SearchMoviesStatesloaded(this.movies);
}

class SearchMoviesStatesError extends SearchMoviesStates {
  final String error;

  SearchMoviesStatesError(this.error);
}
