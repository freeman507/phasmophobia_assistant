import 'package:phasmophobiaassistant/models/Evidence.dart';
import 'package:phasmophobiaassistant/models/FreezingTemperatures.dart';
import 'package:phasmophobiaassistant/models/Ghost.dart';
import 'package:phasmophobiaassistant/models/GhostOrb.dart';
import 'package:phasmophobiaassistant/models/GhostWriting.dart';

class Yurei implements Ghost {
  String _name = "yurei";

  List<String> _descriptions = [
    "yurei.description1",
  ];

  String _strength = "yurei.strength";

  String _weakness = "yurei.weakness";

  List<Evidence> _evidences = [
    FreezingTemperatures(),
    GhostOrb(),
    GhostWriting()
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
