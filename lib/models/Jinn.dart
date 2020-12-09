import 'package:phasmophobiaassistant/models/EmfLevelFive.dart';
import 'package:phasmophobiaassistant/models/Evidence.dart';
import 'package:phasmophobiaassistant/models/Ghost.dart';
import 'package:phasmophobiaassistant/models/GhostOrb.dart';
import 'package:phasmophobiaassistant/models/SpiritBox.dart';

class Jinn implements Ghost {
  String _name = "jinn";

  List<String> _descriptions = [
    "jinn.description1",
    "jinn.description2",
  ];

  String _strength = "jinn.strength";

  String _weakness = "jinn.weakness";

  List<Evidence> _evidences = [EmfLevelFive(), GhostOrb(), SpiritBox()];

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
