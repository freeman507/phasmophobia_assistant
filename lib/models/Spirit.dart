import 'package:phasmophobiaassistant/models/Ghost.dart';

class Spirit implements Ghost {

  String _name = "spirit";

  List<String> _descriptions = [
    "spirit.description1",
  ];

  String _strength = "spirit.strength";

  String _weakness = "spirit.weakness";

  String _evidences = "spirit.evidences";

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