import 'package:application_pet/feature/domain/repositories/auth_repository.dart';
import 'package:application_pet/feature/domain/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';

class SignOutUseCase implements UseCase<void, NoParams> {
  final AuthRepository repository;

  SignOutUseCase(this.repository);

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