import 'package:phasmophobiaassistant/models/Evidence.dart';

class SpiritBox implements Evidence {
  String _name = "spirit.box";

  List<String> _descriptions = [
    "spirit.box.description1",
  ];

  List<String> _howItWorks = [
    "spirit.box.howitworks1",
    "spirit.box.howitworks2",
    "spirit.box.howitworks3",
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

  String _ghosts = "spirit.box.ghosts";

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
