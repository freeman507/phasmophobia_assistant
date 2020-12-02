import 'package:phasmophobiaassistant/models/Objective.dart';

class CrucifixObjective implements Objective {

  String _name = "crucifix";

  String _description = "crucifix.description";

  String _details = "crucifix.details";

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