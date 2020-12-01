import 'package:phasmophobiaassistant/models/Evidence.dart';

class GhostOrb implements Evidence {
  String _name = "Ghost Orbs";

  List<String> _descriptions = [
    "Ghost Orbs are a type of Evidence which are used to help determine which type of Ghost is haunting the location.",
  ];

  List<String> _howItWorks = [
    "They are emitted in the Ghost Room, and look like very small yellow orbs that glide across the screen, generally one at a time. They can be seen on the computer screen using a Video Camera or a Head Mounted Camera with night vision. Depending on the haunting location, ghost orbs at times can be detected from the outdoors before entering a building and initiating the Setup Phase countdown.",
  ];

  String _ghosts = "Jinn | Mare | Phantom | Poltergeist | Shade | Yurei";

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
