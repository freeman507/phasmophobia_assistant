import 'package:phasmophobiaassistant/models/Ghost.dart';

class Mare implements Ghost {
  String _name = "Mare";

  List<String> _descriptions = [
    "The Mare is one of twelve types of Ghosts in Phasmophobia. It is the source of all nightmares, making it most powerful in the dark. Mares have a higher chance of initiating hunts when players are in darkness, especially if the lights are turned off in the ghost room. It tends to turn lights and the fuse box off more than any other ghost type when active, although if a ghost switches lights back on, it is much more likely to be a Poltergeist or Jinn. An active Mare stalking low-sanity players have the capacity to initiate hunts within mere moments of each other, allowing them to rival even Demons in aggression."
  ];

  String _strength =
      "Increased chance to attack in the dark. As such, it will do what it can to achieve this, such as turning off lights and tripping the fuse box.";

  String _weakness = "Turning the lights on will lower its chance to attack.";

  String _evidences = "Freezing Temperatures | Ghost Orb | Spirit Box";

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
