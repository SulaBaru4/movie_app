import '../../domain/entities/user.dart';

/// UserModel is a data representation of UserEntity, specifically tailored
/// to handle data conversion (e.g., from a map fetched from Supabase).
class UserModel extends UserEntity {
  UserModel({required String id, required String email}) : super(id: id, email: email);

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      email: map['email'] as String,
    );
  }
}
