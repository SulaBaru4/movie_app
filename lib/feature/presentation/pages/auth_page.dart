import 'package:application_pet/common/widget_size.dart';
import 'package:application_pet/feature/presentation/bloc/auth_cubit.dart';
import 'package:application_pet/feature/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/colors.dart';

class AuthPage extends StatefulWidget {


  AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var widgetSize = WidgetSize(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.pink,
        title: Text(
          'Welcome',
          style: TextStyle(color: Colors.white, fontSize: 32),
        ),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
        if (state.user != null) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => MainPage()));
        }
      }, builder: (BuildContext context,state) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (state.error != null)
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
