import 'package:phasmophobiaassistant/i18n/english.dart';
import 'package:phasmophobiaassistant/i18n/french.dart';
import 'package:phasmophobiaassistant/i18n/germany.dart';
import 'package:phasmophobiaassistant/i18n/polish.dart';
import 'package:phasmophobiaassistant/i18n/portuguese.dart';
import 'package:phasmophobiaassistant/i18n/russian.dart';
import 'package:phasmophobiaassistant/i18n/spanish.dart';
import 'package:phasmophobiaassistant/i18n/ukrainian.dart';
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
  } else if (language == "germany") {
    germany.forEach((key, value) {
      if (keyWord == key) {
        result = value;
        return;
      }
    });
  } else if (language == "spanish") {
    spanish.forEach((key, value) {
      if (keyWord == key) {
        result = value;
        return;
      }
    });
  } else if (language == "french") {
    french.forEach((key, value) {
      if (keyWord == key) {
        result = value;
        return;
      }
    });
  } else if (language == "polish") {
    polish.forEach((key, value) {
      if (keyWord == key) {
        result = value;
        return;
      }
    });
  } else if (language == "russian") {
    russian.forEach((key, value) {
      if (keyWord == key) {
        result = value;
        return;
      }
    });
  } else if (language == "ukranian") {
    ukranian.forEach((key, value) {
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
