import 'package:phasmophobiaassistant/models/EmfLevelFive.dart';
import 'package:phasmophobiaassistant/models/Evidence.dart';
import 'package:phasmophobiaassistant/models/Ghost.dart';
import 'package:phasmophobiaassistant/models/GhostOrb.dart';
import 'package:phasmophobiaassistant/models/GhostWriting.dart';

class Shade implements Ghost {
  String _name = "shade";

  List<String> _descriptions = [
    "shade.description1",
    "shade.description2",
  ];

  String _strength = "shade.strength";

  String _weakness = "shade.weakness";

  List<Evidence> _evidences = [EmfLevelFive(), GhostOrb(), GhostWriting()];

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
