import 'package:phasmophobiaassistant/models/EmfLevelFive.dart';
import 'package:phasmophobiaassistant/models/Evidence.dart';
import 'package:phasmophobiaassistant/models/FreezingTemperatures.dart';
import 'package:phasmophobiaassistant/models/Ghost.dart';
import 'package:phasmophobiaassistant/models/GhostOrb.dart';

class Phantom implements Ghost {

  String _name = "phantom";

  List<String> _descriptions = [
    "phantom.description1",
    "phantom.description2",
  ];

  String _strength = "phantom.strength";

  String _weakness = "phantom.weakness";

  List<Evidence> _evidences = [
    EmfLevelFive(),
    FreezingTemperatures(),
    GhostOrb()
  ];

  @override
  List<String> descriptions() {
    return _descriptions;
  }

  @override
  List<Evidence> evidences() {
    return _evidences;
  }

  @override
  String name() {
    return _name;
  }

  @override
  String strength() {
    return _strength;
  }

  @override
  String weakness() {
    return _weakness;
  }

}