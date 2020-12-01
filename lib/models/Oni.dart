import 'package:phasmophobiaassistant/models/Ghost.dart';

class Oni implements Ghost {
  String _name = "Oni";

  List<String> _descriptions = [
    "The Oni is one of twelve types of Ghosts in Phasmophobia. It is similar to the Demon, and as such, is much more active and aggressive when players are grouped together, with a higher chance to initiate hunts. This can make players confuse it with a Demon provided they continue to remain close together the entire mission and never separating. However, this power also works against it; it is one of the most active ghosts in the game, and will more readily give up evidence to a group of investigators, which can make for generous and swift investigations if an Oni is quick to reveal the necessary evidence.",
    "Unlike with most other ghost types, splitting up is the best method of defense when searching for an Oni, as it much less active while players are alone. Though this can be a disadvantageous strategy, particularly if the ghost is revealed to be a Banshee, it can also allow players to find the Ghost Room quicker, as well as keep them from huddling together in hiding spaces during hunts.",
    "The Oni is also described as being extremely strong, and it will throw objects around the room with great force when interacting with them. However, these objects are not dangerous to the hunters or their sanity unlike those thrown by Poltergeists."
  ];

  String _strength =
      "Oni are more active when people are nearby and have been seen moving objects at great speed.";

  String _weakness =
      "Being more active will make the Oni easier to find and identify.";

  String _evidences = "EMF Level 5 | Ghost Writing | Spirit Box";

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
