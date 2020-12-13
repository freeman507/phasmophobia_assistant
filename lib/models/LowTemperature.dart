import 'package:phasmophobiaassistant/models/Objective.dart';

class LowTemperature implements Objective {

  String _name = "below.10c.50f";

  String _description = "low.temperature.description";

  String _details = "low.temperature.details";

  List<String> _images = [
    "assets/low.temperature1.jpg",
    "assets/low.temperature2.jpg",
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