import 'package:phasmophobiaassistant/i18n/english.dart';
import 'package:phasmophobiaassistant/i18n/portuguese.dart';
import 'package:shared_preferences/shared_preferences.dart';

String language = "";

String i(String keyWord) {
  String result = keyWord;

  if (language == "english") {
    english.forEach((key, value) {
      if (keyWord == key) {
        result = value;
        return;
      }
    });
  } else if (language == "portuguese") {
    portuguese.forEach((key, value) {
      if (keyWord == key) {
        result = value;
        return;
      }
    });
  }

  return result;
}

Future<void> saveLanguage(String newLanguage) async {
  final prefs = await SharedPreferences.getInstance();

  prefs.setString('language', newLanguage);
}

Future<void> loadLanguage() async {
  if (language.isEmpty) {
    final prefs = await SharedPreferences.getInstance();

    language = prefs.getString('language') ?? "english";
  }
}
