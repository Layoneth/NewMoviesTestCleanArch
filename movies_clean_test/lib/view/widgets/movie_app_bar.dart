import 'package:flutter/material.dart';
import 'package:movies_clean_test/core/constants.dart';
import 'package:movies_clean_test/data/model/movie_model.dart';

class AppBarMovie extends StatelessWidget {
  final MovieModel movie;
  const AppBarMovie({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) => SliverAppBar(
    pinned: true,
    elevation: 5.0,
    expandedHeight: 300,
    flexibleSpace: FlexibleSpaceBar(
      centerTitle: true,
      title: Text(movie.title),
      background: FadeInImage(
          placeholder: const NetworkImage(Constants.placeholderUrl),
          image: NetworkImage(
            Constants.posterPath + movie.backdropPath),
          fit: BoxFit.cover),
    ),
  );
}