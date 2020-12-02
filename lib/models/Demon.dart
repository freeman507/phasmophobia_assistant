import 'package:phasmophobiaassistant/models/Ghost.dart';

class Demon implements Ghost {
  String _name = "demon";

  List<String> _descriptions = [
    "demon.description1",
    "demon.description2",
  ];

  String _strength = "demon.strength";

  String _weakness = "demon.weakness";

  String _evidences = "demon.evidences";

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
