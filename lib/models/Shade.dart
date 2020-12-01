import 'package:phasmophobiaassistant/models/Ghost.dart';

class Shade implements Ghost {
  String _name = "Shade";

  List<String> _descriptions = [
    "Noted as being shy ghosts, Shades lower their activity in the presence of multiple investigators. Because of its temperament, it can be harder to find Ghost Activity when sticking together. However, like all ghosts in the game, the Shade is more likely to hunt when the players' Sanity is low.",
    "If a Shade is already hunting, it will prefer to target players that are alone. The Shade follows the general definition of \"alone\", in the sense of a player being in a room on their own, even if other players are physically close."
  ];

  String _strength =
      "As a shy ghost, a Shade will rarely perform actions in the presence of two or more people, making it harder to detect.";

  String _weakness =
      "Conversely, a Shade will rarely start a Hunt when players are grouped together.";

  String _evidences = "EMF Level 5 | Ghost Orb | Ghost Writing";

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
