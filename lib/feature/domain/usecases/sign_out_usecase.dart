import 'package:application_pet/feature/domain/repositories/auth_repository.dart';
import 'package:application_pet/feature/domain/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';

/// Use case for signing out a user.
///
/// This class handles the interaction between the presentation layer and
/// the [AuthRepository] to perform user sign-out.
class SignOutUseCase implements UseCase<void, NoParams> {
  /// The repository used for signing out the user.
  final AuthRepository repository;

  /// Constructs a [SignOutUseCase] with the given [repository].
  SignOutUseCase(this.repository);

  /// Executes the sign-out process.
  ///
  /// - Accepts [NoParams] since no additional data is required for signing out.
  /// - Returns a [Right] with `null` on successful sign-out.
  /// - Returns a [Failure] wrapped in a [Left] if an error occurs during the process.
  @override
  Future<Either<Failure, void>> call (NoParams params) async {
    try {
     await repository.signOut();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}