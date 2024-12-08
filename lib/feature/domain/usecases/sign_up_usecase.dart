import 'package:application_pet/feature/domain/entities/user.dart';
import 'package:application_pet/feature/domain/usecases/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/error/failure.dart';
import '../repositories/auth_repository.dart';

/// Parameters required for the SignUpUseCase.
class SignUpParams {
  /// The email address of the user.
  final String email;
  /// The password chosen by the user.
  final String password;

  /// Constructor for [SignUpParams].
  ///
  /// Both [email] and [password] are required.
  SignUpParams({required this.email, required this.password});
}

/// SignUpUseCase orchestrates the sign-up logic, delegating to the AuthRepository.
class SignUpUseCase implements UseCase<UserEntity, SignUpParams> {
  final AuthRepository repository;

  SignUpUseCase(this.repository);
  /// Executes the sign-up process.
  ///
  /// - Accepts [SignUpParams], which includes the user's email and password.
  /// - Returns a [Right] containing a [UserEntity] if the sign-up is successful.
  /// - Returns a [Failure] wrapped in a [Left] if an error occurs during the process.
  ///
  /// Throws:
  /// - [AuthException]: If there is an issue with the email or password provided.
  /// - Other exceptions are caught and wrapped in a generic error message.
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

