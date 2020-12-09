import 'package:phasmophobiaassistant/models/Evidence.dart';
import 'package:phasmophobiaassistant/models/Fingerprints.dart';
import 'package:phasmophobiaassistant/models/FreezingTemperatures.dart';
import 'package:phasmophobiaassistant/models/Ghost.dart';
import 'package:phasmophobiaassistant/models/SpiritBox.dart';

class Wraith implements Ghost {

  String _name = "wraith";

  List<String> _descriptions = [
    "wraith.description1",
    "wraith.description2",
  ];

  String _strength = "wraith.strength";

  String _weakness = "wraith.weakness";

  List<Evidence> _evidences = [
    Fingerprints(),
    FreezingTemperatures(),
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