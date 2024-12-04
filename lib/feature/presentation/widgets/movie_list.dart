import 'package:flutter/material.dart';
import 'movie_card.dart';
import '../../domain/entities/movie.dart';

class MovieList extends StatelessWidget {
  final List<Movie> movies;

  const MovieList({
    Key? key,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return MovieCard(
            title: movie.title,
            imageUrl: movie.imageUrl,
          );
        },
      ),
    );
  }
}
