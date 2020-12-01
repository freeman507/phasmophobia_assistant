import 'package:phasmophobiaassistant/models/Evidence.dart';

class Fingerprints implements Evidence {
  String _name = "Fingerprints";

  List<String> _descriptions = [
    "Fingerprints (or Handprints) are a type of Evidence created by Ghosts that help to indicate which type of Ghost is haunting the location. They are left behind by when they interact with the location's environment. You can see Fingerprints by using the UV Flashlight or the Glowstick.",
  ];

  List<String> _howItWorks = [
    "A ghost will leave behind Fingerprints when it interacts with the environment, the most reliable being the following: Interacting with a door; Interacting with a light switch; Knocking on a window.",
    "Note that when the ghost flickers the lights or touches the Fuse Box, they will not always leave behind Fingerprints.",
    "Sometimes, ghosts can leave fingerprints in strange places, such as the outside of the windows at Brownstone High School, though this is likely due to being a bug.",
    "Fingerprints do not have to be visible when being photographed by a Photo Camera, and will be labeled as \"Fingerprints\" in the Journal. This allows for Fingerprints to be discovered accidentally with an errant photograph."
  ];

  String _ghosts = "Banshee | Poltergeist | Revenant | Spirit | Wraith";

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
