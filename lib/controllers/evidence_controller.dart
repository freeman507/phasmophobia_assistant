import 'package:phasmophobiaassistant/config/config.dart';
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

class EvidenceController {
  bool emfSelected = false;

  bool fingerprintsSelected = false;

  bool temperatureSelected = false;

  bool orbSelected = false;

  bool writingSelected = false;

  bool spiritBoxSelected = false;

  bool emfDiscarded = false;

  bool fingerprintsDiscarded = false;

  bool temperatureDiscarded = false;

  bool orbDiscarded = false;

  bool writingDiscarded = false;

  bool spiritBoxDiscarded = false;

  String emf = i("emf.level.5");

  String fingerprints = i("fingerprints");

  String temperature = i("freezing.temperatures");

  String orbs = i("ghost.orbs");

  String writing = i("ghost.writing");

  String spiritBox = i("spirit.box");

  String spirit = i("spirit");

  String banshee = i("banshee");

  String wraith = i("wraith");

  String phantom = i("phantom");

  String poltergeist = i("poltergeist");

  String jinn = i("jinn");

  String mare = i("mare");

  String revenant = i("revenant");

  String shade = i("shade");

  String demon = i("demon");

  String yurei = i("yurei");

  String oni = i("oni");

  String ghosts =
      "spirit | wraith | phantom | poltergeist | banshee | jinn | mare | revenant | shade | demon | yurei | oni";

  void selectEvidence(String evidence) {
    if (evidence == emf) {
      emfSelected = !emfSelected;
      emfDiscarded = false;
    } else if (evidence == fingerprints) {
      fingerprintsSelected = !fingerprintsSelected;
      fingerprintsDiscarded = false;
    } else if (evidence == temperature) {
      temperatureSelected = !temperatureSelected;
      temperatureDiscarded = false;
    } else if (evidence == orbs) {
      orbSelected = !orbSelected;
      orbDiscarded = false;
    } else if (evidence == writing) {
      writingSelected = !writingSelected;
      writingDiscarded = false;
    } else if (evidence == spiritBox) {
      spiritBoxSelected = !spiritBoxSelected;
      spiritBoxDiscarded = false;
    }
  }

  void discardEvidence(String evidence) {
    if (enableDiscardEvidence) {
      if (evidence == emf) {
        emfSelected = false;
        emfDiscarded = !emfDiscarded;
      } else if (evidence == fingerprints) {
        fingerprintsSelected = false;
        fingerprintsDiscarded = !fingerprintsDiscarded;
      } else if (evidence == temperature) {
        temperatureSelected = false;
        temperatureDiscarded = !temperatureDiscarded;
      } else if (evidence == orbs) {
        orbSelected = false;
        orbDiscarded = !orbDiscarded;
      } else if (evidence == writing) {
        writingSelected = false;
        writingDiscarded = !writingDiscarded;
      } else if (evidence == spiritBox) {
        spiritBoxSelected = false;
        spiritBoxDiscarded = !spiritBoxDiscarded;
      }
    } else {
      selectEvidence(evidence);
    }
  }

  String verifyEvidencesSelected() {
    String evidences = "";

    if (emfSelected) {
      evidences += "emf.level.5 ";
    }

    if (fingerprintsSelected) {
      evidences += "fingerprints ";
    }

    if (temperatureSelected) {
      evidences += "freezing.temperatures ";
    }

    if (orbSelected) {
      evidences += "ghost.orbs ";
    }

    if (writingSelected) {
      evidences += "ghost.writing ";
    }

    if (spiritBoxSelected) {
      evidences += "spirit.box ";
    }

    return evidences.trim();
  }

  String verifyEvidencesDiscarded() {
    String evidences = "";

    if (emfDiscarded) {
      evidences += "emf.level.5 ";
    }

    if (fingerprintsDiscarded) {
      evidences += "fingerprints ";
    }

    if (temperatureDiscarded) {
      evidences += "freezing.temperatures ";
    }

    if (orbDiscarded) {
      evidences += "ghost.orbs ";
    }

    if (writingDiscarded) {
      evidences += "ghost.writing ";
    }

    if (spiritBoxDiscarded) {
      evidences += "spirit.box ";
    }

    return evidences.trim();
  }

