import 'package:application_pet/common/widget_size.dart';
import 'package:application_pet/feature/presentation/pages/movies_page.dart';
import 'package:flutter/material.dart';

import '../../../common/colors.dart';
import '../../../common/custom_text.dart';
import '../../domain/entities/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    var widgetSize = WidgetSize(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 32),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MoviesPage(movie: movie,)));
            },
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
                      height: widgetSize.height * 0.41,
                      width:  widgetSize.width * 0.45,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
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
