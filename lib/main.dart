import 'package:application_pet/feature/data/repositories/auth_repository_impl.dart';
import 'package:application_pet/feature/domain/repositories/auth_repository.dart';
import 'package:application_pet/feature/domain/usecases/sign_in_usecase.dart';
import 'package:application_pet/feature/domain/usecases/sign_out_usecase.dart';
import 'package:application_pet/feature/domain/usecases/sign_up_usecase.dart';
import 'package:application_pet/feature/presentation/bloc/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'feature/data/datasource/supabase_auth_data_source.dart';
import 'feature/presentation/pages/auth_page.dart';
import 'feature/presentation/pages/home_page.dart';
import 'feature/presentation/pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://dtscwravjicbiirdikbg.supabase.co',
    anonKey:
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImR0c2N3cmF2amljYmlpcmRpa2JnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzMxNDE2ODYsImV4cCI6MjA0ODcxNzY4Nn0.NARDA0zeo3PTmh6vaqodpQm-SgbcTzeR-GzYsY07HSU',
  );

  /// Dependencies
  final dataSource = SupabaseAuthDataSource(Supabase.instance.client);
  final AuthRepository authRepository = AuthRepositoryImpl(dataSource);

  /// Data layer for images

  /// Data layer for authentication
  final signInUseCase = SignInUseCase(authRepository);
  final signUpUseCase = SignUpUseCase(authRepository);
  final signOutUseCase = SignOutUseCase(authRepository);

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) =>
          AuthCubit(
              signInUseCase: signInUseCase,
              signUpUseCase: signUpUseCase,
              signOutUseCase: signOutUseCase,
              authRepository: authRepository),
      ),
    ],
    child: MaterialApp(
    initialRoute: '/splash',
    routes: {
      '/splash': (context) => const SplashScreen(),
      '/auth': (context) => const AuthPage(),
      '/home': (context) => const MainPage(),
    },
  ),
  ),
  );
  }

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "MovieApp",
      home: SplashScreen(),
    );
  }
}
