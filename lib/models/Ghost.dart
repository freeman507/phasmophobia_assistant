import 'package:phasmophobiaassistant/models/Evidence.dart';

abstract class Ghost {

  String name();

  List<String> descriptions();

  String strength();

  String weakness();

  List<Evidence> evidences();

}