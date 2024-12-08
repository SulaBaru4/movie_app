import 'package:flutter/material.dart';
import 'movie_card.dart';
import '../../domain/entities/movie.dart';

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
          crossAxisCount: 1,
          childAspectRatio: 2 / 3,
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return MovieCard(
            movie: movie,
          );
        },
      ),
    );
  }
}
