import 'package:flutter/material.dart';

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

  String fantasma;

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
                  title: Text("Paranormal"),
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
                  title: Text("Crusifix"),
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
      ],
    );
  }

  verifyGhost() {
    String evidences = verifyEvidences();

    print(evidences);

    setState(() {
      changeTiles(true, true, true, true, true, true);
      if (defineGhost(evidences).isEmpty) {
        if (evidences.contains("emf")) {
          emfEvidences(evidences);
        } else if (evidences.contains("fingerprints")) {
          fingerprintsEvidences(evidences);
        } else if (evidences.contains("temperature")) {
          temperatureEvidences(evidences);
        } else if (evidences.contains("orb")) {
          writingEvidences(evidences);
        } else if (evidences.contains("writing")) {
          spiritBoxEvidences(evidences);
        }
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
    if (evidences.contains("spiritBox")) {
      selectEmf = true;
      selectFingerpints = true;
      selectTemperature = true;
      selectOrb = false;
      selectWriting = true;
      selectSpiritBox = true;

      orb = false;
    }
  }

  void writingEvidences(String evidences) {
    if (evidences.contains("writing")) {
      selectEmf = true;
      selectFingerpints = false;
      selectTemperature = true;
      selectOrb = true;
      selectWriting = true;
      selectSpiritBox = false;

      spiritBox = false;
    } else if (evidences.contains("spiritBox")) {
      selectEmf = true;
      selectFingerpints = true;
      selectTemperature = true;
      selectOrb = true;
      selectWriting = false;
      selectSpiritBox = true;

      writing = false;
    }
  }

  void temperatureEvidences(String evidences) {
    if (evidences.contains("orb")) {
      selectEmf = true;
      selectFingerpints = false;
      selectTemperature = true;
      selectOrb = true;
      selectWriting = true;
      selectSpiritBox = true;

      fingerprints = false;
    } else if (evidences.contains("writing")) {
      selectEmf = false;
      selectFingerpints = false;
      selectTemperature = true;
      selectOrb = true;
      selectWriting = true;
      selectSpiritBox = true;

      emf = false;
      fingerprints = false;
    } else if (evidences.contains("spiritBox")) {
      selectEmf = false;
      selectFingerpints = true;
      selectTemperature = true;
      selectOrb = true;
      selectWriting = true;
      selectSpiritBox = true;

      emf = false;
    }
  }

  void fingerprintsEvidences(String evidences) {
    if (evidences.contains("temperature")) {
      selectEmf = true;
      selectFingerpints = true;
      selectTemperature = true;
      selectOrb = false;
      selectWriting = false;
      selectSpiritBox = true;

      orb = false;
      writing = false;
    } else if (evidences.contains("orb")) {
      selectEmf = false;
      selectFingerpints = true;
      selectTemperature = false;
      selectOrb = true;
      selectWriting = false;
      selectSpiritBox = true;

      emf = false;
      writing = false;
    } else if (evidences.contains("writing")) {
      selectEmf = true;
      selectFingerpints = true;
      selectTemperature = false;
      selectOrb = false;
      selectWriting = true;
      selectSpiritBox = true;

      temperature = false;
      orb = false;
    } else if (evidences.contains("spiritBox")) {
      selectEmf = false;
      selectFingerpints = true;
      selectTemperature = true;
      selectOrb = true;
      selectWriting = true;
      selectSpiritBox = true;

      emf = false;
    }
  }

  void emfEvidences(String evidences) {
    if (evidences.contains("fingerprints")) {
      selectEmf = true;
      selectFingerpints = true;
      selectTemperature = true;
      selectOrb = false;
      selectWriting = true;
      selectSpiritBox = false;

      orb = false;
      spiritBox = false;
    } else if (evidences.contains("temperature")) {
      selectEmf = true;
      selectFingerpints = true;
      selectTemperature = true;
      selectOrb = true;
      selectWriting = false;
      selectSpiritBox = false;

      writing = false;
      spiritBox = false;
    } else if (evidences.contains("orb")) {
      selectEmf = true;
      selectFingerpints = false;
      selectTemperature = true;
      selectOrb = true;
      selectWriting = true;
      selectSpiritBox = true;

      fingerprints = false;
    } else if (evidences.contains("writing")) {
      selectEmf = true;
      selectFingerpints = true;
      selectTemperature = false;
      selectOrb = true;
      selectWriting = true;
      selectSpiritBox = true;

      temperature = false;
    } else if (evidences.contains("spiritBox")) {
      selectEmf = true;
      selectFingerpints = false;
      selectTemperature = false;
      selectOrb = true;
      selectWriting = true;
      selectSpiritBox = true;

      fingerprints = false;
      temperature = false;
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
