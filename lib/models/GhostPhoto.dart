import 'package:phasmophobiaassistant/models/Objective.dart';

class GhostPhoto implements Objective {

  String _name = "Ghost Photo";

  String _description = "Capture a photo of the Ghost";

  String _details = "Use the Photo Camera to get photo of the Ghost. The Camera will flash a light twice the size of the regular flashlight with 3 times the range of the Glow Stick. It can take pictures through walls, doors, garage doors, windows, and almost all surfaces if the lens is able to clip through it.";

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