import 'package:get_it/get_it.dart';
import 'package:movie_app/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_app/data/data_sources/movie_remote_data_source_impl.dart';
import 'package:movie_app/data/repositories/movie_repo_impl.dart';
import 'package:movie_app/domain/repositories/movie_repo.dart';
import 'package:movie_app/domain/usecases/get_popular_movies.dart';
import 'package:movie_app/domain/usecases/get_trending_movies.dart';
import 'package:movie_app/domain/usecases/search_movie.dart';
import 'package:movie_app/presentation/bloc/popular_movie/popular_movies_bloc.dart';
import 'package:movie_app/presentation/bloc/search_movie/search_movies_bloc.dart';
import 'package:movie_app/presentation/bloc/trending_movie/trending_movie_bloc.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;
void init() {
  // Bloc
  getIt.registerFactory(() => PopularMoviesBloc(getPopularMovies: getIt()));
  getIt.registerFactory(() => TrendingMoviesBloc(getTrendingMovies: getIt()));
  getIt.registerFactory(() => SearchMoviesBloc(getSearchMovies: getIt()));

  // Use cases
  getIt.registerLazySingleton(() => GetPopularMovies(getIt()));
  getIt.registerLazySingleton(() => GetTrendingMovies(getIt()));
  getIt.registerLazySingleton(() => GetSearchMovies(getIt()));

  // Repositories
  getIt.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(getIt()));

  // Data sources
  getIt.registerLazySingleton<MovieRemoteDateSource>(
      () => MovieRemoteDateSourceImpl(client: getIt()));

  // Http service
  getIt.registerLazySingleton(() => http.Client());
}
