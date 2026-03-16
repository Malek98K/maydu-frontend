// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Tuteur Financier Étudiant';

  @override
  String get loginTitle => 'Connexion';

  @override
  String get loginEmailLabel => 'E-mail';

  @override
  String get loginPasswordLabel => 'Mot de passe';

  @override
  String get loginSignInButton => 'Se connecter';

  @override
  String get loginWithGoogle => 'Se connecter avec Google';

  @override
  String get loginWithApple => 'Se connecter avec Apple';

  @override
  String get loginWithOtp => 'Se connecter avec OTP';

  @override
  String get loginForgotPassword => 'Mot de passe oublié ?';

  @override
  String get otpTitle => 'Vérification OTP';

  @override
  String get otpEmailLabel => 'Adresse e-mail';

  @override
  String get otpSendButton => 'Envoyer OTP';

  @override
  String get otpCodeLabel => 'Code OTP';

  @override
  String get otpVerifyButton => 'Vérifier OTP';

  @override
  String get forgotPasswordTitle => 'Réinitialiser le mot de passe';

  @override
  String get forgotPasswordEmailLabel => 'E-mail';

  @override
  String get forgotPasswordSendButton => 'Envoyer le lien de réinitialisation';

  @override
  String get dashboardTitle => 'Tableau de bord';

  @override
  String get dashboardTotalBalance => 'Solde Total';

  @override
  String get dashboardRecentActivity => 'Activité récente';

  @override
  String get dashboardNoActivity => 'Aucune transaction récente.';

  @override
  String get transactionsTitle => 'Transactions';

  @override
  String get transactionsHistory => 'Historique des transactions';

  @override
  String get transactionsNoTransactions => 'Aucune transaction trouvée.';

  @override
  String get transactionsAddTooltip => 'Ajouter une transaction';

  @override
  String get budgetsTitle => 'Budgets';

  @override
  String get budgetsNoBudgets => 'Aucun budget actif.';

  @override
  String get budgetsCategory => 'Catégorie';

  @override
  String budgetsSpent(String amount) {
    return '$amount dépensé';
  }

  @override
  String budgetsLeft(String amount) {
    return '$amount restant';
  }

  @override
  String get profileTitle => 'Profil et Sécurité';

  @override
  String get profileSecuritySettings => 'Paramètres de sécurité';

  @override
  String get profileSecuritySubtitle => 'Gérer MFA et appareils';

  @override
  String get profileLogout => 'Déconnexion';

  @override
  String get errorGeneric =>
      'Une erreur est survenue. Veuillez réessayer plus tard.';

  @override
  String get navDashboard => 'Tableau de bord';

  @override
  String get navTransactions => 'Transactions';

  @override
  String get navBudgets => 'Budgets';

  @override
  String get navProfile => 'Profil';
}
