import 'package:phasmophobiaassistant/models/Evidence.dart';

class FreezingTemperatures implements Evidence {
  String _name = "Freezing Temperatures";

  List<String> _descriptions = [
    "Freezing Temperatures are a piece of Evidence used to determine which type of Ghost is haunting the location.",
    "Temperature can be read by using a Thermometer; evidence-wise, Freezing Temperatures are anything below 0°C/32°F on the Thermometer.",
  ];

  List<String> _howItWorks = [
    "Temperature will start to decrease in a room that a ghost occupies; if Freezing Temperatures is a piece of evidence, the temperature will drop three times as fast. When a Ghost is present in a room where Freezing Temperatures is not a piece of evidence, it can only reduce the temperature to 5°C/40.9°F. However, there is an error margin of 2° on the Thermometer, so a room can appear to be as low as 3°C/37.9°F if the ghost does not cause Freezing Temperatures.",
    "Freezing Temperatures will also cause investigators to release visible exhalations both on camera and in person once the temperature drops low enough. This can be used as evidence in lieu of having a Thermometer active, taking care to ensure that the \"breath\" is not being confused with smoke from a Smudge Stick.",
  ];

  String _ghosts = "Banshee | Demon | Mare | Phantom | Wraith | Yurei";

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
