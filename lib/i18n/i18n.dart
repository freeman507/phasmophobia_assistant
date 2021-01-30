import 'package:phasmophobiaassistant/i18n/english.dart';
import 'package:phasmophobiaassistant/i18n/french.dart';
import 'package:phasmophobiaassistant/i18n/germany.dart';
import 'package:phasmophobiaassistant/i18n/italian.dart';
import 'package:phasmophobiaassistant/i18n/japanese.dart';
import 'package:phasmophobiaassistant/i18n/polish.dart';
import 'package:phasmophobiaassistant/i18n/portuguese.dart';
import 'package:phasmophobiaassistant/i18n/russian.dart';
import 'package:phasmophobiaassistant/i18n/spanish.dart';
import 'package:phasmophobiaassistant/i18n/ukrainian.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'greek.dart';

String language = "";

String i(String keyWord) {
  String result = keyWord;

  if (language == "english") {
    result = searchWord(keyWord, result, english);
  } else if (language == "portuguese") {
    result = searchWord(keyWord, result, portuguese);
  } else if (language == "germany") {
    result = searchWord(keyWord, result, germany);
  } else if (language == "spanish") {
    result = searchWord(keyWord, result, spanish);
  } else if (language == "french") {
    result = searchWord(keyWord, result, french);
  } else if (language == "polish") {
    result = searchWord(keyWord, result, polish);
  } else if (language == "russian") {
    result = searchWord(keyWord, result, russian);
  } else if (language == "ukranian") {
    result = searchWord(keyWord, result, ukranian);
  } else if (language == "greek") {
    result = searchWord(keyWord, result, greek);
  } else if (language == "italian") {
    result = searchWord(keyWord, result, italian);
  } else if (language == "japanese") {
    result = searchWord(keyWord, result, japanese);
  }

  return result;
}

String searchWord(String keyWord, String result, Map map) {
  map.forEach((key, value) {
    if (keyWord == key) {
      result = value;
      return;
    }
  });
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
