import 'package:application_pet/feature/domain/entities/user.dart';
import 'package:application_pet/feature/domain/repositories/auth_repository.dart';
import 'package:application_pet/feature/domain/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';

class SignOutParams {
  final String email;
  final String password;

  SignOutParams({required this.email, required this.password});
}

class SignOutUseCase implements UseCase<void, NoParams> {
  final AuthRepository repository;

  SignOutUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call (NoParams params) async {
    try {
     await repository.signOut();
      return Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}