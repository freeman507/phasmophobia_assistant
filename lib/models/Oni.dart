import 'package:phasmophobiaassistant/models/Ghost.dart';

class Oni implements Ghost {
  String _name = "oni";

  List<String> _descriptions = [
    "oni.description1",
    "oni.description2",
    "oni.description3",
  ];

  String _strength = "oni.strength";

  String _weakness = "oni.weakness";

  String _evidences = "oni.evidences";

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
