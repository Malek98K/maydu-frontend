// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Studentische Finanzwache';

  @override
  String get loginTitle => 'Anmelden';

  @override
  String get loginEmailLabel => 'E-Mail';

  @override
  String get loginPasswordLabel => 'Passwort';

  @override
  String get loginSignInButton => 'Anmelden';

  @override
  String get loginWithGoogle => 'Mit Google anmelden';

  @override
  String get loginWithApple => 'Mit Apple anmelden';

  @override
  String get loginWithOtp => 'Mit OTP anmelden';

  @override
  String get loginForgotPassword => 'Passwort vergessen?';

  @override
  String get otpTitle => 'OTP-Überprüfung';

  @override
  String get otpEmailLabel => 'E-Mail-Adresse';

  @override
  String get otpSendButton => 'OTP senden';

  @override
  String get otpCodeLabel => 'OTP-Code';

  @override
  String get otpVerifyButton => 'OTP überprüfen';

  @override
  String get forgotPasswordTitle => 'Passwort zurücksetzen';

  @override
  String get forgotPasswordEmailLabel => 'E-Mail';

  @override
  String get forgotPasswordSendButton => 'Link zum Zurücksetzen senden';

  @override
  String get dashboardTitle => 'Dashboard';

  @override
  String get dashboardTotalBalance => 'Gesamtsaldo';

  @override
  String get dashboardRecentActivity => 'Letzte Aktivitäten';

  @override
  String get dashboardNoActivity => 'Keine kürzlichen Transaktionen.';

  @override
  String get transactionsTitle => 'Transaktionen';

  @override
  String get transactionsHistory => 'Transaktionsverlauf';

  @override
  String get transactionsNoTransactions => 'Keine Transaktionen gefunden.';

  @override
  String get transactionsAddTooltip => 'Transaktion hinzufügen';

  @override
  String get budgetsTitle => 'Budgets';

  @override
  String get budgetsNoBudgets => 'Keine aktiven Budgets.';

  @override
  String get budgetsCategory => 'Kategorie';

  @override
  String budgetsSpent(String amount) {
    return '$amount ausgegeben';
  }

  @override
  String budgetsLeft(String amount) {
    return '$amount übrig';
  }

  @override
  String get profileTitle => 'Profil & Sicherheit';

  @override
  String get profileSecuritySettings => 'Sicherheitseinstellungen';

  @override
  String get profileSecuritySubtitle => 'MFA und Geräte verwalten';

  @override
  String get profileLogout => 'Abmelden';

  @override
  String get errorGeneric =>
      'Ein Fehler ist aufgetreten. Bitte versuchen Sie es später noch einmal.';

  @override
  String get navDashboard => 'Dashboard';

  @override
  String get navTransactions => 'Transaktionen';

  @override
  String get navBudgets => 'Budgets';

  @override
  String get navProfile => 'Profil';
}
