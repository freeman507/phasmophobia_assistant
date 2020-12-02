import 'package:phasmophobiaassistant/models/Objective.dart';

class LowTemperature implements Objective {

  String _name = "below.10c.50f";

  String _description = "low.temperature.description";

  String _details = "low.temperature.details";

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