  verifyGhost() {
    String evidencesSelected = verifyEvidencesSelected();
    String evidencesDiscarded = verifyEvidencesDiscarded();
    ghosts = defineGhost(evidencesSelected, evidencesDiscarded);
  }

  String defineGhost(String evidencesSelected, String evidencesDiscarded) {
    List<String> selectedEvidencesList = evidencesSelected.split(" ");
    List<String> selectedDiscardedList = evidencesDiscarded.split(" ");
    List<String> possibleEvidences = [];
    List<Ghost> ghostsList = getAllGhosts();
    List<Ghost> selectedGhostsList = [];
    List<Ghost> possibleGhostsList = [];

    filterSelectedGhosts(ghostsList, selectedEvidencesList, selectedGhostsList);

    if (enableDiscardEvidence) {
      filterDiscardedGhosts(
          selectedGhostsList, selectedDiscardedList, possibleGhostsList);
    } else {
      possibleGhostsList = selectedGhostsList;
    }

    determinePossibleEvidences(possibleGhostsList, possibleEvidences);

    discardEvidences(possibleEvidences);

    //verifyLastEvidence(possibleGhostsList);

    return getGhostsNames(possibleGhostsList);
  }

  void verifyLastEvidence(List<Ghost> possibleGhostsList) {
    if (possibleGhostsList.length == 1) {
      Ghost lastGhost = possibleGhostsList.first;
      for (Evidence evidence in lastGhost.evidences()) {
        String lastEvidence = evidence.name();
        if (lastEvidence == "emf.level.5") {
          emfSelected = true;
          emfDiscarded = false;
        } else if (lastEvidence == "fingerprints") {
          fingerprintsSelected = true;
          fingerprintsDiscarded = false;
        } else if (lastEvidence == "freezing.temperatures") {
          temperatureSelected = true;
          temperatureDiscarded = false;
        } else if (lastEvidence == "ghost.orbs") {
          orbSelected = true;
          orbDiscarded = false;
        } else if (lastEvidence == "ghost.writing") {
          writingSelected = true;
          writingDiscarded = false;
        } else if (lastEvidence == "spirit.box") {
          spiritBoxSelected = true;
          spiritBoxDiscarded = false;
        }
      }
    }
  }

  void discardEvidences(List<String> possibleEvidences) {
    List<Evidence> allEvidences = getAllEvidences();

    for (Evidence evidence in allEvidences) {
      if (evidence.name() == "emf.level.5") {
        if (!possibleEvidences.contains(evidence.name())) {
          if (!emfSelected && !emfDiscarded) {
            emfDiscarded = true;
          }
        } else {
          emfDiscarded = false;
        }
      } else if (evidence.name() == "fingerprints") {
        if (!possibleEvidences.contains(evidence.name())) {
          if (!fingerprintsSelected && !fingerprintsDiscarded) {
            fingerprintsDiscarded = true;
          }
        } else {
          fingerprintsDiscarded = false;
        }
      } else if (evidence.name() == "freezing.temperatures") {
        if (!possibleEvidences.contains(evidence.name())) {
          if (!temperatureSelected && !temperatureDiscarded) {
            temperatureDiscarded = true;
          }
        } else {
          temperatureDiscarded = false;
        }
      } else if (evidence.name() == "ghost.orbs") {
        if (!possibleEvidences.contains(evidence.name())) {
          if (!orbSelected && !orbDiscarded) {
            orbDiscarded = true;
          }
        } else {
          orbDiscarded = false;
        }
      } else if (evidence.name() == "ghost.writing") {
        if (!possibleEvidences.contains(evidence.name())) {
          if (!writingSelected && !writingDiscarded) {
            writingDiscarded = true;
          }
        } else {
          writingDiscarded = false;
        }
      } else if (evidence.name() == "spirit.box") {
        if (!possibleEvidences.contains(evidence.name())) {
          if (!spiritBoxSelected && !spiritBoxDiscarded) {
            spiritBoxDiscarded = true;
          }
        } else {
          spiritBoxDiscarded = false;
        }
      }
    }
  }

