import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phasmophobiaassistant/config/config.dart';
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
  final Map<String, dynamic> lastStateApp;

  EvidencesPage(this.lastStateApp);

  @override
  _EvidencesPageState createState() => _EvidencesPageState(lastStateApp);
}

class _EvidencesPageState extends State<EvidencesPage>
    with AutomaticKeepAliveClientMixin<EvidencesPage> {
  EvidenceController evidenceController = new EvidenceController();

  _EvidencesPageState(Map<String, dynamic> lastStateApp) {
    evidenceController.emfSelected = lastStateApp["emfSelected"] ?? false;
    evidenceController.fingerprintsSelected =
        lastStateApp["fingerprintsSelected"] ?? false;
    evidenceController.temperatureSelected =
        lastStateApp["temperatureSelected"] ?? false;
    evidenceController.orbSelected = lastStateApp["orbSelected"] ?? false;
    evidenceController.writingSelected =
        lastStateApp["writingSelected"] ?? false;
    evidenceController.spiritBoxSelected =
        lastStateApp["spiritBoxSelected"] ?? false;

    evidenceController.emfDiscarded = lastStateApp["emfDiscarded"] ?? false;
    evidenceController.fingerprintsDiscarded =
        lastStateApp["fingerprintsDiscarded"] ?? false;
    evidenceController.temperatureDiscarded =
        lastStateApp["temperatureDiscarded"] ?? false;
    evidenceController.orbDiscarded = lastStateApp["orbDiscarded"] ?? false;
    evidenceController.writingDiscarded =
        lastStateApp["writingDiscarded"] ?? false;
    evidenceController.spiritBoxDiscarded =
        lastStateApp["spiritBoxDiscarded"] ?? false;

    evidenceController.verifyGhost();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: ListView(
        children: <Widget>[
          buildEvidenceItem(Icons.signal_cellular_alt, evidenceController.emf,
              evidenceController.emfSelected, evidenceController.emfDiscarded),
          buildEvidenceItem(
              Icons.fingerprint,
              evidenceController.fingerprints,
              evidenceController.fingerprintsSelected,
              evidenceController.fingerprintsDiscarded),
          buildEvidenceItem(
              Icons.thermostat_outlined,
              evidenceController.temperature,
              evidenceController.temperatureSelected,
              evidenceController.temperatureDiscarded),
          buildEvidenceItem(Icons.wb_sunny, evidenceController.orbs,
              evidenceController.orbSelected, evidenceController.orbDiscarded),
          buildEvidenceItem(
              Icons.menu_book,
              evidenceController.writing,
              evidenceController.writingSelected,
              evidenceController.writingDiscarded),
          buildEvidenceItem(
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
        children: buildGhostChips(),
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

  List<Widget> buildGhostChips() {
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

  Card buildEvidenceItem(
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
                selectEvidence(evidence);
              });
            },
            onLongPress: () {
              setState(() {
                discardEvidence(evidence);
              });
            },
          ),
        ));
  }

  void discardEvidence(String evidence) {
    if (evidenceController.discardEvidence(evidence)) {
      var oldGhosts = evidenceController.ghosts;
      if (!evidenceController.verifyGhost()) {
        showSnackBar(i("no.ghosts.found"), context);
      } else {
        if (oldGhosts == evidenceController.ghosts) {
          showSnackBar(i("cant.change.evidence"), context);
        }
      }
    } else {
      if (enableDiscardEvidence) {
        showSnackBar(i("cant.discard.selected.evidence"), context);
      } else {
        showSnackBar(i("cant.select.discarded.evidence"), context);
      }
    }
  }

  void selectEvidence(String evidence) {
    if (evidenceController.selectEvidence(evidence)) {
      if (!evidenceController.verifyGhost()) {
        showSnackBar(i("no.ghosts.found"), context);
      }
    } else {
      showSnackBar(i("cant.select.discarded.evidence"), context);
    }
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

  void showSnackBar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black54,
      ),
    );
  }
}
