import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_clean_test/data/datasource/remote_datasource.dart';
import 'package:movies_clean_test/data/repository/movie_repository.dart';
import 'package:movies_clean_test/domain/repository/movies_repository.dart';
import 'package:movies_clean_test/domain/use_case/get_movies.dart';
import 'package:movies_clean_test/view/blocs/get_movies_cubit/get_movies_cubit.dart';

final sl = GetIt.instance;

Future<void> initInjection() async {
  await initMovies();
}

Future<void> initMovies() async {
  // Cubit
  sl.registerFactory(() => GetMoviesCubit(sl()));

  // Use Case
  sl.registerLazySingleton(() => GetMoviesUseCase(sl()));

  // Movie Repository
  sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(sl()));

  // Data sources
  sl.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSourceImp(sl()));

  // External
  sl.registerLazySingleton(() => Dio());
}