import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phasmophobiaassistant/models/Banshee.dart';
import 'package:phasmophobiaassistant/models/Demon.dart';
import 'package:phasmophobiaassistant/models/EmfLevelFive.dart';
import 'package:phasmophobiaassistant/models/Evidence.dart';
import 'package:phasmophobiaassistant/models/Fingerprints.dart';
import 'package:phasmophobiaassistant/models/FreezingTemperatures.dart';
import 'package:phasmophobiaassistant/models/Ghost.dart';
import 'package:phasmophobiaassistant/models/GhostOrb.dart';
import 'package:phasmophobiaassistant/models/GhostWriting.dart';
import 'package:phasmophobiaassistant/models/Jinn.dart';
import 'package:phasmophobiaassistant/models/Mare.dart';
import 'package:phasmophobiaassistant/models/Oni.dart';
import 'package:phasmophobiaassistant/models/Phantom.dart';
import 'package:phasmophobiaassistant/models/Poltergeist.dart';
import 'package:phasmophobiaassistant/models/Revenant.dart';
import 'package:phasmophobiaassistant/models/Shade.dart';
import 'package:phasmophobiaassistant/models/Spirit.dart';
import 'package:phasmophobiaassistant/models/SpiritBox.dart';
import 'package:phasmophobiaassistant/models/Wraith.dart';
import 'package:phasmophobiaassistant/models/Yurei.dart';
import 'package:phasmophobiaassistant/pages/evidence_detail/evidence_detail_page.dart';
import 'package:phasmophobiaassistant/pages/ghost_detail/ghost_detail_page.dart';
import 'package:phasmophobiaassistant/pages/objectives/objectives_page.dart';

const EMF = "EMF Level 5",
    FINGERPRINTS = "Fingerprints",
    TEMPERATURE = "Freezing Temperatures",
    ORBS = "Ghost Orbs",
    WRITING = "Ghost Writing",
    SPIRIT_BOX = "Spirit Box",
    SPIRIT = "Spirit",
    BANSHEE = "Banshee",
    WRAITH = "Wraith",
    PHANTOM = "Phantom",
    POLTERGEIST = "Poltergeist",
    JINN = "Jinn",
    MARE = "Mare",
    REVENANT = "Revenant",
    SHADE = "Shade",
    DEMON = "Demon",
    YUREI = "Yurei",
    ONI = "Oni";

class EvidencesPage extends StatefulWidget {
  @override
  _EvidencesPageState createState() => _EvidencesPageState();
}

