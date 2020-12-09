import 'package:phasmophobiaassistant/models/Evidence.dart';
import 'package:phasmophobiaassistant/models/FreezingTemperatures.dart';
import 'package:phasmophobiaassistant/models/Ghost.dart';
import 'package:phasmophobiaassistant/models/GhostOrb.dart';
import 'package:phasmophobiaassistant/models/SpiritBox.dart';

class Mare implements Ghost {
  String _name = "mare";

  List<String> _descriptions = [
    "mare.description1"
  ];

  String _strength = "mare.strength";

  String _weakness = "mare.weakness";

  List<Evidence> _evidences = [FreezingTemperatures(), GhostOrb(), SpiritBox()];

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
