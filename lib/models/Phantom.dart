import 'package:phasmophobiaassistant/models/Ghost.dart';

class Phantom implements Ghost {

  String _name = "phantom";

  List<String> _descriptions = [
    "phantom.description1",
    "phantom.description2",
  ];

  String _strength = "phantom.strength";

  String _weakness = "phantom.weakness";

  String _evidences = "phantom.evidences";

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