class _EvidencesPageState extends State<EvidencesPage>
    with AutomaticKeepAliveClientMixin<EvidencesPage> {
  bool emf = false,
      fingerprints = false,
      temperature = false,
      orb = false,
      writing = false,
      spiritBox = false,
      discardEmf = false,
      discardFingerpints = false,
      discardTemperature = false,
      discardOrb = false,
      discardWriting = false,
      discardSpiritBox = false;

  String ghosts =
      "Spirit | Wraith | Phantom | Poltergeist | Banshee | Jinn | Mare | Revenant | Shade | Demon | Yurei | Oni";

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: ListView(
        children: <Widget>[
          BuildEvidenceItem(EMF, emf, discardEmf),
          BuildEvidenceItem(FINGERPRINTS, fingerprints, discardFingerpints),
          BuildEvidenceItem(TEMPERATURE, temperature, discardTemperature),
          BuildEvidenceItem(ORBS, orb, discardOrb),
          BuildEvidenceItem(WRITING, writing, discardWriting),
          BuildEvidenceItem(SPIRIT_BOX, spiritBox, discardSpiritBox),
          buildEvidenceSubtitle(),
          buildGhostChipsList(),
          buildResetButton(),
        ],
      ),
    );
  }

  Widget buildResetButton() {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: RaisedButton(
        child: Text("RESET"),
        onPressed: () {
          setState(() {
            resetButton();
          });
        },
      ),
    );
  }

  Container buildGhostChipsList() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Wrap(
        spacing: 5,
        alignment: WrapAlignment.center,
        children: BuildGhostChips(),
      ),
    );
  }

  Divider buildDivider() {
    return Divider(
      color: Colors.black12,
      thickness: 2,
      indent: 10,
      endIndent: 10,
    );
  }

  Container buildEvidenceSubtitle() {
    return Container(
      margin: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.brightness_1,
                color: Colors.blueAccent,
              ),
              Text(
                " Selected",
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.brightness_1,
                color: Colors.redAccent,
              ),
              Text(
                " Discarded",
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> BuildGhostChips() {
    var chips = <Widget>[];
    ghosts.split("|").forEach((ghost) {
      ghost = ghost.trim();
      chips.add(Chip(
        //backgroundColor: Colors.blueAccent,
        label: InkWell(
          child: Text(ghost),
          onTap: () {
            goToGhostDatailPage(ghost);
          },
        ),
      ));
    });
    return chips;
  }

  Card BuildEvidenceItem(String evidence, bool selected, bool discarded) {
    var color = Colors.white10;
    if (discarded) {
      color = Colors.redAccent;
      selected = true;
    } else if (selected) {
      color = Colors.blueAccent;
    }

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      color: color,
      child: ListTile(
        dense: selected,
        title: Text(
          evidence,
        ),
//        leading: Icon(
//          Icons.person,
//        ),
        trailing: InkWell(
          child: Icon(
            Icons.help_outline,
          ),
          onTap: () {
            goToEvidenceDetailPage(evidence);
          },
        ),
        onTap: () {
          changeEvidenceState(evidence);
          setState(() {
            verifyGhost();
          });
        },
      ),
    );
  }

  verifyGhost() {
    String evidences = verifyEvidences();
    print(evidences);
    changeTiles(true, true, true, true, true, true);
    ghosts = defineGhost(evidences);
    if (ghosts.isEmpty) {
      verifyAllEvidences(evidences);
    }
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
    discardEmf = !emf;
    discardFingerpints = !fingerprints;
    discardTemperature = !temperature;
    discardOrb = !orb;
    discardWriting = !writing;
    discardSpiritBox = !spiritBox;
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
    ghosts = "Spirit | Poltergeist | Revenant | Shade | Demon | Yurei | Oni";
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

  void changeEvidenceState(String evidence) {
    if (evidence == EMF) {
      emf = !emf;
    } else if (evidence == FINGERPRINTS) {
      fingerprints = !fingerprints;
    } else if (evidence == TEMPERATURE) {
      temperature = !temperature;
    } else if (evidence == ORBS) {
      orb = !orb;
    } else if (evidence == WRITING) {
      writing = !writing;
    } else if (evidence == SPIRIT_BOX) {
      spiritBox = !spiritBox;
    }
  }

  void resetButton() {
    emf = false;
    fingerprints = false;
    temperature = false;
    orb = false;
    writing = false;
    spiritBox = false;
    discardEmf = emf;
    discardFingerpints = fingerprints;
    discardTemperature = temperature;
    discardOrb = orb;
    discardWriting = writing;
    discardSpiritBox = spiritBox;
    ghosts =
        "Spirit | Wraith | Phantom | Poltergeist | Banshee | Jinn | Mare | Revenant | Shade | Demon | Yurei | Oni";
  }

  void goToGhostDatailPage(String ghostName) {
    Ghost ghost;

    if (ghostName == SPIRIT) {
      ghost = Spirit();
    } else if (ghostName == WRAITH) {
      ghost = Wraith();
    } else if (ghostName == PHANTOM) {
      ghost = Phantom();
    } else if (ghostName == POLTERGEIST) {
      ghost = Poltergeist();
    } else if (ghostName == BANSHEE) {
      ghost = Banshee();
    } else if (ghostName == JINN) {
      ghost = Jinn();
    } else if (ghostName == MARE) {
      ghost = Mare();
    } else if (ghostName == REVENANT) {
      ghost = Revenant();
    } else if (ghostName == SHADE) {
      ghost = Shade();
    } else if (ghostName == DEMON) {
      ghost = Demon();
    } else if (ghostName == YUREI) {
      ghost = Yurei();
    } else if (ghostName == ONI) {
      ghost = Oni();
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GhostDetailPage(ghost)),
    );
  }

  void goToEvidenceDetailPage(String evidenceName) {
    Evidence evidence;
    if (evidenceName == EMF) {
      evidence = EmfLevelFive();
    } else if (evidenceName == FINGERPRINTS) {
      evidence = Fingerprints();
    } else if (evidenceName == TEMPERATURE) {
      evidence = FreezingTemperatures();
    } else if (evidenceName == ORBS) {
      evidence = GhostOrb();
    } else if (evidenceName == WRITING) {
      evidence = GhostWriting();
    } else if (evidenceName == SPIRIT_BOX) {
      evidence = SpiritBox();
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EvidenceDetailPage(evidence)),
    );
  }
}
