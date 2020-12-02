import 'package:phasmophobiaassistant/models/Objective.dart';

class GhostPhoto implements Objective {

  String _name = "ghost.photo";

  String _description = "ghost.photo.description";

  String _details = "ghost.photo.details";

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