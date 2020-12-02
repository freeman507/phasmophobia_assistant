import 'package:phasmophobiaassistant/models/Ghost.dart';

class Revenant implements Ghost {
  String _name = "revenant";

  List<String> _descriptions = [
    "revenant.description1",
    "revenant.description2",
  ];

  String _strength = "revenant.strength";

  String _weakness = "revenant.weakness";

  String _evidences = "revenant.evidences";

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
