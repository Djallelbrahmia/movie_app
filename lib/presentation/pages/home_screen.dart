import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/bloc/popular_movie/popular_movies_bloc.dart';
import 'package:movie_app/presentation/bloc/popular_movie/popular_movies_states.dart';
import 'package:movie_app/presentation/bloc/trending_movie/trending_movie_bloc.dart';
import 'package:movie_app/presentation/bloc/trending_movie/trending_movies_states.dart';
import 'package:movie_app/presentation/pages/movies_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  final bckImage =
      "https://i.pinimg.com/originals/36/21/f8/3621f871d8dc2553ec58cfab1cbf1ecd.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        toolbarHeight: 100,
        backgroundColor: Colors.grey,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi Djallel 👋',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'TDD - Movie App',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        color: Colors.black.withOpacity(0.6),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Default Image
              Container(
                height: 290,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(bckImage),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('▶️ TDD-MVVM-Bloc on Fire '),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(20), // Border radius
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),

              // Trending Movies
              Text(
                'Trending Movies',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              BlocBuilder<TrendingMoviesBloc, TrendingMoviesStates>(
                builder: (context, state) {
                  if (state is TrendingMoviesLoading) {
                    return CircularProgressIndicator();
                  } else if (state is TrendingMoviesloaded) {
                    return MoviesList(movies: state.movies);
                  } else if (state is TrendingMoviesError) {
                    return Text(state.error);
                  }
                  return Container();
                },
              ),

              SizedBox(
                height: 20,
              ),
              // Popular Movies
              Text(
                'Popular Movies',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              BlocBuilder<PopularMoviesBloc, PopularMoviesStates>(
                builder: (context, state) {
                  if (state is PopularMoviesStatesLoading) {
                    return CircularProgressIndicator();
                  } else if (state is PopularMoviesStatesloaded) {
                    return MoviesList(movies: state.movies);
                  } else if (state is PopularMoviesStatesError) {
                    return Text(state.error);
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
