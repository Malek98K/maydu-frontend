// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Student Finance Guardian';

  @override
  String get loginTitle => 'Login';

  @override
  String get loginEmailLabel => 'Email';

  @override
  String get loginPasswordLabel => 'Password';

  @override
  String get loginSignInButton => 'Sign In';

  @override
  String get loginWithGoogle => 'Sign In with Google';

  @override
  String get loginWithApple => 'Sign In with Apple';

  @override
  String get loginWithOtp => 'Login with OTP';

  @override
  String get loginForgotPassword => 'Forgot Password?';

  @override
  String get otpTitle => 'OTP Verification';

  @override
  String get otpEmailLabel => 'Email Address';

  @override
  String get otpSendButton => 'Send OTP';

  @override
  String get otpCodeLabel => 'OTP Code';

  @override
  String get otpVerifyButton => 'Verify OTP';

  @override
  String get forgotPasswordTitle => 'Reset Password';

  @override
  String get forgotPasswordEmailLabel => 'Email';

  @override
  String get forgotPasswordSendButton => 'Send Reset Link';

  @override
  String get dashboardTitle => 'Dashboard';

  @override
  String get dashboardTotalBalance => 'Total Balance';

  @override
  String get dashboardRecentActivity => 'Recent Activity';

  @override
  String get dashboardNoActivity => 'No recent transactions.';

  @override
  String get transactionsTitle => 'Transactions';

  @override
  String get transactionsHistory => 'Transaction History';

  @override
  String get transactionsNoTransactions => 'No transactions found.';

  @override
  String get transactionsAddTooltip => 'Add Transaction';

  @override
  String get budgetsTitle => 'Budgets';

  @override
  String get budgetsNoBudgets => 'No active budgets.';

  @override
  String get budgetsCategory => 'Category';

  @override
  String budgetsSpent(String amount) {
    return '$amount spent';
  }

  @override
  String budgetsLeft(String amount) {
    return '$amount left';
  }

  @override
  String get profileTitle => 'Profile & Security';

  @override
  String get profileSecuritySettings => 'Security Settings';

  @override
  String get profileSecuritySubtitle => 'Manage MFA and devices';

  @override
  String get profileLogout => 'Logout';

  @override
  String get errorGeneric => 'An error occurred. Please try again later.';

  @override
  String get navDashboard => 'Dashboard';

  @override
  String get navTransactions => 'Transactions';

  @override
  String get navBudgets => 'Budgets';

  @override
  String get navProfile => 'Profile';
}
