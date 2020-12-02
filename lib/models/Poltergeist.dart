import 'package:phasmophobiaassistant/models/Ghost.dart';

class Poltergeist implements Ghost {

  String _name = "poltergeist";

  List<String> _descriptions = [
    "poltergeist.description1",
    "poltergeist.description2",
  ];

  String _strength = "poltergeist.strength";

  String _weakness = "poltergeist.weakness";

  String _evidences = "poltergeist.evidences";

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