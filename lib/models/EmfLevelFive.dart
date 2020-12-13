import 'package:phasmophobiaassistant/models/Evidence.dart';

class EmfLevelFive implements Evidence {
  String _name = "emf.level.5";

  List<String> _descriptions = [
    "emf.level.5.description1",
    "emf.level.5.description2",
  ];

  List<String> _howItWorks = [
    "emf.level.5.howitworks1",
    "emf.level.5.howitworks2",
    "emf.level.5.howitworks3",
    "emf.level.5.howitworks4",
  ];

  List<String> _images = [
    "assets/emf5.jpg"
  ];

  String _ghosts = "emf.level.5.ghosts";

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

  @override
  List<String> images() {
    return _images;
  }
}
