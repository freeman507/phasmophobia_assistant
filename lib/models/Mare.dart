import 'package:phasmophobiaassistant/models/Ghost.dart';

class Mare implements Ghost {
  String _name = "mare";

  List<String> _descriptions = [
    "mare.description1"
  ];

  String _strength = "mare.strength";

  String _weakness = "mare.weakness";

  String _evidences = "mare.evidences";

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
