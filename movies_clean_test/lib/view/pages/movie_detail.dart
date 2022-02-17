import 'package:flutter/material.dart';
import 'package:movies_clean_test/data/model/movie_model.dart';
import 'package:movies_clean_test/view/widgets/movie_app_bar.dart';
import 'package:movies_clean_test/view/widgets/movie_body.dart';

class MovieDetailPage extends StatelessWidget {
  final MovieModel movie;
  const MovieDetailPage({Key? key, required this.movie}) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          AppBarMovie(movie: movie),
          BodyDetailMovie(movie: movie,),
        ],
      ),
    );
  }
}