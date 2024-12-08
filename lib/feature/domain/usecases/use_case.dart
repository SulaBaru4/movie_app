import 'package:application_pet/core/error/failure.dart';
import 'package:dartz/dartz.dart';

/// Abstract base class for all use cases in the application.
///
/// Implements the [call] method that takes [Params] as input and returns a
/// [Future] containing an [Either] with a [Failure] on the left side
/// and a result of type [Type] on the right side.
///
/// This structure helps maintain separation of concerns and keeps
/// business logic modular and reusable.
abstract class UseCase<Type, Params> {

  /// Executes the use case.
  ///
  /// [Params] represents the input parameters required for the use case.
  /// Returns an [Either] containing a [Failure] on the left in case of an
  /// error, or a value of type [Type] on the right if the operation succeeds.
  Future<Either<Failure, Type>> call(Params params);
}

/// A class representing the absence of input parameters.
///
/// This is used with [UseCase] when no parameters are required for its execution.
class NoParams {}
