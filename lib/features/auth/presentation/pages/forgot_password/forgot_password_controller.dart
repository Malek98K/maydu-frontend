import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../auth/data/auth_repository.dart';

final forgotPasswordControllerProvider = AsyncNotifierProvider<ForgotPasswordController, bool>(() {
  return ForgotPasswordController();
});

class ForgotPasswordController extends AsyncNotifier<bool> {
  late final AuthRepository _authRepository;

  @override
  FutureOr<bool> build() {
    _authRepository = ref.watch(authRepositoryProvider);
    return false;
  }

  Future<bool> sendResetLink(String email) async {
    state = const AsyncValue.loading();
    try {
      await _authRepository.sendPasswordResetEmail(email);
      state = const AsyncValue.data(true); // true = email sent
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }

  void reset() {
    state = const AsyncValue.data(false);
  }
}
