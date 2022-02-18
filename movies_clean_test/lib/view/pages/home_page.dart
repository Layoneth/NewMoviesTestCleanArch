import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_clean_test/core/constants.dart';
import 'package:movies_clean_test/view/blocs/get_movies_cubit/get_movies_cubit.dart';
import 'package:movies_clean_test/view/pages/movie_detail.dart';
import 'package:provider/src/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Layos test'),
      ),
      body: BlocBuilder<GetMoviesCubit, GetMoviesState>(
        builder: (context, state) {
          if (state is GetMoviesLoaded) {
            final movielist = state.movieList;

            return Swiper(
              itemCount: movielist.length,
              itemWidth: MediaQuery.of(context).size.width,
              itemHeight: MediaQuery.of(context).size.height,
              layout: SwiperLayout.DEFAULT,
              pagination: const SwiperPagination(),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetailPage(
                        movie: movielist.elementAt(index),
                      ))),
                  child: Hero(
                    tag: movielist.elementAt(index).title,
                    child: FadeInImage(
                      fit: BoxFit.fill,
                      placeholder: const NetworkImage(
                        Constants.placeholderUrl,
                      ),
                      image: NetworkImage(
                        Constants.posterPath + movielist.elementAt(index).posterPath,
                      ),
                    ),
                  ),
                );
              }
            );
          } else if (state is GetMoviesLoading ) {
            return  const Center(child: CircularProgressIndicator());
          } else if (state is GetMoviesError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('There are no movies.'));
          }
        },
      ),
    );
  }
}
