import 'package:flutter/material.dart';
import 'home_page.dart';
import '../../../common/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToMainPage();
  }

  void _navigateToMainPage() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const MainPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.pink,
        child: Center(
          child: Text(
            'MovieApp',
            style: TextStyle(fontSize: 50, color: AppColors.cleanWhite),
          ),
        ),
      ),
    );
  }
}
