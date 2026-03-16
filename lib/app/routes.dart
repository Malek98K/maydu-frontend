import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../features/auth/data/auth_repository.dart';
import '../features/auth/presentation/pages/login/login_page.dart';
import '../features/auth/presentation/pages/otp/otp_page.dart';
import '../features/auth/presentation/pages/forgot_password/forgot_password_page.dart';
import '../features/main_shell/presentation/pages/main_shell_page.dart';
import '../features/dashboard/presentation/pages/dashboard_page.dart';
import '../features/transactions/presentation/pages/transaction_list/transaction_list_page.dart';
import '../features/budgets/presentation/pages/budget_overview/budget_overview_page.dart';
import '../features/profile/presentation/pages/profile_settings/profile_settings_page.dart';

// Helper class to convert Stream to Listenable for GoRouter
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((dynamic _) => notifyListeners());
  }
  late final StreamSubscription<dynamic> _subscription;
  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

final routerProvider = Provider<GoRouter>((ref) {
  final authRepo = ref.watch(authRepositoryProvider);

  return GoRouter(
    initialLocation: '/dashboard',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/otp-login',
        builder: (context, state) => const OtpPage(),
      ),
      GoRoute(
        path: '/forgot-password',
        builder: (context, state) => const ForgotPasswordPage(),
      ),
      // Stateful shell route for bottom navigation
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainShellPage(navigationShell: navigationShell);
        },
        branches: [
          // Branch 0: Dashboard
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/dashboard',
                builder: (context, state) => const DashboardPage(),
              ),
            ],
          ),
          // Branch 1: Transactions
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/transactions',
                builder: (context, state) => const TransactionListPage(),
              ),
            ],
          ),
          // Branch 2: Budgets
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/budgets',
                builder: (context, state) => const BudgetOverviewPage(),
              ),
            ],
          ),
          // Branch 3: Profile
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) => const ProfileSettingsPage(),
              ),
            ],
          ),
        ],
      ),
    ],
    // Redirect logic
    redirect: (context, state) {
      final user = authRepo.currentUser;
      final isLoggedIn = user != null;
      final isLoggingIn = state.uri.toString() == '/login' ||
                          state.uri.toString() == '/otp-login' ||
                          state.uri.toString() == '/forgot-password';

      // If the user is NOT logged in and trying to access a secure page, redirect to login
      if (!isLoggedIn && !isLoggingIn) return '/login';

      // If the user IS logged in and trying to access the login page, redirect to dashboard
      if (isLoggedIn && isLoggingIn) return '/dashboard';

      return null; // Return null allows the route to proceed
    },
    // Listen to changes in auth state to automatically refresh the router
    refreshListenable: GoRouterRefreshStream(authRepo.authStateChanges),
  );
});
