import 'package:phasmophobiaassistant/models/Evidence.dart';

class SpiritBox implements Evidence {
  String _name = "Spirit Box";

  List<String> _descriptions = [
    "The Spirit Box is a piece of Equipment, as well as a type of Evidence, that can be used to ask the Ghost questions to get more information. Only certain Ghosts will respond via the Spirit Box, which can be used as Evidence when identifying the Ghost.",
  ];

  List<String> _howItWorks = [
    "To use the Spirit Box, you must be in the same room as the Ghost, or within 3 meters if not in the same room, for it to answer. The lights must be off; additionally, shy ghosts will require you to be the only person in the room (although they will sometimes respond when a group is entering a room due to initially only detecting one player).",
    "The Spirit Box will work if thrown on the ground as long as it is left on and you are within range to ask questions and hear the responses. Sometimes, Ghosts respond to Spirit Boxes placed on the ground without players directly trying to get a response with voice commands. While Ghosts can hear when you are talking no matter what, you must be using proximity chat for the Spirit Box to hear you.",
    "Note that there is evidence that the Spirit Box might work in any location, but the person asking the questions must be near the Ghost. Some ghost hunters have suggested that using broadcast (global chat) to ask questions can work from any location.",
    "---",
    "*** Difficulty Questions ***",
    "---",
    "What do you want?",
    "Why are you here?",
    "Do you want to hurt us?",
    "Are you angry?",
    "Do you want us here?",
    "Shall we leave?",
    "Should we leave?",
    "Do you want us to leave?",
    "What should we do?",
    "Can we help?",
    "Is anything wrong?",
    "Are you friendly?",
    "---",
    "*** Location questions ***",
    "---",
    "Where are you?",
    "Are you close?",
    "Can you show yourself?",
    "Give us a sign.",
    "Let us know you are here.",
    "Show yourself.",
    "Can you talk?",
    "Speak to us",
    "Are you here?",
    "Are you with us?",
    "Anybody with us?",
    "Is anyone here?",
    "Anybody in the room?",
    "Anybody here?",
    "Is there a spirit here?",
    "Is there a Ghost here?",
    "What is your location?",
    "---",
    "*** Age questions ***",
    "---",
    "How old are you?",
    "How young are you?",
    "What is your age?",
    "When were you born?",
    "Are you a child?",
    "Are you old?",
    "Are you young?",
    "---",
    "*** Personal questions ***",
    "---",
    "Are you a girl?",
    "Are you a boy?",
    "Are you male?",
    "Are you female?",
    "Who are you?",
    "What are you?",
    "Who is this?",
    "Who are we talking to?",
    "Who am I talking to?",
    "Hello?",
    "What is your name?",
    "Can you give me your name?",
    "What is your gender?",
    "What gender?",
    "Are you male or female?",
    "Are you a man?",
    "Are you a woman?",
  ];

  String _ghosts = "Demon | Jinn | Mare | Oni | Poltergeist | Spirit | Wraith";

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
