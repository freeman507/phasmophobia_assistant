import 'package:phasmophobiaassistant/models/Ghost.dart';

class Shade implements Ghost {
  String _name = "shade";

  List<String> _descriptions = [
    "shade.description1",
    "shade.description2",
  ];

  String _strength = "shade.strength";

  String _weakness = "shade.weakness";

  String _evidences = "shade.evidences";

  @override
  List<String> descriptions() {
    return _descriptions;
  }

  @override
  String evidences() {
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
