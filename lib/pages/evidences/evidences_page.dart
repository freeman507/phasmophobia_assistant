import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phasmophobiaassistant/controllers/evidence_controller.dart';
import 'package:phasmophobiaassistant/i18n/i18n.dart';
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

class EvidencesPage extends StatefulWidget {
  @override
  _EvidencesPageState createState() => _EvidencesPageState();
}

class _EvidencesPageState extends State<EvidencesPage>
    with AutomaticKeepAliveClientMixin<EvidencesPage> {
  EvidenceController evidenceController = new EvidenceController();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: ListView(
        children: <Widget>[
          BuildEvidenceItem(Icons.signal_cellular_alt, evidenceController.emf,
              evidenceController.emfSelected, evidenceController.emfDiscarded),
          BuildEvidenceItem(
              Icons.fingerprint,
              evidenceController.fingerprints,
              evidenceController.fingerprintsSelected,
              evidenceController.fingerprintsDiscarded),
          BuildEvidenceItem(
              Icons.thermostat_outlined,
              evidenceController.temperature,
              evidenceController.temperatureSelected,
              evidenceController.temperatureDiscarded),
          BuildEvidenceItem(Icons.wb_sunny, evidenceController.orbs,
              evidenceController.orbSelected, evidenceController.orbDiscarded),
          BuildEvidenceItem(
              Icons.menu_book,
              evidenceController.writing,
              evidenceController.writingSelected,
              evidenceController.writingDiscarded),
          BuildEvidenceItem(
              Icons.radio,
              evidenceController.spiritBox,
              evidenceController.spiritBoxSelected,
              evidenceController.spiritBoxDiscarded),
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
        child: Text(i("clear")),
        onPressed: () {
          setState(() {
            evidenceController.reset();
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
                " " + i("selected"),
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
                " " + i("discarded"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> BuildGhostChips() {
    var chips = <Widget>[];
    if (evidenceController.ghosts.isNotEmpty) {
      evidenceController.ghosts.split("|").forEach((ghost) {
        ghost = ghost.trim();
        chips.add(Chip(
          //backgroundColor: Colors.blueAccent,
          label: InkWell(
            child: Text(i(ghost.toLowerCase())),
            onTap: () {
              goToGhostDatailPage(ghost);
            },
          ),
        ));
      });
    }
    return chips;
  }

  Card BuildEvidenceItem(
      IconData iconData, String evidence, bool selected, bool discarded) {
    var color = Colors.black12;
    if (discarded) {
      color = Colors.redAccent;
      selected = true;
    } else if (selected) {
      color = Colors.blueAccent;
    }
    return Card(
        margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: AnimatedContainer(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
          ),
          duration: Duration(seconds: 1),
          child: ListTile(
            dense: selected,
            title: Text(
              i(evidence),
            ),
            leading: Icon(
              iconData,
            ),
            trailing: InkWell(
              child: Icon(
                Icons.help_outline,
              ),
              onTap: () {
                goToEvidenceDetailPage(evidence);
              },
            ),
            onTap: () {
              setState(() {
                evidenceController.selectEvidence(evidence);
                evidenceController.verifyGhost();
              });
            },
            onLongPress: () {
              setState(() {
                evidenceController.discardEvidence(evidence);
                evidenceController.verifyGhost();
              });
            },
          ),
        ));
  }

  void goToGhostDatailPage(String ghostName) {
    Ghost ghost;

    ghostName = i(ghostName);

    if (ghostName == evidenceController.spirit) {
      ghost = Spirit();
    } else if (ghostName == evidenceController.wraith) {
      ghost = Wraith();
    } else if (ghostName == evidenceController.phantom) {
      ghost = Phantom();
    } else if (ghostName == evidenceController.poltergeist) {
      ghost = Poltergeist();
    } else if (ghostName == evidenceController.banshee) {
      ghost = Banshee();
    } else if (ghostName == evidenceController.jinn) {
      ghost = Jinn();
    } else if (ghostName == evidenceController.mare) {
      ghost = Mare();
    } else if (ghostName == evidenceController.revenant) {
      ghost = Revenant();
    } else if (ghostName == evidenceController.shade) {
      ghost = Shade();
    } else if (ghostName == evidenceController.demon) {
      ghost = Demon();
    } else if (ghostName == evidenceController.yurei) {
      ghost = Yurei();
    } else if (ghostName == evidenceController.oni) {
      ghost = Oni();
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GhostDetailPage(ghost)),
    );
  }

  void goToEvidenceDetailPage(String evidenceName) {
    Evidence evidence;
    if (evidenceName == evidenceController.emf) {
      evidence = EmfLevelFive();
    } else if (evidenceName == evidenceController.fingerprints) {
      evidence = Fingerprints();
    } else if (evidenceName == evidenceController.temperature) {
      evidence = FreezingTemperatures();
    } else if (evidenceName == evidenceController.orbs) {
      evidence = GhostOrb();
    } else if (evidenceName == evidenceController.writing) {
      evidence = GhostWriting();
    } else if (evidenceName == evidenceController.spiritBox) {
      evidence = SpiritBox();
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EvidenceDetailPage(evidence)),
    );
  }
}
