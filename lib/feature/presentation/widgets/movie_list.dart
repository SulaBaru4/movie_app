import 'package:flutter/material.dart';
import 'movie_card.dart';
import '../../domain/entities/movie.dart';

/// A widget that displays a list of movies in a grid format.
class MovieList extends StatelessWidget {
  final List<Movie> movies;

  const MovieList({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          /// Configures the grid to display one movie per row.
          crossAxisCount: 1,
          childAspectRatio: 2 / 3,
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          /// Creates a MovieCard widget for each movie.
          return MovieCard(
            movie: movie,
          );
        },
      ),
    );
  }
}
