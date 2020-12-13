import 'package:phasmophobiaassistant/models/Objective.dart';

class DirtWater implements Objective {

  String _name = "dirt.water";

  String _description = "dirt.water.description";

  String _details = "dirt.water.details";

  List<String> _images = [
    "assets/dirt.water1.jpg",
    "assets/dirt.water2.jpg",
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