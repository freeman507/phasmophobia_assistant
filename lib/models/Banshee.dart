import 'package:phasmophobiaassistant/models/Ghost.dart';

class Banshee implements Ghost {

  String _name = "Banshee";

  List<String> _description = [
    "The Banshee is one of twelve types of Ghosts in Phasmophobia. The Banshee is a natural hunter and will attack anything. It has been known to stalk its prey one at a time until it makes its kill.",
    "Unlike other ghosts, who will often change their selected target between Hunts, Banshees will always target the same player every time it hunts until it successfully kills them. While this means other players are safe from the Banshee's power so long as its target is alive, it makes carrying out objectives by the targeted player more difficult."
  ];

  String _strength = "A Banshee will focus on one player at a time until it kills them.";

  String _weakness = "Banshees fear the Crucifix, which boosts the Hunt-stopping range of one from 3 meters to 5 meters against it.";

  String _evidences = "EMF Level 5 | Fingerprints | Freezing Temperatures";

  @override
  List<String> descriptions() {
    return _description;
  }

  @override
  String evidences() {
    return _evidences;
  }

  @override
  String name() {
    return _name;
  }

  @override
  String strength() {
    return _strength;
  }

  @override
  String weakness() {
    return _weakness;
  }

}