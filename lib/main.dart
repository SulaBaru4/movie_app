import 'package:application_pet/feature/data/datasource/storage_repository_impl.dart';
import 'package:application_pet/feature/domain/usecases/fetch_images_usecase.dart';
import 'package:application_pet/feature/presentation/viewmodels/images_view_model.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:provider/provider.dart';
import 'feature/presentation/pages/splash_screen.dart';


void main() async {
  await Supabase.initialize(
    url: 'https://dtscwravjicbiirdikbg.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImR0c2N3cmF2amljYmlpcmRpa2JnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzMxNDE2ODYsImV4cCI6MjA0ODcxNzY4Nn0.NARDA0zeo3PTmh6vaqodpQm-SgbcTzeR-GzYsY07HSU',
  );

  runApp(
      MultiProvider(
          providers: [
            Provider(
              create: (_) => StorageRepositoryImpl(Supabase.instance.client),
            ),
            ProxyProvider<StorageRepositoryImpl, FetchImageUseCase>(
              update: (_, repo, __) => FetchImageUseCase(repo),
            ),
          ChangeNotifierProvider(create: (context) {
            final useCase = Provider.of<FetchImageUseCase>(context, listen: false);
            return ImagesViewModel(useCase);
          }),
            /*ChangeNotifierProxyProvider<FetchImagesUseCase, ImagesViewModel>(
              create: (_) => ImagesViewModel(
                Provider.of<FetchImagesUseCase>(_, listen: false),
              ),
              update: (_, useCase, viewModel) =>
              viewModel ?? ImagesViewModel(useCase),
            ),*/
          ],
        child: const MovieApp(),
      )
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