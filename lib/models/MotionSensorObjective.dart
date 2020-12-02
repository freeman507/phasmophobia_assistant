import 'package:phasmophobiaassistant/models/Objective.dart';

class MotionSensorObjective implements Objective {

  String _name = "motion.sensor";

  String _description = "motion.sensor.description";

  String _details = "motion.sensor.details";

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