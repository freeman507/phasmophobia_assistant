import 'package:phasmophobiaassistant/models/Evidence.dart';

class GhostWriting implements Evidence {
  String _name = "ghost.writing";

  List<String> _descriptions = [
    "ghost.writing.description1",
  ];

  List<String> _howItWorks = [
    "ghost.writing.howitworks1",
    "ghost.writing.howitworks2",
  ];

  String _ghosts = "ghost.writing.ghosts";

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
