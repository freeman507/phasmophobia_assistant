import 'package:phasmophobiaassistant/models/Objective.dart';

class SmudgeSticksObjective implements Objective {

  String _name = "Smudge Sticks";

  String _description = "Cleanse the area near the Ghost using Smudge Sticks";

  String _details = "The smudge sticks will begin to smoke for roughly 15 seconds, and if the Ghost is within 6 meters, Ghost Activity will be increased marginally and the Ghost won't be able to enter a hunt for 90 seconds (180 for Spirit). This won't stop an active hunt. The smudge sticks will function both while in hand or on the floor.";

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