import 'package:phasmophobiaassistant/models/EmfLevelFive.dart';
import 'package:phasmophobiaassistant/models/Evidence.dart';
import 'package:phasmophobiaassistant/models/Fingerprints.dart';
import 'package:phasmophobiaassistant/models/FreezingTemperatures.dart';
import 'package:phasmophobiaassistant/models/Ghost.dart';

class Banshee implements Ghost {
  String _name = "banshee";

  List<String> _description = [
    "banshee.description1",
    "banshee.description2",
  ];

  String _strength = "banshee.strength";

  String _weakness = "banshee.weakness";

  List<Evidence> _evidences = [
    EmfLevelFive(),
    Fingerprints(),
    FreezingTemperatures()
  ];

  @override
  List<String> descriptions() {
    return _description;
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
