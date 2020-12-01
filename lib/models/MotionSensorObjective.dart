import 'package:phasmophobiaassistant/models/Objective.dart';

class MotionSensorObjective implements Objective {

  String _name = "Motion Sensor";

  String _description = "Detect a Ghosts presence with a Motion Sensor";

  String _details = "The Motion Sensor is a purchasable support item. It is the most expensive piece of equipment in the game, costing \$100, but it can be very handy when tracking the movement of the Ghost, providing a visual and audio cue when the ghost moves through it. The Motion Sensor also displays on the Site Map, allowing for the Ghost's movement to be detected from the safety of the Van.";

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