import 'package:flutter/material.dart';
import 'home_page.dart';
import '../../../common/colors.dart';

/// A splash screen that displays an introductory view of the app before navigating
/// to the main page. It serves as a brief, branded screen shown when the app is launched.
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
  /// Navigates to the [MainPage] after a delay of 3 seconds.
  ///
  /// This method is called during initialization to create a brief pause
  /// before transitioning to the main application content.
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
