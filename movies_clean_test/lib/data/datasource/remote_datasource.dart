import 'package:dio/dio.dart';
import 'package:movies_clean_test/core/constants.dart';
import 'package:movies_clean_test/data/model/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>?> requestMovies();
}

class MovieRemoteDataSourceImp implements MovieRemoteDataSource {
  final Dio dio;
  MovieRemoteDataSourceImp(this.dio);

  @override
  Future<List<MovieModel>?> requestMovies() async {
    try {
      final response = await dio.get(
        Constants.baseUrl + '/movie/now_playing',
        queryParameters: {'api_key': Constants.apiKey},
      );

      print(response);
      final movies = MovieModel.fromJsonList(response.data['results']);
      return movies;
    } catch (e) {
      print(e);
      return null;
    }
  }

}