  List<Evidence> getAllEvidences() {
    return [
      EmfLevelFive(),
      Fingerprints(),
      FreezingTemperatures(),
      GhostOrb(),
      GhostWriting(),
      SpiritBox(),
    ];
  }

  void determinePossibleEvidences(
      List<Ghost> possibleGhostsList, List<String> possibleEvidences) {
    if (possibleGhostsList.isNotEmpty) {
      for (Ghost ghost in possibleGhostsList) {
        for (Evidence evidence in ghost.evidences()) {
          if (!possibleEvidences.contains(evidence.name())) {
            possibleEvidences.add(evidence.name());
          }
        }
      }
    } else {
      getAllEvidences().forEach((element) {
        possibleEvidences.add(element.name());
      });
    }
  }

  List<Ghost> getAllGhosts() {
    return [
      Spirit(),
      Wraith(),
      Phantom(),
      Poltergeist(),
      Banshee(),
      Jinn(),
      Mare(),
      Revenant(),
      Shade(),
      Demon(),
      Yurei(),
      Oni()
    ];
  }

  void filterDiscardedGhosts(List<Ghost> selectedGhostsList,
      List<String> selectedDiscardedList, List<Ghost> possibleGhostsList) {
    if (selectedGhostsList.isEmpty) {
      selectedGhostsList = getAllGhosts();
    }

    for (Ghost ghost in selectedGhostsList) {
      bool addGhost = true;
      for (String evidenceName in selectedDiscardedList) {
        bool found = false;
        for (Evidence evidence in ghost.evidences()) {
          if (evidence.name() == evidenceName) {
            found = true;
            break;
          }
        }
        if (found) {
          addGhost = false;
          break;
        }
      }
      if (addGhost) {
        possibleGhostsList.add(ghost);
      }
    }
  }

  String getGhostsNames(List<Ghost> selectedGhostsList) {
    String ghostFound = "";
    if (selectedGhostsList.isNotEmpty) {
      selectedGhostsList.forEach((element) {
        ghostFound += element.name() + " | ";
      });
      ghostFound = ghostFound.trim().substring(0, ghostFound.length - 2);
    }
    return ghostFound.trim();
  }

  void filterSelectedGhosts(List<Ghost> ghostsList,
      List<String> selectedEvidencesList, List<Ghost> selectedGhostsList) {
    if (selectedEvidencesList.isNotEmpty) {
      for (Ghost ghost in ghostsList) {
        bool possibleGhost = true;

        for (String evidenceName in selectedEvidencesList) {
          bool evidenceFound = false;
          for (Evidence evidence in ghost.evidences()) {
            if (evidence.name() == evidenceName) {
              evidenceFound = true;
              break;
            }
          }
          if (!evidenceFound) {
            possibleGhost = false;
            break;
          }
        }
        if (possibleGhost) {
          selectedGhostsList.add(ghost);
        }
      }
    }
  }

  void reset() {
    emfSelected = false;
    fingerprintsSelected = false;
    temperatureSelected = false;
    orbSelected = false;
    writingSelected = false;
    spiritBoxSelected = false;
    emfDiscarded = emfSelected;
    fingerprintsDiscarded = fingerprintsSelected;
    temperatureDiscarded = temperatureSelected;
    orbDiscarded = orbSelected;
    writingDiscarded = writingSelected;
    spiritBoxDiscarded = spiritBoxSelected;
    ghosts =
        "spirit | wraith | phantom | poltergeist | banshee | jinn | mare | revenant | shade | demon | yurei | oni";
  }
}
