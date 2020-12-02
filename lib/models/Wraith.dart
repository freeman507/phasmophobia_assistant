import 'package:phasmophobiaassistant/models/Ghost.dart';

class Wraith implements Ghost {

  String _name = "wraith";

  List<String> _descriptions = [
    "wraith.description1",
    "wraith.description2",
  ];

  String _strength = "wraith.strength";

  String _weakness = "wraith.weakness";

  String _evidences = "wraith.evidences";

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