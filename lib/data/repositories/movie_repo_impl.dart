import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_app/data/models/movie_models.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/repositories/movie_repo.dart';

class MovieRepositoryImpl implements MovieRepository {
  MovieRemoteDateSource movieRemoteDateSource;
  MovieRepositoryImpl(this.movieRemoteDateSource);
  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    try {
      final List<MovieModel> movieModels =
          await movieRemoteDateSource.getPopularMovies();
      final List<Movie> movies =
          movieModels.map((movieModel) => movieModel.toEntity()).toList();
      return right(movies);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTrendingMovies() async {
    try {
      final List<MovieModel> movieModels =
          await movieRemoteDateSource.getTrendingMovies();
      final List<Movie> movies =
          movieModels.map((movieModel) => movieModel.toEntity()).toList();
      return right(movies);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> searchMovies(String query) async {
    try {
      final List<MovieModel> movieModels =
          await movieRemoteDateSource.searchMovies(query);
      final List<Movie> movies =
          movieModels.map((movieModel) => movieModel.toEntity()).toList();
      return right(movies);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
