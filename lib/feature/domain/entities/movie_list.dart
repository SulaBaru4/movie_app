import 'package:flutter/material.dart';

import '../../presentation/widgets/movie_card.dart';
import 'movie.dart';

class MovieList extends StatelessWidget {
  final List<Movie> movies;

  const MovieList({required this.movies, super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return MovieCard(movie: movie,);
      },
    );
  }
}
