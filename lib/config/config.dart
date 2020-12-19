import 'package:shared_preferences/shared_preferences.dart';

bool enableDiscardEvidence = false;

Future<void> saveLanguageConfiguration(bool enable) async {
  final prefs = await SharedPreferences.getInstance();

  prefs.setString('enableDiscardEvidence', enable ? "1" : "0");
}

Future<void> loadLanguageConfiguration() async {
  final prefs = await SharedPreferences.getInstance();

  enableDiscardEvidence =
      prefs.getString('enableDiscardEvidence') == "1" ? true : false;
}

Future<void> saveMissionState(Map map) async {
  final prefs = await SharedPreferences.getInstance();
  for (String key in map.keys) {
    if (map[key] is bool) {
      prefs.setString(key, map[key] ? "1" : "0");
    } else {
      prefs.setString(key, map[key]);
    }
  }
}

Future<void> loadMissionState(Map map) async {
  final prefs = await SharedPreferences.getInstance();

  for (String key in prefs.getKeys()) {
    var value = prefs.getString(key);
    if (value == "1") {
      map[key] = true;
    } else if (value == "0") {
      map[key] = false;
    } else {
      map[key] = value;
    }
  }
}
