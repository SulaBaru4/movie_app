import 'package:flutter/material.dart';

import '../../../common/colors.dart';
import '../../../common/custom_text.dart';
import '../../domain/entities/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 32),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                  child: Image.asset(
                    movie.imageAsset,
                    height: 400,
                    width:  200,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
         CustomText(
          text: movie.title,
          firstLetterColor: AppColors.pink,
          remainingTextColor: Colors.black,
        ),
      ],
    );
  }
}
