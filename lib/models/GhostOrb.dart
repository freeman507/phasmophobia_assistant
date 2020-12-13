import 'package:phasmophobiaassistant/models/Evidence.dart';

class GhostOrb implements Evidence {
  String _name = "ghost.orbs";

  List<String> _descriptions = [
    "ghost.orbs.description1"
  ];

  List<String> _howItWorks = [
    "ghost.orbs.howitworks1",
  ];

  String _ghosts = "ghost.orbs.ghosts";

  List<String> _images = [
    "assets/ghost.orb.jpg",
  ];

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

  @override
  List<String> images() {
    return _images;
  }
}
