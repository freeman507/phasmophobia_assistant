import 'package:phasmophobiaassistant/models/Ghost.dart';

class Banshee implements Ghost {

  String _name = "banshee";

  List<String> _description = [
    "banshee.description1",
    "banshee.description2",
  ];

  String _strength = "banshee.strength";

  String _weakness = "banshee.weakness";

  String _evidences = "banshee.evidences";

  @override
  List<String> descriptions() {
    return _description;
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