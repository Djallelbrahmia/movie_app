import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/usecases/search_movie.dart';
import 'get_trending_movies.mocks.dart';

void main() {
  late GetSearchMovies useCase;

  late MockMovieRepository mockMovieRepository;

  setUp(() => {
        mockMovieRepository = MockMovieRepository(),
        useCase = GetSearchMovies(mockMovieRepository)
      });
  final String tQuery = "Bridge to terabithia";
  final tMoviesList = [
    Movie(id: 1, title: "BTT", overview: "10", posterPath: "IMG1"),
    Movie(id: 1, title: "Home alone", overview: "9", posterPath: "IMG2")
  ];
  test("should get  movies with the query from  the repository", () async {
    //arange
    when(mockMovieRepository.searchMovies(any))
        .thenAnswer((_) async => Right(tMoviesList));
    //act
    final result = await useCase(tQuery);
    //assert
    expect(result, Right(tMoviesList));
    verify(mockMovieRepository.searchMovies(tQuery));
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
