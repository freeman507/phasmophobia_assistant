import 'package:phasmophobiaassistant/models/Ghost.dart';

class Poltergeist implements Ghost {

  String _name = "Poltergeist";

  List<String> _descriptions = [
    "One of the most famous Ghosts, a Poltergeist, also known as a noisy ghost can manipulate objects around it to spread fear into it's victims.",
    "Poltergeists are one of the 12 types of ghosts that can be encountered in Phasmophobia."
  ];

  String _strength = "A Poltergeist is capable of influencing more objects at once than any other Ghosts, and is capable of shutting multiple doors at once.";

  String _weakness = "A Poltergeist is almost ineffective in an empty room.";

  String _evidences = "Ghost Orb | Fingerprints | Spirit Box";

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