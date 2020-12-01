import 'package:phasmophobiaassistant/models/Objective.dart';

class EmfReaderObjective implements Objective {

  String _name = "EMF Reader";
  String _description = "Find evidence of the paranormal with an EMF Reader";
  String _details = "The EMF Reader is a purchasable piece of Equipment used to read the strength of Electro-Magnetic Fields in the nearby environment.";

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