import 'package:phasmophobiaassistant/models/EmfLevelFive.dart';
import 'package:phasmophobiaassistant/models/Evidence.dart';
import 'package:phasmophobiaassistant/models/Fingerprints.dart';
import 'package:phasmophobiaassistant/models/Ghost.dart';
import 'package:phasmophobiaassistant/models/GhostWriting.dart';

class Revenant implements Ghost {
  String _name = "revenant";

  List<String> _descriptions = [
    "revenant.description1",
    "revenant.description2",
  ];

  String _strength = "revenant.strength";

  String _weakness = "revenant.weakness";

  List<Evidence> _evidences = [EmfLevelFive(), Fingerprints(), GhostWriting()];

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
