import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(
    home: PhasmophobiaAssistant(),
  ));
}

class PhasmophobiaAssistant extends StatefulWidget {
  @override
  _PhasmophobiaAssistantState createState() => _PhasmophobiaAssistantState();
}

class _PhasmophobiaAssistantState extends State<PhasmophobiaAssistant> {
  bool emf = false,
      fingerprints = false,
      temperature = false,
      orb = false,
      writing = false,
      spiritBox = false,
      selectEmf = true,
      selectFingerpints = true,
      selectTemperature = true,
      selectOrb = true,
      selectWriting = true,
      selectSpiritBox = true,
      everyone = false,
      paranormal = false,
      below10 = false,
      photoGhost = false,
      photoSink = false,
      sensor = false,
      crusifix = false,
      ghostEvent = false,
      smudgeSticks = false,
      salt = false;

  String ghosts = "Spirit | Wraith | Phantom | Poltergeist | Banshee | Jinn | Mare | Revenant | Shade | Demon | Yurei | Oni";

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10),
          child: Image.asset("assets/background.png"),
        ),
        Card(
          child: ListTile(
              title: TextField(
            decoration: InputDecoration(
              labelText: 'Ghost Name',
            ),
          )),
        ),
        Card(
          child: ListTile(
            title: Text(
              "Respond to everyone",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Switch(
              value: everyone,
              onChanged: (value) {
                setState(() {
                  everyone = !everyone;
                });
              },
            ),
          ),
        ),
        Card(
          child: Table(
            children: [
              TableRow(children: [
                CheckboxListTile(
                  title: Text("EMF Reader"),
                  value: paranormal,
                  onChanged: (newValue) {
                    setState(() {
                      paranormal = newValue;
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
                CheckboxListTile(
                  title: Text("Below 10°"),
                  value: below10,
                  onChanged: (newValue) {
                    setState(() {
                      below10 = newValue;
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
              ]),
              TableRow(children: [
                CheckboxListTile(
                  title: Text("Dirty Water"),
                  value: photoSink,
                  onChanged: (newValue) {
                    setState(() {
                      photoSink = newValue;
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
                CheckboxListTile(
                  title: Text("Ghost Photo"),
                  value: photoGhost,
                  onChanged: (newValue) {
                    setState(() {
                      photoGhost = newValue;
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
              ]),
              TableRow(children: [
                CheckboxListTile(
                  title: Text("Motion Sensor"),
                  value: sensor,
                  onChanged: (newValue) {
                    setState(() {
                      sensor = newValue;
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
                CheckboxListTile(
                  title: Text("Crucifix"),
                  value: crusifix,
                  onChanged: (newValue) {
                    setState(() {
                      crusifix = newValue;
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
              ]),
              TableRow(children: [
                CheckboxListTile(
                  title: Text("Ghost Event"),
                  value: ghostEvent,
                  onChanged: (newValue) {
                    setState(() {
                      ghostEvent = newValue;
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
                CheckboxListTile(
                  title: Text("Smudge Sticks"),
                  value: smudgeSticks,
                  onChanged: (newValue) {
                    setState(() {
                      smudgeSticks = newValue;
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
              ]),
              TableRow(children: [
                CheckboxListTile(
                  title: Text("Salt Footprint"),
                  value: salt,
                  onChanged: (newValue) {
                    setState(() {
                      salt = newValue;
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(30, 5, 30, 5),
                  child: RaisedButton(
                    color: Colors.blueAccent,
                    child: Text(
                      "CLEAR",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      clearMissions();
                    },
                  ),
                )
              ]),
            ],
          ),
        ),
        Card(
          color: selectEmf ? Colors.blueAccent : Colors.redAccent,
          child: ListTile(
            title: Text("EMF Level 5"),
            trailing: Switch(
              activeColor: Colors.greenAccent,
              value: emf,
              onChanged: (value) {
                setState(() {
                  emf = !emf;
                  verifyGhost();
                });
              },
            ),
          ),
        ),
        Card(
          color: selectFingerpints ? Colors.blueAccent : Colors.redAccent,
          child: ListTile(
            title: Text("Fingerprints"),
            trailing: Switch(
              activeColor: Colors.greenAccent,
              value: fingerprints,
              onChanged: (value) {
                setState(() {
                  fingerprints = !fingerprints;
                  verifyGhost();
                });
              },
            ),
          ),
        ),
        Card(
          color: selectTemperature ? Colors.blueAccent : Colors.redAccent,
          child: ListTile(
            title: Text("Freezing Temperatures"),
            trailing: Switch(
              activeColor: Colors.greenAccent,
              value: temperature,
              onChanged: (value) {
                setState(() {
                  temperature = !temperature;
                  verifyGhost();
                });
              },
            ),
          ),
        ),
        Card(
          color: selectOrb ? Colors.blueAccent : Colors.redAccent,
          child: ListTile(
            title: Text("Ghost Orbs"),
            trailing: Switch(
              activeColor: Colors.greenAccent,
              value: orb,
              onChanged: (value) {
                setState(() {
                  orb = !orb;
                  verifyGhost();
                });
              },
            ),
          ),
        ),
        Card(
          color: selectWriting ? Colors.blueAccent : Colors.redAccent,
          child: ListTile(
            title: Text("Ghost Writing"),
            trailing: Switch(
              activeColor: Colors.greenAccent,
              value: writing,
              onChanged: (value) {
                setState(() {
                  writing = !writing;
                  verifyGhost();
                });
              },
            ),
          ),
        ),
        Card(
          color: selectSpiritBox ? Colors.blueAccent : Colors.redAccent,
          child: ListTile(
            title: Text("Spirit Box"),
            trailing: Switch(
              activeColor: Colors.greenAccent,
              value: spiritBox,
              onChanged: (value) {
                setState(() {
                  spiritBox = !spiritBox;
                  verifyGhost();
                });
              },
            ),
          ),
        ),
        Card(
          child: ListTile(
            title: Text("Ghost:"),
            subtitle: Text(ghosts != null ? ghosts : ""),
          ),
        ),
        Card(
          color: Colors.transparent,
          child: ListTile(
            title: Text("This app is based on web site:", style: TextStyle(color: Colors.white),),
            subtitle: InkWell(
                child: Text('https://phass.herokuapp.com/?fbclid=IwAR0UQqTGkymvrOddyOrENZIV3eXCXUwklL873V2SnPNjRdWS8a_XetZOZ3I', style: TextStyle(color: Colors.blue),),
                onTap: () => launch(
                    'https://phass.herokuapp.com/?fbclid=IwAR0UQqTGkymvrOddyOrENZIV3eXCXUwklL873V2SnPNjRdWS8a_XetZOZ3I')),
          ),
        ),
      ],
    );
  }

  void clearMissions() {
    setState(() {
      paranormal = false;
      below10 = false;
      photoGhost = false;
      photoSink = false;
      sensor = false;
      crusifix = false;
      ghostEvent = false;
      smudgeSticks = false;
      salt = false;
    });
  }

  verifyGhost() {
    String evidences = verifyEvidences();
    print(evidences);
    setState(() {
      changeTiles(true, true, true, true, true, true);
      ghosts = defineGhost(evidences);
      if (ghosts.isEmpty) {
        verifyAllEvidences(evidences);
      } else {
        emf = selectEmf;
        fingerprints = selectFingerpints;
        temperature = selectTemperature;
        orb = selectOrb;
        writing = selectWriting;
        spiritBox = selectSpiritBox;
      }
    });
  }

  void verifyAllEvidences(String evidences) {
    ghosts =
        "Spirit | Wraith | Phantom | Poltergeist | Banshee | Jinn | Mare | Revenant | Shade | Demon | Yurei | Oni";

    if (evidences.contains("emf")) {
      emfEvidences(evidences);
    } else if (evidences.contains("fingerprints")) {
      fingerprintsEvidences(evidences);
    } else if (evidences.contains("temperature")) {
      temperatureEvidences(evidences);
    } else if (evidences.contains("orb")) {
      orbEvidences(evidences);
    } else if (evidences.contains("writing")) {
      writingEvidences(evidences);
    } else if (evidences.contains("spiritBox")) {
      spiritBoxEvidences(evidences);
    }
  }

  String defineGhost(String evidences) {
    String ghostFound = "";
    if (isSpirit(evidences)) {
      changeTiles(false, true, false, false, true, true);
      ghostFound = "Spirit";
    } else if (isWraith(evidences)) {
      changeTiles(false, true, true, false, false, true);
      ghostFound = "Wraith";
    } else if (isPhantom(evidences)) {
      changeTiles(true, false, true, true, false, false);
      ghostFound = "Phantom";
    } else if (isPoltergeist(evidences)) {
      changeTiles(false, true, false, true, false, true);
      ghostFound = "Poltergeist";
    } else if (isBanshee(evidences)) {
      changeTiles(true, true, true, false, false, false);
      ghostFound = "Banshee";
    } else if (isJinn(evidences)) {
      changeTiles(true, false, false, true, false, true);
      ghostFound = "Jinn";
    } else if (isMare(evidences)) {
      changeTiles(false, false, true, true, false, true);
      ghostFound = "Mare";
    } else if (isRevenant(evidences)) {
      changeTiles(true, true, false, false, true, false);
      ghostFound = "Revenant";
    } else if (isShade(evidences)) {
      changeTiles(true, false, false, true, true, false);
      ghostFound = "Shade";
    } else if (isDemon(evidences)) {
      changeTiles(false, false, true, false, true, true);
      ghostFound = "Demon";
    } else if (isYurei(evidences)) {
      changeTiles(false, false, true, true, true, false);
      ghostFound = "Yurei";
    } else if (isOni(evidences)) {
      changeTiles(true, false, false, false, true, true);
      ghostFound = "oni";
    }
    return ghostFound;
  }

  void changeTiles(bool emf, bool fingerprints, bool temperature, bool orb,
      bool writing, bool spiritBox) {
    selectEmf = emf;
    selectFingerpints = fingerprints;
    selectTemperature = temperature;
    selectOrb = orb;
    selectWriting = writing;
    selectSpiritBox = spiritBox;
  }

  bool isOni(String evidences) {
    return evidences.contains("emf") &&
        evidences.contains("writing") &&
        evidences.contains("spiritBox");
  }

  bool isYurei(String evidences) {
    return evidences.contains("temperature") &&
        evidences.contains("orb") &&
        evidences.contains("writing");
  }

  bool isDemon(String evidences) {
    return evidences.contains("temperature") &&
        evidences.contains("writing") &&
        evidences.contains("spiritBox");
  }

  bool isShade(String evidences) {
    return evidences.contains("emf") &&
        evidences.contains("orb") &&
        evidences.contains("writing");
  }

  bool isRevenant(String evidences) {
    return evidences.contains("emf") &&
        evidences.contains("fingerprints") &&
        evidences.contains("writing");
  }

  bool isMare(String evidences) {
    return evidences.contains("temperature") &&
        evidences.contains("orb") &&
        evidences.contains("spiritBox");
  }

  bool isJinn(String evidences) {
    return evidences.contains("emf") &&
        evidences.contains("orb") &&
        evidences.contains("spiritBox");
  }

  bool isBanshee(String evidences) {
    return evidences.contains("emf") &&
        evidences.contains("fingerprints") &&
        evidences.contains("temperature");
  }

  bool isPoltergeist(String evidences) {
    return evidences.contains("fingerprints") &&
        evidences.contains("orb") &&
        evidences.contains("spiritBox");
  }

  bool isPhantom(String evidences) {
    return evidences.contains("emf") &&
        evidences.contains("temperature") &&
        evidences.contains("orb");
  }

  bool isWraith(String evidences) {
    return evidences.contains("fingerprints") &&
        evidences.contains("temperature") &&
        evidences.contains("spiritBox");
  }

  bool isSpirit(String evidences) {
    return evidences.contains("fingerprints") &&
        evidences.contains("writing") &&
        evidences.contains("spiritBox");
  }

  void spiritBoxEvidences(String evidences) {
    ghosts = "Spirit | Wraith | Poltergeist | Jinn | Mare | Demon | Oni";
  }

  void writingEvidences(String evidences) {
    ghosts = "Spirit | Revenant | Shade | Demon | Yurei | Oni";
    if (evidences.contains("spiritBox")) {
      changeTiles(true, true, true, false, true, true);
      orb = false;
      ghosts = "Spirit | Demon | Oni";
    }
  }

  void orbEvidences(String evidences) {
    ghosts = "Spirit | Revenant | Shade | Demon | Yurei | Oni";
    if (evidences.contains("writing")) {
      changeTiles(true, false, true, true, true, false);
      spiritBox = false;
      ghosts = "Shade | Yurei";
    } else if (evidences.contains("spiritBox")) {
      changeTiles(true, true, true, true, false, true);
      writing = false;
      ghosts = "Poltergeist | Jinn | Mare";
    }
  }

  void temperatureEvidences(String evidences) {
    ghosts = "Wraith | Phantom | Banshee | Mare | Demon | Yurei";

    if (evidences.contains("orb")) {
      changeTiles(true, false, true, true, true, true);
      fingerprints = false;
      ghosts = "Phantom | Mare | Yurei";
    } else if (evidences.contains("writing")) {
      changeTiles(false, false, true, true, true, true);
      emf = false;
      fingerprints = false;
      ghosts = "Demon | Yurei";
    } else if (evidences.contains("spiritBox")) {
      changeTiles(false, true, true, true, true, true);
      emf = false;
      ghosts = "Wraith | Mare | Demon";
    }
  }

  void fingerprintsEvidences(String evidences) {
    ghosts = "Spirit | Wraith | Poltergeist | Banshee | Revenant";

    if (evidences.contains("temperature")) {
      changeTiles(true, true, true, false, false, true);
      orb = false;
      writing = false;
      ghosts = "Wraith | Banshee";
    } else if (evidences.contains("orb")) {
      changeTiles(false, true, false, true, false, true);
      emf = false;
      writing = false;
      spiritBox = true;
      ghosts = "Poltergeist";
    } else if (evidences.contains("writing")) {
      changeTiles(true, true, false, false, true, true);
      temperature = false;
      orb = false;
      ghosts = "Spirit | Revenant";
    } else if (evidences.contains("spiritBox")) {
      changeTiles(false, true, true, true, true, true);
      emf = false;
      ghosts = "Spirit | Wraith | Poltergeist";
    }
  }

  void emfEvidences(String evidences) {
    ghosts = "Phantom | Banshee | Jinn | Revenant | Shade | Oni";

    if (evidences.contains("fingerprints")) {
      changeTiles(true, true, true, false, true, false);
      orb = false;
      spiritBox = false;
      ghosts = "Banshee | Revenant";
    } else if (evidences.contains("temperature")) {
      changeTiles(true, true, true, true, false, false);
      writing = false;
      spiritBox = false;
      ghosts = "Phantom | Banshee";
    } else if (evidences.contains("orb")) {
      changeTiles(true, false, true, true, true, true);
      fingerprints = false;
      ghosts = "Phantom | Jinn | Shade";
    } else if (evidences.contains("writing")) {
      changeTiles(true, true, false, true, true, true);
      temperature = false;
      ghosts = "Revenant | Shade | Oni";
    } else if (evidences.contains("spiritBox")) {
      changeTiles(true, false, false, true, true, true);
      fingerprints = false;
      temperature = false;
      ghosts = "Jinn | Oni";
    }
  }

  String verifyEvidences() {
    String evidences = "";

    if (emf) {
      evidences += "emf ";
    }

    if (fingerprints) {
      evidences += "fingerprints ";
    }

    if (temperature) {
      evidences += "temperature ";
    }

    if (orb) {
      evidences += "orb ";
    }

    if (writing) {
      evidences += "writing ";
    }

    if (spiritBox) {
      evidences += "spiritBox ";
    }

    return evidences.trim();
  }
}
