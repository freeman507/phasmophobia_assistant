import 'package:phasmophobiaassistant/models/Ghost.dart';

class Yurei implements Ghost {
  String _name = "yurei";

  List<String> _descriptions = [
    "yurei.description1",
  ];

  String _strength = "yurei.strength";

  String _weakness = "yurei.weakness";

  String _evidences = "yurei.evidences";

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
