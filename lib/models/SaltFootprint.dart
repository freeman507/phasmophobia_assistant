import 'package:phasmophobiaassistant/models/Objective.dart';

class SaltFootprint implements Objective {

  String _name = "salt.footprint";

  String _description = "salt.footprint.description";

  String _details = "salt.footprint.details";

  List<String> _images = [
    "assets/ghost.salt1.jpg",
    "assets/ghost.salt2.jpg",
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