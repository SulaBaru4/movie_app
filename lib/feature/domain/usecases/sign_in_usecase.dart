import 'package:application_pet/feature/domain/entities/user.dart';
import 'package:application_pet/feature/domain/repositories/auth_repository.dart';
import 'package:application_pet/feature/domain/usecases/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/error/failure.dart';

class SignInParams {
  final String email;
  final String password;

  SignInParams({required this.email, required this.password});
}

class SignInUseCase implements UseCase<UserEntity, SignInParams> {
  final AuthRepository repository;

  SignInUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(SignInParams params) async {
    try {
      final user = await repository.signIn(params.email, params.password);
      return Right(user);
    } on AuthException catch (_) {
      return Left(ServerFailure(message: 'Email or password are wrong'));
    } catch (e) {
      return Left(ServerFailure(message: "Error has occurred"));
    }
  }
}
