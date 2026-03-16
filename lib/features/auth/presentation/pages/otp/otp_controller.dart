import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../auth/data/auth_repository.dart';

final otpControllerProvider = AsyncNotifierProvider<OtpController, bool>(() {
  return OtpController();
});

class OtpController extends AsyncNotifier<bool> {
  late final AuthRepository _authRepository;

  @override
  FutureOr<bool> build() {
    _authRepository = ref.watch(authRepositoryProvider);
    return false;
  }

  /// Send the OTP and update state to indicate code was sent
  Future<bool> sendOtp(String email) async {
    state = const AsyncValue.loading();
    try {
      await _authRepository.signInWithOtp(email);
      // Data = true means "OTP has been sent"
      state = const AsyncValue.data(true);
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }

  /// Verify the OTP code
  Future<bool> verifyOtp(String email, String token) async {
    state = const AsyncValue.loading();
    try {
      await _authRepository.verifyOtp(email, token);
      // We don't change state if successful, auth listener will redirect
      return true;
    } catch (e, st) {
      // Return to the "OTP sent" state with an error
      state = AsyncValue.error(e, st);
      return false;
    }
  }

  void reset() {
    state = const AsyncValue.data(false);
  }
}
