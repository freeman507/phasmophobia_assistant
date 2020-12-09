import 'package:phasmophobiaassistant/models/EmfLevelFive.dart';
import 'package:phasmophobiaassistant/models/Evidence.dart';
import 'package:phasmophobiaassistant/models/Ghost.dart';
import 'package:phasmophobiaassistant/models/GhostWriting.dart';
import 'package:phasmophobiaassistant/models/SpiritBox.dart';

class Oni implements Ghost {
  String _name = "oni";

  List<String> _descriptions = [
    "oni.description1",
    "oni.description2",
    "oni.description3",
  ];

  String _strength = "oni.strength";

  String _weakness = "oni.weakness";

  List<Evidence> _evidences = [EmfLevelFive(), GhostWriting(), SpiritBox()];

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
