import 'package:phasmophobiaassistant/models/Evidence.dart';
import 'package:phasmophobiaassistant/models/FreezingTemperatures.dart';
import 'package:phasmophobiaassistant/models/Ghost.dart';
import 'package:phasmophobiaassistant/models/GhostWriting.dart';
import 'package:phasmophobiaassistant/models/SpiritBox.dart';

class Demon implements Ghost {
  String _name = "demon";

  List<String> _descriptions = [
    "demon.description1",
    "demon.description2",
  ];

  String _strength = "demon.strength";

  String _weakness = "demon.weakness";

  List<Evidence> _evidences = [
    FreezingTemperatures(),
    GhostWriting(),
    SpiritBox()
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
