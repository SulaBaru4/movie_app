import 'package:application_pet/common/common_space.dart';
import 'package:application_pet/common/custom_text.dart';
import 'package:application_pet/common/widget_size.dart';
import 'package:application_pet/feature/presentation/widgets/movie_list.dart';
import 'package:flutter/material.dart';

import '../../../../common/colors.dart';
import '../../domain/entities/movie.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});


  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Movie> movies = [
    Movie(
      title: 'Inception',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Movie(
      title: 'Interstellar',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Movie(
      title: 'The Dark Knight',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Movie(
      title: 'Shawshank Redemption',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Movie(
      title: 'Forrest Gump',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Movie(
      title: 'Blade Runner 2049',
      imageUrl: 'https://via.placeholder.com/150',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var widgetSize = WidgetSize(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.pink,
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            'MovieApp',
            style: TextStyle(fontSize: 32, color: AppColors.cleanWhite),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.account_circle_rounded,
              size: 32,
              color: AppColors.cleanWhite,
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: "Movies",
                  firstLetterColor: AppColors.pink,
                  remainingTextColor: Colors.black,
                ),
              ),
            ),
            widgetSpace(20),
            Expanded(child: MovieList(movies: movies))
          ],
        ),
      ),
    );
  }
}
