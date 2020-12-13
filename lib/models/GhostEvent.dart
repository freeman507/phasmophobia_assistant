import 'package:phasmophobiaassistant/models/Objective.dart';

class GhostEvent implements Objective {

  String _name = "ghost.event";
  String _description = "ghost.event.description";
  String _details = "ghost.event.details";

  List<String> _images = [];

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
