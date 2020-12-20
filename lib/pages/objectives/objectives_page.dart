import 'package:flutter/material.dart';
import 'package:phasmophobiaassistant/config/config.dart';
import 'package:phasmophobiaassistant/i18n/i18n.dart';
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
import 'package:phasmophobiaassistant/widgets/timer_text.dart';

enum SingingCharacter { amateur, intermediate }

const FIVE_MINUTES = 300000, TWO_MINUTES = 120000;

class ObjectivesPage extends StatefulWidget {
  final Map<String, dynamic> lastStateApp;

  ObjectivesPage(this.lastStateApp);

  @override
  _ObjectivesPageState createState() => _ObjectivesPageState(this.lastStateApp);
}

class _ObjectivesPageState extends State<ObjectivesPage>
    with AutomaticKeepAliveClientMixin<ObjectivesPage> {
  Stopwatch stopwatch = new Stopwatch();

  List<bool> _selections = List.generate(2, (_) => false);

  TextEditingController _textEditingController = TextEditingController();

  TimerText timerText;

  SingingCharacter _character = SingingCharacter.amateur;

  FocusNode _focusNode = FocusNode();

  bool emfReader = false,
      lowTemperature = false,
      dirtWater = false,
      ghostPhoto = false,
      motionSensor = false,
      crucifix = false,
      ghostEvent = false,
      smudgeSticks = false,
      saltFootprint = false;

  var emfReaderText = i("emf.reader"),
      lowTemperatureText = i("below.10c.50f"),
      dirtWaterText = i("dirt.water"),
      sensorText = i("motion.sensor"),
      crucifixText = i("crucifix"),
      ghostPhotoText = i("ghost.photo"),
      ghostEventText = i("ghost.event"),
      smudgeSticksTExt = i("smudge.sticks"),
      saltFootprintText = i("salt.footprint");

  _ObjectivesPageState(Map<String, dynamic> lastStateApp) {
    loadInitialValues(lastStateApp);
    timerText = TimerText(stopwatch, FIVE_MINUTES);
  }

  void loadInitialValues(Map<String, dynamic> lastStateApp) {
    emfReader = lastStateApp['emfReader'] ?? false;
    lowTemperature = lastStateApp['lowTemperature'] ?? false;
    dirtWater = lastStateApp['dirtWater'] ?? false;
    ghostPhoto = lastStateApp['ghostPhoto'] ?? false;
    motionSensor = lastStateApp['motionSensor'] ?? false;
    crucifix = lastStateApp['crucifix'] ?? false;
    ghostEvent = lastStateApp['ghostEvent'] ?? false;
    smudgeSticks = lastStateApp['smudgeSticks'] ?? false;
    saltFootprint = lastStateApp['saltFootprint'] ?? false;
    _textEditingController.text = lastStateApp['ghostName'] ?? "";
    loadGhostRespond(lastStateApp);
    loadDifficult(lastStateApp);
  }

  void loadDifficult(Map<String, dynamic> lastStateApp) {
    _character = lastStateApp['difficult'] == "intermediate"
        ? SingingCharacter.intermediate
        : SingingCharacter.amateur;
  }

  void loadGhostRespond(Map<String, dynamic> lastStateApp) {
    if (lastStateApp['ghostRespond'] == "alone") {
      _selections[0] = true;
      _selections[1] = false;
    } else if (lastStateApp['ghostRespond'] == "everyone") {
      _selections[0] = false;
      _selections[1] = true;
    }
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                focusNode: _focusNode,
                onEditingComplete: () {
                  saveObjectiveState();
                  _focusNode.unfocus();
                },
                controller: _textEditingController,
                decoration: InputDecoration(labelText: i("ghost.name")),
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
                    saveObjectiveState();
                  });
                },
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Table(
            children: [
              TableRow(children: [
                buildObjectiveItem(emfReaderText, emfReader),
                buildObjectiveItem(lowTemperatureText, lowTemperature),
              ]),
              TableRow(children: [
                buildObjectiveItem(dirtWaterText, dirtWater),
                buildObjectiveItem(ghostPhotoText, ghostPhoto),
              ]),
              TableRow(children: [
                buildObjectiveItem(sensorText, motionSensor),
                buildObjectiveItem(crucifixText, crucifix),
              ]),
              TableRow(children: [
                buildObjectiveItem(ghostEventText, ghostEvent),
                buildObjectiveItem(smudgeSticksTExt, smudgeSticks),
              ]),
              TableRow(children: [
                buildObjectiveItem(saltFootprintText, saltFootprint),
                Container(),
              ]),
            ],
          ),
        ),
        Card(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      value: SingingCharacter.amateur,
                      activeColor: Colors.blueAccent,
                      groupValue: _character,
                      onChanged: radioButtonChange,
                    ),
                    Text(i("amateur")),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      value: SingingCharacter.intermediate,
                      activeColor: Colors.blueAccent,
                      groupValue: _character,
                      onChanged: radioButtonChange,
                    ),
                    Text(i("intermediate")),
                  ],
                ),
              ),
            ],
          ),
        ),
        Card(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            children: [
              Expanded(
                child: timerText,
              ),
              Expanded(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: buildTimeButtons(),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: RaisedButton(
            //isExtended: true,
            child: Text(i("clear")),
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

  void radioButtonChange(SingingCharacter value) {
    setState(
      () {
        _character = value;
        timerText = TimerText(stopwatch,
            value == SingingCharacter.amateur ? FIVE_MINUTES : TWO_MINUTES);
      },
    );
    saveObjectiveState();
  }

  List<Widget> buildTimeButtons() {
    return [
      IconButton(
        icon: Icon(Icons.play_arrow),
        onPressed: () {
          handlePlayButton();
        },
      ),
      IconButton(
        icon: Icon(Icons.pause),
        onPressed: () {
          handlePauseButton();
        },
      ),
      IconButton(
        icon: Icon(Icons.stop),
        onPressed: () {
          handleStopButton();
        },
      ),
    ];
  }

  Card buildObjectiveItem(String objective, bool selected) {
    return Card(
      child: AnimatedContainer(
        decoration: BoxDecoration(
          color: selected ? Colors.blueAccent : Colors.black12,
          borderRadius: BorderRadius.circular(5),
        ),
        duration: Duration(seconds: 1),
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
      ),
    );
  }

  void goToObjectiveDetail(String nameObjective) {
    Objective objective;

    if (nameObjective == emfReaderText) {
      objective = EmfReaderObjective();
    } else if (nameObjective == lowTemperatureText) {
      objective = LowTemperature();
    } else if (nameObjective == dirtWaterText) {
      objective = DirtWater();
    } else if (nameObjective == ghostPhotoText) {
      objective = GhostPhoto();
    } else if (nameObjective == sensorText) {
      objective = MotionSensorObjective();
    } else if (nameObjective == crucifixText) {
      objective = CrucifixObjective();
    } else if (nameObjective == ghostEventText) {
      objective = GhostEvent();
    } else if (nameObjective == smudgeSticksTExt) {
      objective = SmudgeSticksObjective();
    } else if (nameObjective == saltFootprintText) {
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
    _character = SingingCharacter.amateur;
    handleStopButton();
    saveObjectiveState();
  }

  void changeObjectiveState(String objective) {
    if (objective == emfReaderText) {
      emfReader = !emfReader;
    } else if (objective == lowTemperatureText) {
      lowTemperature = !lowTemperature;
    } else if (objective == dirtWaterText) {
      dirtWater = !dirtWater;
    } else if (objective == ghostPhotoText) {
      ghostPhoto = !ghostPhoto;
    } else if (objective == sensorText) {
      motionSensor = !motionSensor;
    } else if (objective == crucifixText) {
      crucifix = !crucifix;
    } else if (objective == ghostEventText) {
      ghostEvent = !ghostEvent;
    } else if (objective == smudgeSticksTExt) {
      smudgeSticks = !smudgeSticks;
    } else if (objective == saltFootprintText) {
      saltFootprint = !saltFootprint;
    }
    saveObjectiveState();
  }

  void saveObjectiveState() {
    String ghostRespond = "";
    if (_selections[0]) {
      ghostRespond = "alone";
    } else if (_selections[1]) {
      ghostRespond = "everyone";
    }
    saveMissionState({
      "emfReader": emfReader,
      "lowTemperature": lowTemperature,
      "dirtWater": dirtWater,
      "ghostPhoto": ghostPhoto,
      "motionSensor": motionSensor,
      "crucifix": crucifix,
      "ghostEvent": ghostEvent,
      "smudgeSticks": smudgeSticks,
      "saltFootprint": saltFootprint,
      "ghostName": _textEditingController.text,
      "ghostRespond": ghostRespond,
      "difficult": _character == SingingCharacter.intermediate
          ? "intermediate"
          : "amateur",
    });
  }

  void handlePlayButton() {
    setState(() {
      if (!stopwatch.isRunning) {
        stopwatch.start();
      }
    });
  }

  void handlePauseButton() {
    setState(() {
      if (stopwatch.isRunning) {
        stopwatch.stop();
      }
    });
  }

  void handleStopButton() {
    setState(() {
      stopwatch.reset();
      stopwatch.stop();
      timerText = TimerText(stopwatch,
          _character == SingingCharacter.amateur ? FIVE_MINUTES : TWO_MINUTES);
    });
  }
}
