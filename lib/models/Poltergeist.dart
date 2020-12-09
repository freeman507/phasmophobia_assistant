import 'package:phasmophobiaassistant/models/Evidence.dart';
import 'package:phasmophobiaassistant/models/Fingerprints.dart';
import 'package:phasmophobiaassistant/models/Ghost.dart';
import 'package:phasmophobiaassistant/models/GhostOrb.dart';
import 'package:phasmophobiaassistant/models/SpiritBox.dart';

class Poltergeist implements Ghost {

  String _name = "poltergeist";

  List<String> _descriptions = [
    "poltergeist.description1",
    "poltergeist.description2",
  ];

  String _strength = "poltergeist.strength";

  String _weakness = "poltergeist.weakness";

  List<Evidence> _evidences = [GhostOrb(), Fingerprints(), SpiritBox()];

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