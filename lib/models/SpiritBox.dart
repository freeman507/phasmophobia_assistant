import 'package:phasmophobiaassistant/models/Evidence.dart';

class SpiritBox implements Evidence {
  String _name = "spirit.box";

  List<String> _descriptions = [
    "spirit.box.description1",
  ];

  List<String> _howItWorks = [
    "spirit.box.howitworks1",
    "spirit.box.howitworks2",
    "spirit.box.howitworks3",
    "spirit.box.howitworks4",
    "spirit.box.howitworks5",
    "spirit.box.howitworks6",
    "spirit.box.howitworks7",
    "spirit.box.howitworks8",
    "spirit.box.howitworks9",
    "spirit.box.howitworks10",
    "spirit.box.howitworks11",
  ];

  String _ghosts = "spirit.box.ghosts";

  List<String> _images = [
    "assets/spirit.box1.jpg",
    "assets/spirit.box2.jpg",
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
