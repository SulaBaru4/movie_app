import 'package:application_pet/feature/domain/entities/user.dart';
import 'package:application_pet/feature/domain/usecases/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/error/failure.dart';
import '../repositories/auth_repository.dart';

/// Parameters required for the SignUpUseCase.
class SignUpParams {
  final String email;
  final String password;

  SignUpParams({required this.email, required this.password});
}

/// SignUpUseCase orchestrates the sign-up logic, delegating to the AuthRepository.
class SignUpUseCase implements UseCase<UserEntity, SignUpParams> {
  final AuthRepository repository;

  SignUpUseCase(this.repository);
  @override
  Future <Either<Failure, UserEntity>> call (SignUpParams params) async {
    try{
      final user = await repository.signUp(params.email, params.password);
      return Right(user);
    } on AuthException catch (_) {
      return Left(ServerFailure(message: 'Wrong Email'));
    } catch (e) {
      return Left(ServerFailure(message: "Error has occurred"));
    }
    }
  }

