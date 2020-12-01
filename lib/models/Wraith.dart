import 'package:phasmophobiaassistant/models/Ghost.dart';

class Wraith implements Ghost {

  String _name = "Wraith";

  List<String> _descriptions = [
    "A Wraith is one of the most dangerous Ghosts you will find. It is also the only known ghost that has the ability of flight and has sometimes been known to travel through walls.",
    "Wraiths are one of the twelve types of Ghosts that can be encountered in Phasmophobia, and the second one described in the Journal. It is best known for being able to \"fly\", causing it to not produce footsteps when moving (for the most part), and most dangerously can see through doors, closets, and lockers when Hunting players, demanding either more creative hiding spots or very fast feet."
  ];

  String _strength = "Wraiths almost never touch the ground, meaning footprint sounds are rare to non-existant. It can travel through walls and doors without opening them. Wraiths will however leave footprints in salt if stepped in.";

  String _weakness = "Wraiths have a toxic reaction to Salt. If a Wraith comes into contact with a pile of salt, it will immediately cease attacking.";

  String _evidences = "Fingerprints | Freezing Temperatures | Spirit Box";

  @override
  List<String> descriptions() {
    return _descriptions;
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