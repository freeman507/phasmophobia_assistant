import 'package:phasmophobiaassistant/models/Objective.dart';

class DirtWater implements Objective {

  String _name = "Dirt Water";

  String _description = "Capture a photo of Dirty Water in a sink.";

  String _details = "A Ghost can create dirty water in one of two ways: interacting with a sink already filled with water, or by activating an empty sink. This can be useful for tracking the Ghost's general location.";

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