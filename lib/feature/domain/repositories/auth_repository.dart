import 'package:application_pet/feature/domain/entities/user.dart';

/// The AuthRepository defines the contract for authentication-related actions.
/// Implementations of this interface should handle user sign-in, sign-up, sign-out, and retrieving the current user.
///

abstract class AuthRepository {
  Future<UserEntity> signIn (String email, String password);
  Future<UserEntity> signUp (String email, String password);
  Future<void> signOut();
  UserEntity? getCurrentUser();
}