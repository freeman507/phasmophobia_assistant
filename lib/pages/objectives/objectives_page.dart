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
  Stopwatch _stopwatch = new Stopwatch();

  List<bool> _selections = List.generate(2, (_) => false);

  TextEditingController _textEditingController = new TextEditingController();

  TimerText _timerText;

  SingingCharacter _difficult = SingingCharacter.amateur;

  bool _emfReader = false,
      _lowTemperature = false,
      _dirtWater = false,
      _ghostPhoto = false,
      _motionSensor = false,
      _crucifix = false,
      _ghostEvent = false,
      _smudgeSticks = false,
      _saltFootprint = false;

  String _emfReaderText = i("emf.reader"),
      _lowTemperatureText = i("below.10c.50f"),
      _dirtWaterText = i("dirt.water"),
      _sensorText = i("motion.sensor"),
      _crucifixText = i("crucifix"),
      _ghostPhotoText = i("ghost.photo"),
      _ghostEventText = i("ghost.event"),
      _smudgeSticksTExt = i("smudge.sticks"),
      _saltFootprintText = i("salt.footprint");

  _ObjectivesPageState(Map<String, dynamic> lastStateApp) {
    loadInitialValues(lastStateApp);
    _timerText = TimerText(_stopwatch,
        _difficult == SingingCharacter.amateur ? FIVE_MINUTES : TWO_MINUTES);
  }

  void loadInitialValues(Map<String, dynamic> lastStateApp) {
    _emfReader = lastStateApp['emfReader'] ?? false;
    _lowTemperature = lastStateApp['lowTemperature'] ?? false;
    _dirtWater = lastStateApp['dirtWater'] ?? false;
    _ghostPhoto = lastStateApp['ghostPhoto'] ?? false;
    _motionSensor = lastStateApp['motionSensor'] ?? false;
    _crucifix = lastStateApp['crucifix'] ?? false;
    _ghostEvent = lastStateApp['ghostEvent'] ?? false;
    _smudgeSticks = lastStateApp['smudgeSticks'] ?? false;
    _saltFootprint = lastStateApp['saltFootprint'] ?? false;
    _textEditingController.text = lastStateApp['ghostName'] ?? "";
    loadGhostRespond(lastStateApp);
    loadDifficult(lastStateApp);
  }

  void loadDifficult(Map<String, dynamic> lastStateApp) {
    _difficult = lastStateApp['difficult'] == "intermediate"
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
        buildGhostNameAndRespondCard(),
        buildObjectiveTable(),
        buildDifficultCard(),
        buildTimerCard(),
        buildClearButton(),
      ],
    );
  }

  Container buildClearButton() {
    return Container(
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
    );
  }

  Card buildTimerCard() {
    return Card(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: _timerText,
          ),
          Expanded(
            child: Wrap(
              alignment: WrapAlignment.center,
              children: buildTimeButtons(),
            ),
          ),
        ],
      ),
    );
  }

  Card buildDifficultCard() {
    return Card(
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
                  groupValue: _difficult,
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
                  groupValue: _difficult,
                  onChanged: radioButtonChange,
                ),
                Text(i("intermediate")),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildObjectiveTable() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Table(
        children: [
          TableRow(children: [
            buildObjectiveItem(_emfReaderText, _emfReader),
            buildObjectiveItem(_lowTemperatureText, _lowTemperature),
          ]),
          TableRow(children: [
            buildObjectiveItem(_dirtWaterText, _dirtWater),
            buildObjectiveItem(_ghostPhotoText, _ghostPhoto),
          ]),
          TableRow(children: [
            buildObjectiveItem(_sensorText, _motionSensor),
            buildObjectiveItem(_crucifixText, _crucifix),
          ]),
          TableRow(children: [
            buildObjectiveItem(_ghostEventText, _ghostEvent),
            buildObjectiveItem(_smudgeSticksTExt, _smudgeSticks),
          ]),
          TableRow(children: [
            buildObjectiveItem(_saltFootprintText, _saltFootprint),
            Container(),
          ]),
        ],
      ),
    );
  }

  Card buildGhostNameAndRespondCard() {
    return Card(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 0, 5),
        child: ListTile(
          title: TextField(
            controller: _textEditingController,
            autocorrect: false,
            decoration: InputDecoration(labelText: i("ghost.name")),
            onSubmitted: (value) {
              saveObjectiveState();
            },
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
    );
  }

  void radioButtonChange(SingingCharacter value) {
    setState(
      () {
        _difficult = value;
        _timerText = TimerText(_stopwatch,
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

    if (nameObjective == _emfReaderText) {
      objective = EmfReaderObjective();
    } else if (nameObjective == _lowTemperatureText) {
      objective = LowTemperature();
    } else if (nameObjective == _dirtWaterText) {
      objective = DirtWater();
    } else if (nameObjective == _ghostPhotoText) {
      objective = GhostPhoto();
    } else if (nameObjective == _sensorText) {
      objective = MotionSensorObjective();
    } else if (nameObjective == _crucifixText) {
      objective = CrucifixObjective();
    } else if (nameObjective == _ghostEventText) {
      objective = GhostEvent();
    } else if (nameObjective == _smudgeSticksTExt) {
      objective = SmudgeSticksObjective();
    } else if (nameObjective == _saltFootprintText) {
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
    _emfReader = false;
    _lowTemperature = false;
    _dirtWater = false;
    _ghostPhoto = false;
    _motionSensor = false;
    _crucifix = false;
    _ghostEvent = false;
    _smudgeSticks = false;
    _saltFootprint = false;
    _difficult = SingingCharacter.amateur;
    handleStopButton();
    saveObjectiveState();
  }

  void changeObjectiveState(String objective) {
    if (objective == _emfReaderText) {
      _emfReader = !_emfReader;
    } else if (objective == _lowTemperatureText) {
      _lowTemperature = !_lowTemperature;
    } else if (objective == _dirtWaterText) {
      _dirtWater = !_dirtWater;
    } else if (objective == _ghostPhotoText) {
      _ghostPhoto = !_ghostPhoto;
    } else if (objective == _sensorText) {
      _motionSensor = !_motionSensor;
    } else if (objective == _crucifixText) {
      _crucifix = !_crucifix;
    } else if (objective == _ghostEventText) {
      _ghostEvent = !_ghostEvent;
    } else if (objective == _smudgeSticksTExt) {
      _smudgeSticks = !_smudgeSticks;
    } else if (objective == _saltFootprintText) {
      _saltFootprint = !_saltFootprint;
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
      "emfReader": _emfReader,
      "lowTemperature": _lowTemperature,
      "dirtWater": _dirtWater,
      "ghostPhoto": _ghostPhoto,
      "motionSensor": _motionSensor,
      "crucifix": _crucifix,
      "ghostEvent": _ghostEvent,
      "smudgeSticks": _smudgeSticks,
      "saltFootprint": _saltFootprint,
      "ghostName": _textEditingController.text,
      "ghostRespond": ghostRespond,
      "difficult": _difficult == SingingCharacter.intermediate
          ? "intermediate"
          : "amateur",
    });
  }

  void handlePlayButton() {
    setState(() {
      if (!_stopwatch.isRunning) {
        _stopwatch.start();
      }
    });
  }

  void handlePauseButton() {
    setState(() {
      if (_stopwatch.isRunning) {
        _stopwatch.stop();
      }
    });
  }

  void handleStopButton() {
    setState(() {
      _stopwatch.reset();
      _stopwatch.stop();
      _timerText = TimerText(_stopwatch,
          _difficult == SingingCharacter.amateur ? FIVE_MINUTES : TWO_MINUTES);
    });
  }
}
