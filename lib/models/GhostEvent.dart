import 'package:phasmophobiaassistant/models/Objective.dart';

class GhostEvent implements Objective {

  String _name = "Ghost Event";
  String _description = "Have a member of your team witness a Ghost Event";
  String _details =
      "A Ghost Event refers to any event in which the ghost manifests outside of a hunt. This includes visual appearances, voices, closing doors, and turning off light switches.";

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
