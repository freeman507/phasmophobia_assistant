import 'package:phasmophobiaassistant/models/Evidence.dart';

class GhostWriting implements Evidence {
  String _name = "Ghost Writing";

  List<String> _descriptions = [
    "Ghost Writing is Evidence used to determine which ghost is haunting the location. It can be obtained by using a Ghost Writing Book.",
  ];

  List<String> _howItWorks = [
    "If Ghost Writing is a piece of evidence, the ghost has a 5-in-12 chance to interact with the Ghost Writing Book. You can increase the Ghost Activity in the room to increase the chance of this occuring.",
    "Taking a photograph of the Ghost Writing Book after it has been written in with a Photo Camera will count as an Interaction for Photo Evidence.",
  ];

  String _ghosts = "Demon | Oni | Revenant | Shade | Spirit | Yurei";

  @override
  List<String> descriptions() {
    return _descriptions;
  }

  @override
  String ghosts() {
    return _ghosts;
  }

  @override
  List<String> howItWorks() {
    return _howItWorks;
  }

  @override
  String name() {
    return _name;
  }
}
