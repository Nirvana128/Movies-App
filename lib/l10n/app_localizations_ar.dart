// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get register => 'إنشاء الحساب';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get avatar => 'الصورة الشخصية';

  @override
  String get name => 'الاسم';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get password => 'كلمة المرور';

  @override
  String get confirmPassword => 'تأكيد كلمة المرور';

  @override
  String get phoneNumber => 'رقم الهاتف';

  @override
  String get createAccount => 'إنشاء حساب';

  @override
  String get alreadyHaveAnAccount => 'هل لديك حساب بالفعل؟';
}
