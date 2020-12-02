import 'package:phasmophobiaassistant/models/Objective.dart';

class SaltFootprint implements Objective {

  String _name = "salt.footprint";

  String _description = "salt.footprint.description";

  String _details = "salt.footprint.details";

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