import 'package:flutter/material.dart';
import 'package:phasmophobiaassistant/models/CrucifixObjective.dart';
import 'package:phasmophobiaassistant/models/DirtWater.dart';
import 'package:phasmophobiaassistant/models/EmfReaderObjective.dart';
import 'package:phasmophobiaassistant/models/GhostEvent.dart';
import 'package:phasmophobiaassistant/models/GhostPhoto.dart';
import 'package:phasmophobiaassistant/models/LowTemperature.dart';
import 'package:phasmophobiaassistant/models/MotionSensorObjective.dart';
import 'package:phasmophobiaassistant/models/Objective.dart';
import 'package:phasmophobiaassistant/models/SaltFootprint.dart';
import 'package:phasmophobiaassistant/models/SmudgeSticksObjective.dart';
import 'package:phasmophobiaassistant/pages/objective_detail/objective_detail.dart';

const EMF_READER = "EMF Reader",
    LOW_TEMPERATURE = "Below 10°C or 50°F",
    DIRT_WATER = "Dirt Water",
    SENSOR = "Motion Sensor",
    CRUCIFIX = "Crucifix",
    GHOST_PHOTO = "Ghost Photo",
    GHOST_EVENT = "Ghost Event",
    SMUDGE_STICKS = "Smudge Sticks",
    SALT_FOOTPRINT = "Salt Footprint";

class ObjectivesPage extends StatefulWidget {
  @override
  _ObjectivesPageState createState() => _ObjectivesPageState();
}

class _ObjectivesPageState extends State<ObjectivesPage>
    with AutomaticKeepAliveClientMixin<ObjectivesPage> {
  List<bool> _selections = List.generate(2, (_) => false);
  TextEditingController _textEditingController = TextEditingController();
  bool emfReader = false,
      lowTemperature = false,
      dirtWater = false,
      ghostPhoto = false,
      motionSensor = false,
      crucifix = false,
      ghostEvent = false,
      smudgeSticks = false,
      saltFootprint = false;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 5),
            child: ListTile(
                title: TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(labelText: "Ghost Name"),
                ),
                trailing: ToggleButtons(
                  children: <Widget>[
                    Icon(Icons.person),
                    Icon(Icons.people),
                  ],
                  isSelected: _selections,
                  borderRadius: BorderRadius.circular(30),
                  onPressed: (int index) {
                    setState(() {
                      _selections = List.generate(2, (_) => false);
                      _selections[index] = true;
                    });
                  },
                )),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Table(
            children: [
              TableRow(children: [
                buildObjectiveItem(EMF_READER, emfReader),
                buildObjectiveItem(LOW_TEMPERATURE, lowTemperature),
              ]),
              TableRow(children: [
                buildObjectiveItem(DIRT_WATER, dirtWater),
                buildObjectiveItem(GHOST_PHOTO, ghostPhoto),
              ]),
              TableRow(children: [
                buildObjectiveItem(SENSOR, motionSensor),
                buildObjectiveItem(CRUCIFIX, crucifix),
              ]),
              TableRow(children: [
                buildObjectiveItem(GHOST_EVENT, ghostEvent),
                buildObjectiveItem(SMUDGE_STICKS, smudgeSticks),
              ]),
              TableRow(children: [
                buildObjectiveItem(SALT_FOOTPRINT, saltFootprint),
                Container(),
              ]),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: RaisedButton(
            //isExtended: true,
            child: Text("RESET"),
            onPressed: () {
              setState(() {
                resetButton();
              });
            },
          ),
        )
      ],
    );
  }

  Card buildObjectiveItem(String objective, bool selected) {

    return Card(
      color: selected ? Colors.blueAccent : Colors.white10,
      child: ListTile(
        dense: true,
        title: Text(objective),
        //leading: Icon(Icons.person),
        trailing: InkWell(
          child: Icon(Icons.help_outline),
          onTap: () {
            goToObjectiveDetail(objective);
          },
        ),
        onTap: () {
          setState(() {
            changeObjectiveState(objective);
          });
        },
      ),
    );
  }

  void goToObjectiveDetail(String nameObjective) {

    Objective objective;

    if (nameObjective == EMF_READER) {
      objective = EmfReaderObjective();
    } else if (nameObjective == LOW_TEMPERATURE) {
      objective = LowTemperature();
    } else if (nameObjective == DIRT_WATER) {
      objective = DirtWater();
    } else if (nameObjective == GHOST_PHOTO) {
      objective = GhostPhoto();
    } else if (nameObjective == SENSOR) {
      objective = MotionSensorObjective();
    } else if (nameObjective == CRUCIFIX) {
      objective = CrucifixObjective();
    } else if (nameObjective == GHOST_EVENT) {
      objective = GhostEvent();
    } else if (nameObjective == SMUDGE_STICKS) {
      objective = SmudgeSticksObjective();
    } else if (nameObjective == SALT_FOOTPRINT) {
      objective = SaltFootprint();
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ObjectiveDetail(objective)),
    );
  }

  void resetButton() {
    _textEditingController.text = "";
    _selections = List.generate(2, (_) => false);
    emfReader = false;
    lowTemperature = false;
    dirtWater = false;
    ghostPhoto = false;
    motionSensor = false;
    crucifix = false;
    ghostEvent = false;
    smudgeSticks = false;
    saltFootprint = false;
  }

  void changeObjectiveState(String objective) {
    if (objective == EMF_READER) {
      emfReader = !emfReader;
    } else if (objective == LOW_TEMPERATURE) {
      lowTemperature = !lowTemperature;
    } else if (objective == DIRT_WATER) {
      dirtWater = !dirtWater;
    } else if (objective == GHOST_PHOTO) {
      ghostPhoto = !ghostPhoto;
    } else if (objective == SENSOR) {
      motionSensor = !motionSensor;
    } else if (objective == CRUCIFIX) {
      crucifix = !crucifix;
    } else if (objective == GHOST_EVENT) {
      ghostEvent = !ghostEvent;
    } else if (objective == SMUDGE_STICKS) {
      smudgeSticks = !smudgeSticks;
    } else if (objective == SALT_FOOTPRINT) {
      saltFootprint = !saltFootprint;
    }
  }
}

