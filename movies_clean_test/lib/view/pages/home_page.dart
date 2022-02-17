import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_clean_test/view/blocs/get_movies_cubit/get_movies_cubit.dart';
import 'package:movies_clean_test/view/pages/movie_detail.dart';
import 'package:provider/src/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // context.read<GetMoviesCubit>().getMovies();

    return BlocBuilder<GetMoviesCubit, GetMoviesState>(
      builder: (context, state) {
        if (state is GetMoviesLoaded) {
          final list = state.movieList;
          return Swiper(
            itemCount: list.length,
            itemWidth: MediaQuery.of(context).size.width - 50,
            itemHeight: MediaQuery.of(context).size.height * 0.65,
            layout: SwiperLayout.TINDER,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MovieDetailPage(
                              movie: list.elementAt(index),
                            ))),
                child: Hero(
                  tag: list.elementAt(index).title,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: FadeInImage(
                      fit: BoxFit.fill,
                      placeholder: const NetworkImage(
                        "http://via.placeholder.com/288x188",
                      ),
                      image: NetworkImage(
                        list.elementAt(index).posterPath,
                      ),
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
    );
  }
}
