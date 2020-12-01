import 'package:phasmophobiaassistant/models/Evidence.dart';

class EmfLevelFive implements Evidence {
  String _name = "EMF Level 5";

  List<String> _descriptions = [
    "EMF Level 5 is a piece of Evidence used to determine which type of Ghost is haunting the location.",
    "You can determine the current EMF Level using an EMF Reader."
  ];

  List<String> _howItWorks = [
    "A ghost will have a 25% chance to produce an EMF level 5 emission when the ghost interacts with the environment (see EMF Ghost Interaction), such as when it causes the phone to ring in a classroom.",
    "If a Revenant or Oni manifests itself, the reader will register EMF Level 5.",
    "The EMF Reader will still pick up Level 5 readings when thrown, and has a larger radius of which it will pick it up from.",
    "Taking a picture of a Level 5 reading will count as an interaction picture, and will count as a separate interaction between 2, 3, and 4.",
  ];

  String _ghosts = "Banshee | Jinn | Oni | Phantom | Revenant | Shade";

  @override
  String ghosts() {
    return _ghosts;
  }

  @override
  String name() {
    return _name;
  }

  @override
  List<String> howItWorks() {
    return _howItWorks;
  }

  @override
  List<String> descriptions() {
    return _descriptions;
  }
}
