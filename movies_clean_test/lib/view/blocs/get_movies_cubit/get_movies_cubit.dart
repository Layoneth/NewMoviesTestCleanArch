import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_clean_test/data/model/movie_model.dart';
import 'package:movies_clean_test/domain/use_case/get_movies.dart';

part 'get_movies_state.dart';

class GetMoviesCubit extends Cubit<GetMoviesState> {
  final GetMoviesUseCase getGameUseCase;
  GetMoviesCubit(this.getGameUseCase) : super(GetMoviesInitial()) {
    getMovies();
  }

  Future<void> getMovies() async {
    try {
      emit(GetMoviesLoading());
      final movies = await getGameUseCase.getMoviesReq();
      if (movies != null) {
        emit(GetMoviesLoaded(movies));
      } else {
        emit(GetMoviesError('Error getting the movies'));
      }
    } catch (e) {
      emit(GetMoviesError('There was an error'));
      print(e);
    }
  }
}
