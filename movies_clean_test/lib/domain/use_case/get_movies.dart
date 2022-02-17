import 'package:movies_clean_test/data/model/movie_model.dart';
import 'package:movies_clean_test/domain/repository/movies_repository.dart';

class GetMoviesUseCase {
  final MovieRepository movieRepo;
  GetMoviesUseCase(this.movieRepo);

  Future<List<MovieModel>?> getMoviesReq() async {
    try {
      final movies = await movieRepo.getMovies();
      return movies;
    } catch (e) {
      print(e);
      return null;
    }
  }
}