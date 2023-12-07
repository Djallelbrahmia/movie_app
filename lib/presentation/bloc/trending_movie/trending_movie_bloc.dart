import 'package:bloc/bloc.dart';
import 'package:movie_app/domain/usecases/get_trending_movies.dart';
import 'package:movie_app/presentation/bloc/trending_movie/trending_movies_event.dart';
import 'package:movie_app/presentation/bloc/trending_movie/trending_movies_states.dart';

class TrendingMoviesBloc
    extends Bloc<TrendingMoviesEvent, TrendingMoviesStates> {
  final GetTrendingMovies getTrendingMovies;
  TrendingMoviesBloc({required this.getTrendingMovies})
      : super(TrendingMoviesInitial()) {
    on<FetchTrendingMovies>((event, emit) async {
      emit(TrendingMoviesLoading());
      final failureOrMovies = await getTrendingMovies();
      failureOrMovies.fold((l) => emit(TrendingMoviesError(l.toString())),
          (r) => emit(TrendingMoviesloaded(r)));
    });
  }
}
