/// Represents a user entity in the application.
///
/// This class is used to encapsulate the core details of a user,
/// such as their unique identifier and email address. It serves as a
/// domain-level representation of a user for use cases and business logic.
///
class UserEntity {
  final String id;
  final String email;

  /// Creates a new [UserEntity] with the specified [id] and [email].
  ///
  /// Both [id] and [email] are required and must not be null.

  UserEntity({required this.id, required this.email});
}