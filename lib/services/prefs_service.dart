import 'package:shared_preferences/shared_preferences.dart';

class PrefsKeys {
  static const String englishKey = 'english';
}

class PrefsService {
  // Set language preference.
  static Future<void> setEnglish(bool isEnglish) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(PrefsKeys.englishKey, isEnglish);
  }

  // Get language preference.
  static Future<bool> isEnglish() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(PrefsKeys.englishKey) ?? true;
  }
}
