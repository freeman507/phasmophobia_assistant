import 'package:phasmophobiaassistant/models/Objective.dart';

class CrucifixObjective implements Objective {

  String _name = "Crucifix";

  String _description = "Prevent the Ghost from hunting with a Crucifix.";

  String _details = "For the Crucifix to successfully prevent a hunt, it must be in the vicinity of the ghost when it starts the hunt. The Crucifix has a range of 3 meters for most ghosts, and 5 meters for the Banshee. When the ghost initiates the hunt, it checks to see if it is in range of a crucifix. If it is, the hunt does not begin, turning all the lights off and taking one of two charges the Crucifix has.";

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