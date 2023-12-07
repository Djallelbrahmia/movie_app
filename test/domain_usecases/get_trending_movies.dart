import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/repositories/movie_repo.dart';
import 'package:mockito/annotations.dart';
import 'package:movie_app/domain/usecases/get_trending_movies.dart';
import 'get_trending_movies.mocks.dart';

@GenerateMocks([MovieRepository])
void main() {
  late GetTrendingMovies useCase;

  late MockMovieRepository mockMovieRepository;

  setUp(() => {
        mockMovieRepository = MockMovieRepository(),
        useCase = GetTrendingMovies(mockMovieRepository)
      });
  final tMoviesList = [
    Movie(id: 1, title: "BTT", overview: "10", posterPath: "IMG1"),
    Movie(id: 1, title: "Home alone", overview: "9", posterPath: "IMG2")
  ];
  test("should get trending movies from the repository", () async {
    //arange
    when(mockMovieRepository.getTrendingMovies())
        .thenAnswer((_) async => Right(tMoviesList));
    //act
    final result = await useCase();
    //assert
    expect(result, Right(tMoviesList));
    verify(mockMovieRepository.getTrendingMovies());
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
