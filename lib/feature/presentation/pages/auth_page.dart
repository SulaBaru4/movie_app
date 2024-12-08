import 'package:application_pet/feature/presentation/bloc/auth_cubit.dart';
import 'package:application_pet/feature/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/colors.dart';

/// Provides a user interface for signing in and signing up with email and password.
/// Utilizes [AuthCubit] for state management and handles navigation upon successful authentication.
class AuthPage extends StatefulWidget {

  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}
/// Manages user input, handles authentication logic, and navigates
/// to the main page upon successful sign-in or sign-up.
class _AuthPageState extends State<AuthPage> {
  /// Controller for email input field.
  final emailController = TextEditingController();

  /// Controller for password input field.
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.cleanWhite),
        backgroundColor: AppColors.pink,
        title: const Text(
          'Welcome',
          style: TextStyle(color: Colors.white, fontSize: 32),
        ),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
        /// Navigate to [MainPage] if the user is successfully authenticated.
        if (state.user != null) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const MainPage()));
        }
      }, builder: (BuildContext context,state) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (state.error != null)
                /// Displays an error message if authentication fails.
                  Text(state.error!, style: const TextStyle(color: Colors.red)),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email', suffixStyle: TextStyle(color: AppColors.pink)),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(labelText: 'Password', suffixStyle: TextStyle(color: AppColors.pink)),
                  obscureText: true,
                ),
                const SizedBox(height: 32),
                if (state.loading)
                  const CircularProgressIndicator()
                else
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.pink,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          final email = emailController.text.trim();
                          final pass = passwordController.text.trim();
                          context.read<AuthCubit>().signIn(email, pass);
                        },
                        child: const Text('Sign In', style: TextStyle(color: Colors.white),),
                      ),
                      TextButton(
                        onPressed: () {
                          final email = emailController.text.trim();
                          final pass = passwordController.text.trim();
                          context.read<AuthCubit>().signUp(email, pass);
                        },
                        child: const Text('Sign Up', style: TextStyle(color: Colors.black, decoration: TextDecoration.underline,),),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        );
      },),
    );
  }
}
