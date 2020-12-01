import 'package:phasmophobiaassistant/models/Ghost.dart';

class Demon implements Ghost {
  String _name = "Demon";

  List<String> _descriptions = [
    "Demons are one of the twelve types of Ghosts in Phasmophobia. It is generally regarded as the most dangerous type of ghost to encounter; noted for being highly aggressive, it will attack more often than any other ghost, and usually without warning. Though it may frequently hinder more conventional methods of investigation, it will also allow ghost hunters to use the Ouija Board without reducing their sanity if a question is answered successfully, allowing for critical information to be obtained with a bit of safety to sanity.",
    "If the investigation and objectives are not dealt with quickly, Demons can grow to be the most challenging ghost. They are notorious for initiating hunts frequently, a trait that is exacerbated by lower sanity levels, and compounded by higher difficulties like Professional where hunts last much longer. Taking all of these factors into account, Demons at their most aggressive will hunt in intervals as short as half-minutes, forcing the players to spend more total time hiding than investigating."
  ];

  String _strength = "Demons are the most aggressive and enter hunt mode more.";

  String _weakness =
      "Asking a Demon successful questions on the Ouija Board won't lower the user's sanity.";

  String _evidences = "Freezing Temperatures | Ghost Writing | Spirit Box";

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
