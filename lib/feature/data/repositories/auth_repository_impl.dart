import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasource/supabase_auth_data_source.dart';
import '../models/user_model.dart';

/// AuthRepositoryImpl implements AuthRepository, bridging the Domain layer
/// and the Data layer. It uses SupabaseAuthDataSource to perform actual operations.
class AuthRepositoryImpl implements AuthRepository {
  final SupabaseAuthDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<UserEntity> signIn(String email, String password) async {
    final data = await dataSource.signIn(email, password);
    return UserModel.fromMap(data);
  }

  @override
  Future<UserEntity> signUp(String email, String password) async {
    final data = await dataSource.signUp(email, password);
    return UserModel.fromMap(data);
  }

  @override
  Future<void> signOut() async {
    await dataSource.signOut();
  }

  @override
  UserEntity? getCurrentUser() {
    final data = dataSource.getCurrentUser();
    return data != null ? UserModel.fromMap(data) : null;
  }
}
