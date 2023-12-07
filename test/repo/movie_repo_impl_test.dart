import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:mockito/annotations.dart';
import 'package:movie_app/core/errors.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_app/data/models/movie_models.dart';
import 'package:movie_app/data/repositories/movie_repo_impl.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/repositories/movie_repo.dart';
import 'movie_repo_impl_test.mocks.dart';

@GenerateMocks([MovieRemoteDateSource])
void main() async {
  late MovieRepository repositoryImpl;
  late MockMovieRemoteDateSource mockMovieRemoteDateSource;
  setUp(() {
    mockMovieRemoteDateSource = MockMovieRemoteDateSource();
    repositoryImpl = MovieRepositoryImpl(mockMovieRemoteDateSource);
  });
  final tMovieModelList = [
    MovieModel(
        id: 1,
        title: "Test Movie 1",
        overview: "Desc 1",
        posterPath: "/image1"),
    MovieModel(
        id: 2,
        title: "Test Movie 2",
        overview: "Desc 2",
        posterPath: "/image2"),
  ];

  final tMoviesList = [
    Movie(
        id: 1,
        title: "Test Movie 1",
        overview: "Desc 1",
        posterPath: "/image1"),
    Movie(
        id: 2,
        title: "Test Movie 2",
        overview: "Desc 2",
        posterPath: "/image2"),
  ];
  const String tQuery = 'Inception';

  test("should get trending movies from the remote data source", () async {
    when(mockMovieRemoteDateSource.getTrendingMovies())
        .thenAnswer((_) async => tMovieModelList);
    final result = await repositoryImpl.getTrendingMovies();
    expect(result, isA<Right<Failure, List<Movie>>>());
    verify(mockMovieRemoteDateSource.getTrendingMovies());
  });
  test("should get popular movies from the remote data source", () async {
    when(mockMovieRemoteDateSource.getPopularMovies())
        .thenAnswer((_) async => tMovieModelList);
    final result = await repositoryImpl.getPopularMovies();
    expect(result, isA<Right<Failure, List<Movie>>>());
    verify(mockMovieRemoteDateSource.getPopularMovies());
  });
  test("should search movies from the remote data source", () async {
    when(mockMovieRemoteDateSource.searchMovies(tQuery))
        .thenAnswer((_) async => tMovieModelList);
    final result = await repositoryImpl.searchMovies(tQuery);
    expect(result, isA<Right<Failure, List<Movie>>>());
    verify(mockMovieRemoteDateSource.searchMovies(tQuery));
  });

  test(
      'should return ServerFailure when the call to remote data source is unsuccessful',
      () async {
    when(mockMovieRemoteDateSource.getTrendingMovies())
        .thenThrow(ServerException());

    final result = await repositoryImpl.getTrendingMovies();

    expect(result, isA<Left<Failure, List<Movie>>>());
  });

  test(
      'should return ServerFailure when the call to remote data source is unsuccessful',
      () async {
    when(mockMovieRemoteDateSource.getPopularMovies())
        .thenThrow(ServerException());

    final result = await repositoryImpl.getPopularMovies();

    expect(result, isA<Left<Failure, List<Movie>>>());
  });

  test(
      'should return ServerFailure when the call to remote data source is unsuccessful',
      () async {
    when(mockMovieRemoteDateSource.searchMovies(tQuery))
        .thenThrow(ServerException());

    final result = await repositoryImpl.searchMovies(tQuery);

    expect(result, isA<Left<Failure, List<Movie>>>());
  });
}
