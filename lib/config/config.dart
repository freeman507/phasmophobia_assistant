import 'package:shared_preferences/shared_preferences.dart';

bool enableDiscardEvidence = false;

Future<void> saveConfig(bool enable) async {
  final prefs = await SharedPreferences.getInstance();

  prefs.setString('enableDiscardEvidence', enable ? "1" : "0");
}

Future<void> loadConfig() async {
  final prefs = await SharedPreferences.getInstance();

  enableDiscardEvidence =
      prefs.getString('enableDiscardEvidence') == "1" ? true : false;
}
