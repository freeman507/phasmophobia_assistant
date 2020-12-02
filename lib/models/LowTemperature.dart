import 'package:phasmophobiaassistant/models/Objective.dart';

class LowTemperature implements Objective {

  String _name = "Below 10°C or 50° F";

  String _description = "Detect a room below 10 Celsius or 50 Fahrenheit with a Thermometer.";

  String _details = "The Thermometer reads the temperature by casting a 6-metre ray in the direction the player is facing, making it a directional tool. The recorded temperature fluctuates within a range of ±2 degrees, both for Celsius and Fahrenheit.";

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