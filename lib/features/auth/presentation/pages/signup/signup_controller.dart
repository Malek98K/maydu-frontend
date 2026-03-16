import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../auth/data/auth_repository.dart';

final signupControllerProvider = AsyncNotifierProvider<SignupController, void>(() {
  return SignupController();
});

class SignupController extends AsyncNotifier<void> {
  late final AuthRepository _authRepository;

  @override
  FutureOr<void> build() {
    _authRepository = ref.watch(authRepositoryProvider);
  }

  Future<bool> signUpWithEmailPassword(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      await _authRepository.signUpWithEmailPassword(email, password);
      state = const AsyncValue.data(null);
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }
}
