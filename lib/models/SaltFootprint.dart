import 'package:phasmophobiaassistant/models/Objective.dart';

class SaltFootprint implements Objective {

  String _name = "Salt Footprint";

  String _description = "Get a Ghost to walk through Salt.";

  String _details = "A ghost can only step in salt every 10 seconds, and will not step in salt during the Hunt. If a Wraith comes into contact with salt, it will stop attacking immediately, at the cost of permanently increasing Ghost Activity.";

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