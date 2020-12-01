import 'package:phasmophobiaassistant/models/Ghost.dart';

class Yurei implements Ghost {
  String _name = "Yurei";

  List<String> _descriptions = [
    "The Yurei is one of twelve types of ghosts in Phasmophobia. It is a ghost that has returned to the physical world, usually for the purpose of revenge or hatred. Although it does not have any implicit bonuses to its ability to Hunt, its main distinction is its constant attack on the hunters' Sanity; if hunters are careless with their Sanity, it will become aggressive very quickly.",
  ];

  String _strength =
      "Yurei have been known to have a stronger effect on people's Sanity.";

  String _weakness =
      "Using Smudge Sticks on the Yurei's Ghost Room will cause it to not wander around the location for ~90 seconds.";

  String _evidences = "Freezing Temperatures | Ghost Orb | Ghost Writing";

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
