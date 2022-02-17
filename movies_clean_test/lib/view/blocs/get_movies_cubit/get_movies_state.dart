part of 'get_movies_cubit.dart';

@immutable
abstract class GetMoviesState {}

class GetMoviesInitial extends GetMoviesState {}

class GetMoviesLoading extends GetMoviesState {}

class GetMoviesLoaded extends GetMoviesState {
  final List<MovieModel> movieList;
  GetMoviesLoaded(this.movieList);
}

class GetMoviesError extends GetMoviesState {
  final String message;
  GetMoviesError(this.message);
}
