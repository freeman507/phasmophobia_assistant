import 'package:phasmophobiaassistant/models/Objective.dart';

class DirtWater implements Objective {

  String _name = "dirt.water";

  String _description = "dirt.water.description";

  String _details = "dirt.water.details";

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