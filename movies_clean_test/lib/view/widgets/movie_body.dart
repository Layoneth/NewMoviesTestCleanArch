import 'package:flutter/material.dart';
import 'package:movies_clean_test/data/model/movie_model.dart';

class BodyDetailMovie extends StatelessWidget {
  final MovieModel movie;
  const BodyDetailMovie({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) => SliverList(
    delegate: SliverChildListDelegate([
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            MinInformation(movie: movie),
            const SizedBox(height: 8.0,),
            Text(movie.overview)
          ],
        ),
      )
    ]));
}

class MinInformation extends StatelessWidget {
  final MovieModel movie;
  const MinInformation({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
    children: <Widget>[
      Hero(
        tag: movie.title,
        child: SizedBox(
          height: 230,
          width: 150,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              placeholder: NetworkImage(movie.posterPath), 
              image: NetworkImage(movie.posterPath),
            ),
          ),
        ),
      ),
      const SizedBox(width: 16.0,),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(children: <Widget>[
            const Icon(Icons.star_border),
            Text(movie.voteAverage.toString())
          ],),
          Row(children: <Widget>[
            const Icon(Icons.trending_up),
            Text(movie.popularity.toString())
          ],)
        ],
      )
    ],
  );
}