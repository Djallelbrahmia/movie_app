import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getTrendingMovies();
  Future<Either<Failure, List<Movie>>> searchMovies(String query);
  Future<Either<Failure, List<Movie>>> getPopularMovies();
}
