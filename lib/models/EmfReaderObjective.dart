import 'package:phasmophobiaassistant/models/Objective.dart';

class EmfReaderObjective implements Objective {

  String _name = "emf.reader";
  String _description = "emf.reader.description";
  String _details = "emf.reader.details";

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