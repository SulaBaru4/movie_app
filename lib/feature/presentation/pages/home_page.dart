import 'package:application_pet/feature/presentation/bloc/auth_cubit.dart';
import 'package:application_pet/feature/presentation/pages/auth_page.dart';
import 'package:application_pet/feature/presentation/widgets/logged_dialog.dart';
import 'package:application_pet/feature/presentation/widgets/movie_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common/colors.dart';
import '../../domain/entities/movie.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final use = context.watch<AuthCubit>().state.user;
    final List<Movie> movies = [
      Movie(
          videoLink: "https://www.youtube.com/watch?v=mpj9dL7swwk&t=38s",
          title: 'Inception',
          imageAsset: 'assets/images/inception.jpg',
          description:
              "Inception is a visually stunning sci-fi thriller that explores the depths of the human mind. Directed by Christopher Nolan, it offers a captivating journey through complex layers of reality and imagination. With its groundbreaking visuals and thought-provoking themes, the film keeps audiences engaged and intrigued from start to finish."),
      Movie(
          videoLink: "https://www.youtube.com/watch?v=OUFnhtL7yLA",
          title: 'Forrest Gump',
          imageAsset: 'assets/images/forrest.jpg',
          description:
              "Forrest Gump is a heartwarming tale of an extraordinary man living through remarkable moments in history. Directed by Robert Zemeckis, the film beautifully captures themes of love, perseverance, and destiny. With its inspiring narrative and unforgettable performances, it’s a timeless story that resonates deeply with audiences."),
      Movie(
          videoLink: "https://www.youtube.com/watch?v=bPU0KJw3WB0",
          title: 'Dark Knight',
          imageAsset: 'assets/images/darkknight.jpg',
          description:
              "Directed by Christopher Nolan, is a gripping tale of justice, chaos, and heroism. Featuring iconic performances and intense action, it delves into the moral complexities of a vigilante hero facing his greatest challenge. A masterpiece of storytelling and cinematic excellence."),
      Movie(
          videoLink: "https://www.youtube.com/watch?v=gSt2UNe12UA",
          title: 'Blade Runner 2049',
          imageAsset: 'assets/images/bladerunner.jpg',
          description:
              "Directed by Denis Villeneuve, is a visually stunning journey into a dystopian future. It explores themes of identity, humanity, and existential purpose through a captivating narrative. With breathtaking cinematography and thought-provoking storytelling, it's a modern sci-fi masterpiece that pays homage to its predecessor while carving its own legacy."),
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
            onPressed: () {
              final authCubit = context.read<AuthCubit>();
              final user = authCubit.state.user;
              if (user != null) {
                showLoggedDialog(context, user.email);
              } else {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AuthPage()));
              }
            },
            icon: Icon(
              Icons.account_circle_rounded,
              size: 32,
              color: AppColors.cleanWhite,
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieList(movies: movies)
          ],
        ),
      ),
    );
  }
}
