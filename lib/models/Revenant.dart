import 'package:phasmophobiaassistant/models/Ghost.dart';

class Revenant implements Ghost {
  String _name = "Revenant";

  List<String> _descriptions = [
    "The Revenant is one of twelve Ghost types in Phasmophobia. It is a slow, but violent ghost that will attack indiscriminately. It is said to travel at higher speeds when hunting.",
    "Unlike other Ghosts, who will often have a specific target selected when starting a Hunt they will hone in on, Revenants can freely switch targets if there is another player that is closer by - and especially one that is in plain view and available, making its goal of killing players more convenient."
  ];

  String _strength =
      "A Revenant will travel at a significantly faster speed when hunting a victim. Additionally, the Revenant can freely switch whoever it is targeting during a Hunt.";

  String _weakness =
      "Hiding from the Revenant will cause it to move very slowly.";

  String _evidences = "EMF Level 5 | Fingerprints | Ghost Writing";

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
