import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../auth/data/auth_repository.dart';

final loginControllerProvider = AsyncNotifierProvider<LoginController, void>(() {
  return LoginController();
});

class LoginController extends AsyncNotifier<void> {
  late final AuthRepository _authRepository;

  @override
  FutureOr<void> build() {
    _authRepository = ref.watch(authRepositoryProvider);
  }

  Future<bool> loginWithEmailPassword(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      await _authRepository.signInWithEmailPassword(email, password);
      state = const AsyncValue.data(null);
      return true; // Success
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false; // Failed
    }
  }

  Future<void> loginWithGoogle() async {
    state = const AsyncValue.loading();
    try {
      await _authRepository.signInWithGoogle();
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> loginWithApple() async {
    state = const AsyncValue.loading();
    try {
      await _authRepository.signInWithApple();
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<bool> sendOtp(String email) async {
    state = const AsyncValue.loading();
    try {
      await _authRepository.signInWithOtp(email);
      state = const AsyncValue.data(null);
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }
}
