import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/repositories/movie_repo.dart';

class GetTrendingMovies {
  final MovieRepository repository;

  GetTrendingMovies(this.repository);
  Future<Either<Failure, List<Movie>>> call() async {
    return await repository.getTrendingMovies();
  }
}
