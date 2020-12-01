import 'package:phasmophobiaassistant/models/Ghost.dart';

class Spirit implements Ghost {

  String _name = "Spirit";

  List<String> _descriptions = [
    "A Spirit is the most common Ghost you will come across however it is still very powerful and dangerous. They are usually discovered at one of their hunting grounds after an unexplained death."
  ];

  String _strength = "The spirit has no discernible strengths, however it is known to increase its hunting as your sanity drops.";

  String _weakness = "Using Smudge Sticks on a Spirit will stop it attacking for 120 seconds instead of 90.";

  String _evidences = "Ghost Writing | Fingerprints | Spirit Box";

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