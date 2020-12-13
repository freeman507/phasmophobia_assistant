import 'package:phasmophobiaassistant/models/Objective.dart';

class SmudgeSticksObjective implements Objective {

  String _name = "smudge.sticks";

  String _description = "smudge.sticks.description";

  String _details = "smudge.sticks.details";

  List<String> _images = [
    "assets/smudge.sticks1.jpg",
    "assets/smudge.sticks2.jpg",
  ];

  @override
  String description() {
    return _description;
  }

  @override
  String details() {
    return _details;
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