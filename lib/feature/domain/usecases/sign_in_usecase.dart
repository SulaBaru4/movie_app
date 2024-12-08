import 'package:application_pet/feature/domain/entities/user.dart';
import 'package:application_pet/feature/domain/repositories/auth_repository.dart';
import 'package:application_pet/feature/domain/usecases/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/error/failure.dart';

/// Parameters required for signing in a user.
///
/// This class encapsulates the user's email and password for authentication purposes.

class SignInParams {
  final String email;
  final String password;

  /// Constructs a [SignInParams] instance with the given [email] and [password].

  SignInParams({required this.email, required this.password});
}

/// Use case for signing in a user.
///
/// This class handles the interaction between the presentation layer and
/// the [AuthRepository] to perform user authentication.

class SignInUseCase implements UseCase<UserEntity, SignInParams> {
  /// The repository used for authentication.
  final AuthRepository repository;

  /// Constructs a [SignInUseCase] with the given [repository].
  SignInUseCase(this.repository);

  /// Executes the sign-in process with the provided [params].
  ///
  /// - Returns a [UserEntity] wrapped in a [Right] if the authentication is successful.
  /// - Returns a [Failure] wrapped in a [Left] if an error occurs, such as invalid credentials or server issues.
  ///
  /// Handles:
  /// - [AuthException] for authentication errors with a message 'Email or password are wrong'.
  /// - Other exceptions are caught and a general error message is returned.
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
