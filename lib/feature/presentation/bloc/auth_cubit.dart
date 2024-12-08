import 'package:application_pet/feature/domain/repositories/auth_repository.dart';
import 'package:application_pet/feature/domain/usecases/use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/user.dart';
import '../../domain/usecases/sign_in_usecase.dart';
import '../../domain/usecases/sign_out_usecase.dart';
import '../../domain/usecases/sign_up_usecase.dart';

/// AuthState represents the state of the authentication flow:
/// - user: currently authenticated user (if any)
/// - loading: indicates if an operation is in progress
/// - error: contains error messages if something went wrong.
class AuthState {
  final UserEntity? user;
  final bool loading;
  final String? error;

  AuthState({this.user, this.loading = false, this.error});

  AuthState copyWith({UserEntity? user, bool? loading, String? error}) {
    return AuthState(
      user: user ?? this.user,
      loading: loading ?? this.loading,
      error: error,
    );
  }
}

/// AuthCubit uses the UseCases to perform authentication actions,
/// managing the AuthState and emitting updates.
class AuthCubit extends Cubit<AuthState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;
  final SignOutUseCase signOutUseCase;
  final AuthRepository authRepository;

  AuthCubit({
    required this.signInUseCase,
    required this.signUpUseCase,
    required this.signOutUseCase,
    required this.authRepository,
  }) : super(AuthState());

  Future<void> signIn(String email, String password) async {
    emit(state.copyWith(loading: true, error: null));
    final result = await signInUseCase(SignInParams(email: email, password: password));
    result.fold(
          (failure) => emit(state.copyWith(loading: false, error: failure.message)),
          (user) => emit(AuthState(user: user, loading: false)),
    );
  }

  Future<void> signUp(String email, String password) async {
    emit(state.copyWith(loading: true, error: null));
    final result = await signUpUseCase(SignUpParams(email: email, password:password));
    result.fold(
          (failure) => emit(state.copyWith(loading: false, error: failure.message)),
          (user) => emit(AuthState(user: user, loading: false)),
    );
  }

  Future<void> signOut() async {
   emit(state.copyWith(loading: true, error: null));
   final result = await signOutUseCase(NoParams());
   result.fold(
       (failure) => emit(state.copyWith(loading: false, error: failure.message)),
         (_) => emit(AuthState()),
   );
  }
  UserEntity? getCurrentUser() {
    return authRepository.getCurrentUser();
  }
}
