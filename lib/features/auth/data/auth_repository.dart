import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(Supabase.instance.client);
});

class AuthRepository {
  final SupabaseClient _client;

  AuthRepository(this._client);

  /// Get the current session user
  User? get currentUser => _client.auth.currentUser;

  /// Stream of authentication state changes
  Stream<AuthState> get authStateChanges => _client.auth.onAuthStateChange;

  /// Sign in with Email and Password
  Future<AuthResponse> signInWithEmailPassword(String email, String password) async {
    return await _client.auth.signInWithPassword(email: email, password: password);
  }

  /// Sign up with Email and Password
  Future<AuthResponse> signUpWithEmailPassword(String email, String password) async {
    return await _client.auth.signUp(email: email, password: password);
  }

  /// Send an OTP to the user's email
  Future<void> signInWithOtp(String email) async {
    await _client.auth.signInWithOtp(email: email);
  }

  /// Verify the OTP sent to the email
  Future<AuthResponse> verifyOtp(String email, String token) async {
    return await _client.auth.verifyOTP(
      email: email,
      token: token,
      type: OtpType.magiclink,
    );
  }

  /// Send password reset email
  Future<void> sendPasswordResetEmail(String email) async {
    await _client.auth.resetPasswordForEmail(email);
  }

  /// Sign in with Google (OAuth)
  Future<void> signInWithGoogle() async {
    await _client.auth.signInWithOAuth(
      OAuthProvider.google,
      redirectTo: 'com.maydu.financeguardian://login-callback',
    );
  }

  /// Sign in with Apple (OAuth)
  Future<void> signInWithApple() async {
    await _client.auth.signInWithOAuth(
      OAuthProvider.apple,
      redirectTo: 'com.maydu.financeguardian://login-callback',
    );
  }

  /// Sign out
  Future<void> signOut() async {
    await _client.auth.signOut();
  }
}
