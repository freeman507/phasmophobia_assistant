import 'package:phasmophobiaassistant/models/Ghost.dart';

class Phantom implements Ghost {

  String _name = "Phantom";

  List<String> _descriptions = [
    "A Phantom is a Ghost that can possess the living, most commonly summoned by a Ouija Board. It also induces fear into those around it.",
    "Phantoms are one of the 12 types of Ghosts that can be encountered in Phasmophobia, and the third one described in the Journal. Contrary to popular belief, the Phantom cannot possess ghost-hunters after using a Ouija Board.",
  ];

  String _strength = "Looking at a Phantom will considerably drop your Sanity. This refers to any visible manifestations of the Phantom, including during a Hunt.";

  String _weakness = "Taking a photo of the Phantom will make it temporarily disappear. This, however, will not stop a Hunt.";

  String _evidences = "EMF Level 5 | Freezing Temperatures | Ghost Orb";

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