import 'package:phasmophobiaassistant/models/Evidence.dart';

class FreezingTemperatures implements Evidence {
  String _name = "freezing.temperatures";

  List<String> _descriptions = [
    "freezing.temperatures.description1",
    "freezing.temperatures.description2",
  ];

  List<String> _howItWorks = [
    "freezing.temperatures.howitworks1",
    "freezing.temperatures.howitworks2",
  ];

  String _ghosts = "freezing.temperatures.ghosts";

  @override
  List<String> descriptions() {
    return _descriptions;
  }

  @override
  String ghosts() {
    return _ghosts;
  }

  @override
  List<String> howItWorks() {
    return _howItWorks;
  }

  @override
  String name() {
    return _name;
  }
}
