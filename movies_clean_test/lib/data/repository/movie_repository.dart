import 'package:movies_clean_test/data/datasource/remote_datasource.dart';
import 'package:movies_clean_test/data/model/movie_model.dart';
import 'package:movies_clean_test/domain/repository/movies_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource movieRemoteDataSource;
  MovieRepositoryImpl(this.movieRemoteDataSource);

  @override
  Future<List<MovieModel>?> getMovies() async {
    try {
      final movies = await movieRemoteDataSource.requestMovies();
      return movies;
    } catch (e) {
      print(e);
      return null;
    }
  }

}