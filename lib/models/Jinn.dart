import 'package:phasmophobiaassistant/models/Ghost.dart';

class Jinn implements Ghost {
  String _name = "jinn";

  List<String> _descriptions = [
    "jinn.description1",
    "jinn.description2",
  ];

  String _strength = "jinn.strength";

  String _weakness = "jinn.weakness";

  String _evidences = "jinn.evidences";

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
