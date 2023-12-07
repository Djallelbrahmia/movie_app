import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/repositories/movie_repo.dart';

class GetSearchMovies {
  final MovieRepository repository;

  GetSearchMovies(this.repository);
  Future<Either<Failure, List<Movie>>> call(String query) async {
    return await repository.searchMovies(query);
  }
}
