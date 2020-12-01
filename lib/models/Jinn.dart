import 'package:phasmophobiaassistant/models/Ghost.dart';

class Jinn implements Ghost {
  String _name = "Jinn";

  List<String> _descriptions = [
    "The Jinn is one of twelve types of Ghosts in Phasmophobia. It is a territorial ghost that will attack when threatened. It has also been known to travel at significant speed during Hunts.",
    "Jinns tend to interact with electronics more than any other ghost. They may cause phones to ring, radios to activate, TV's to turn on, or car alarms to go off more often. This also extends to light switches, which may cause unsure investigators to confuse a Jinn for a Mare or Poltergeist; although Mares also have the power to turn lights off, they will not often turn lights back on as Jinn do, and Poltergeists will likely disturb more general objects that aren't light switches such as doors."
  ];

  String _strength =
      "A Jinn will travel at a faster speed if its victim is far away.";

  String _weakness =
      "Turning off the location's power source will prevent the Jinn from using its ability.";

  String _evidences = "EMF Level 5 | Ghost Orb | Spirit Box";

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
