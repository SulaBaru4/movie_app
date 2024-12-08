import 'package:supabase_flutter/supabase_flutter.dart';

/// SupabaseAuthDataSource handles direct communication with the Supabase Auth API.
/// It abstracts the Supabase-specific logic, returning raw data (like Maps) for the repository.
class SupabaseAuthDataSource {
  final SupabaseClient client;

  SupabaseAuthDataSource(this.client);

  Future<Map<String, dynamic>> signIn(String email, String password) async {
    final response = await client.auth.signInWithPassword(email: email, password: password);
    if (response.session != null && response.user != null) {
      return {
        'id': response.user!.id,
        'email': response.user!.email,
      };
    } else {
      throw Exception('Sign in failed');
    }
  }

  Future<Map<String, dynamic>> signUp(String email, String password) async {
    final response = await client.auth.signUp(email: email, password: password);
    if (response.user != null) {
      return {
        'id': response.user!.id,
        'email': response.user!.email,
      };
    } else {
      throw Exception('Sign up failed');
    }
  }

  Future<void> signOut() async {
    await client.auth.signOut();
  }

  Map<String, dynamic>? getCurrentUser() {
    final user = client.auth.currentUser;
    return user != null ? {'id': user.id, 'email': user.email} : null;
  }
}
