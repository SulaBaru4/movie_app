import 'package:application_pet/common/common_space.dart';
import 'package:application_pet/common/custom_text.dart';
import 'package:application_pet/common/widget_size.dart';
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
    final use = context.watch<AuthCubit>().state.user;
    final List<Movie> movies = [
      Movie(title: 'Inception', imageAsset: 'assets/images/inception.jpg'),
      Movie(title: 'Forrest Gump', imageAsset: 'assets/images/forrest.jpg'),
      Movie(title: 'Dark Knight', imageAsset: 'assets/images/darkknight.jpg'),
      Movie(title: 'Blade Runner 2049', imageAsset: 'assets/images/bladerunner.jpg'),
    ];
    var widgetSize = WidgetSize(context);

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
                showLoggedDialog (context, user.email);
              } else {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AuthPage()));
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
            /*Container(
              padding: const EdgeInsets.only(left: 10),
              child: Align(
                alignment: Alignment.center,
                child: CustomText(
                  text: "Movies",
                  firstLetterColor: AppColors.pink,
                  remainingTextColor: Colors.black,
                ),
              ),
            ),
            widgetSpace(20),*/
            MovieList(movies: movies)
          ],
        ),
      ),
    );
  }
}
