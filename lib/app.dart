/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'feature/data/datasource/supabase_auth_data_source.dart';
import 'feature/data/repositories/auth_repository_impl.dart';
import 'feature/domain/repositories/auth_repository.dart';
import 'feature/domain/usecases/sign_in_usecase.dart';
import 'feature/domain/usecases/sign_up_usecase.dart';
import 'feature/presentation/bloc/auth_cubit.dart';
import 'feature/presentation/pages/auth_page.dart';
import 'feature/presentation/pages/home_page.dart';

/// MyApp sets up the MaterialApp, routes, and dependency injection.
/// This example does inline dependency creation, but in a real app
/// you would likely use a dependency injection solution like get_it.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// Setup dependencies
    final dataSource = SupabaseAuthDataSource(Supabase.instance.client);
    final AuthRepository authRepository = AuthRepositoryImpl(dataSource);

    final signInUseCase = SignInUseCase(authRepository);
    final signUpUseCase = SignUpUseCase(authRepository);
    final signOutUseCase = SignOutUseCase(authRepository);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(
            signInUseCase: signInUseCase,
            signUpUseCase: signUpUseCase,
            signOutUseCase: signOutUseCase,
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/auth',
        routes: {
          '/auth': (context) => AuthPage(),
          '/home': (context) => const MainPage(),
        },
      ),
    );
  }
}
*/
