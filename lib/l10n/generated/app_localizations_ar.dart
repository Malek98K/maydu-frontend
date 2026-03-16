// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'حارس مالية الطالب';

  @override
  String get loginTitle => 'تسجيل الدخول';

  @override
  String get loginEmailLabel => 'البريد الإلكتروني';

  @override
  String get loginPasswordLabel => 'كلمة المرور';

  @override
  String get loginSignInButton => 'تسجيل الدخول';

  @override
  String get loginWithGoogle => 'تسجيل الدخول بحساب جوجل';

  @override
  String get loginWithApple => 'تسجيل الدخول بحساب أبل';

  @override
  String get loginWithOtp => 'تسجيل الدخول برمز التحقق (OTP)';

  @override
  String get loginForgotPassword => 'هل نسيت كلمة المرور؟';

  @override
  String get otpTitle => 'التحقق من الرمز (OTP)';

  @override
  String get otpEmailLabel => 'عنوان البريد الإلكتروني';

  @override
  String get otpSendButton => 'إرسال الرمز';

  @override
  String get otpCodeLabel => 'رمز التحقق';

  @override
  String get otpVerifyButton => 'تحقق';

  @override
  String get forgotPasswordTitle => 'إعادة تعيين كلمة المرور';

  @override
  String get forgotPasswordEmailLabel => 'البريد الإلكتروني';

  @override
  String get forgotPasswordSendButton => 'إرسال رابط إعادة التعيين';

  @override
  String get dashboardTitle => 'لوحة القيادة';

  @override
  String get dashboardTotalBalance => 'الرصيد الإجمالي';

  @override
  String get dashboardRecentActivity => 'النشاط الأخير';

  @override
  String get dashboardNoActivity => 'لا توجد معاملات أخيرة.';

  @override
  String get transactionsTitle => 'المعاملات';

  @override
  String get transactionsHistory => 'سجل المعاملات';

  @override
  String get transactionsNoTransactions => 'لم يتم العثور على معاملات.';

  @override
  String get transactionsAddTooltip => 'إضافة معاملة';

  @override
  String get budgetsTitle => 'الميزانيات';

  @override
  String get budgetsNoBudgets => 'لا توجد ميزانيات نشطة.';

  @override
  String get budgetsCategory => 'الفئة';

  @override
  String budgetsSpent(String amount) {
    return '$amount تم إنفاقه';
  }

  @override
  String budgetsLeft(String amount) {
    return '$amount متبقي';
  }

  @override
  String get profileTitle => 'الملف الشخصي والأمان';

  @override
  String get profileSecuritySettings => 'إعدادات الأمان';

  @override
  String get profileSecuritySubtitle => 'إدارة المصادقة الثنائية والأجهزة';

  @override
  String get profileLogout => 'تسجيل الخروج';

  @override
  String get errorGeneric => 'حدث خطأ. يرجى المحاولة مرة أخرى لاحقًا.';

  @override
  String get navDashboard => 'لوحة القيادة';

  @override
  String get navTransactions => 'المعاملات';

  @override
  String get navBudgets => 'الميزانيات';

  @override
  String get navProfile => 'الملف الشخصي';
}
