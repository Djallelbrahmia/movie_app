import 'package:bloc/bloc.dart';
import 'package:movie_app/domain/usecases/get_popular_movies.dart';
import 'package:movie_app/presentation/bloc/popular_movie/popular_movies_event.dart';
import 'package:movie_app/presentation/bloc/popular_movie/popular_movies_states.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesStates> {
  final GetPopularMovies getPopularMovies;
  PopularMoviesBloc({required this.getPopularMovies})
      : super(PopularMoviesStatesInitial()) {
    on<FetchPopularMovies>((event, emit) async {
      emit(PopularMoviesStatesLoading());
      final failureOrMovies = await getPopularMovies();
      failureOrMovies.fold((l) => emit(PopularMoviesStatesError(l.toString())),
          (r) => emit(PopularMoviesStatesloaded(r)));
    });
  }
}
