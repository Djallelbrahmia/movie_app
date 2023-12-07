import 'package:bloc/bloc.dart';
import 'package:movie_app/domain/usecases/search_movie.dart';
import 'package:movie_app/presentation/bloc/search_movie/search_movies_event.dart';
import 'package:movie_app/presentation/bloc/search_movie/search_movies_statess.dart';

class SearchMoviesBloc extends Bloc<SearchMoviesEvent, SearchMoviesStates> {
  final GetSearchMovies getSearchMovies;
  SearchMoviesBloc({required this.getSearchMovies})
      : super(SearchMoviesStatesInitial()) {
    on<FetchSearchMoviesEvent>((event, emit) async {
      emit(SearchMoviesStatesLoading());
      final failureOrMovies = await getSearchMovies(event.query);
      failureOrMovies.fold((l) => emit(SearchMoviesStatesError(l.toString())),
          (r) => emit(SearchMoviesStatesloaded(r)));
    });
  }
}
