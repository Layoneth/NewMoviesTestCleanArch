// To parse this JSON data, do
//
//     final gameModel = gameModelFromMap(jsonString);

import 'package:equatable/equatable.dart';
import 'dart:convert';

class MovieModel extends Equatable{
  const MovieModel({
    required this.adult,
    required this.posterPath,
    required this.overview,
    required this.releaseDate,
    required this.genreIds,
    required this.id,
    required this.originalTitle,
    required this.originalLanguage,
    required this.title,
    required this.backdropPath,
    required this.popularity,
    required this.voteCount,
    required this.video,
    required this.voteAverage,
  });

    final String posterPath;
    final bool adult;
    final String overview;
    final DateTime releaseDate;
    final List<int> genreIds;
    final int id;
    final String originalTitle;
    final String originalLanguage;
    final String title;
    final String backdropPath;
    final double popularity;
    final int voteCount;
    final bool video;
    final double voteAverage;

    factory MovieModel.fromJson(String str) => MovieModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    static List<MovieModel> fromJsonList(List<dynamic> jsonList) {
      List<MovieModel> movies = [];
      for (var json in jsonList) {
        movies.add(MovieModel.fromMap(json));
      }
      return movies;
    }

    factory MovieModel.fromMap(Map<String, dynamic> json) => MovieModel(
        posterPath: json["poster_path"],
        adult: json["adult"],
        overview: json["overview"],
        releaseDate: DateTime.parse(json["release_date"]),
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalTitle: json["original_title"],
        originalLanguage: json["original_language"],
        title: json["title"],
        backdropPath: json["backdrop_path"],
        popularity: json["popularity"].toDouble(),
        voteCount: json["vote_count"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "poster_path": posterPath,
        "adult": adult,
        "overview": overview,
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "original_title": originalTitle,
        "original_language": originalLanguage,
        "title": title,
        "backdrop_path": backdropPath,
        "popularity": popularity,
        "vote_count": voteCount,
        "video": video,
        "vote_average": voteAverage,
    };

  @override
  List<Object?> get props => [
    posterPath,
    adult,
    overview,
    releaseDate,
    genreIds,
    id,
    originalTitle,
    originalLanguage,
    title,
    backdropPath,
    popularity,
    voteCount,
    video,
    voteAverage
  ];
}
