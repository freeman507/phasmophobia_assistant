import 'package:phasmophobiaassistant/models/Objective.dart';

class SmudgeSticksObjective implements Objective {

  String _name = "smudge.sticks";

  String _description = "smudge.sticks.description";

  String _details = "smudge.sticks.details";

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

}