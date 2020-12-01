import 'package:flutter/material.dart';
import 'package:phasmophobiaassistant/models/Evidence.dart';
import 'package:phasmophobiaassistant/widgets/detail_page.dart';

class EvidenceDetailPage extends DetailPage {
  Evidence _evidence;

  EvidenceDetailPage(this._evidence);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildTitle("EVIDENCE"),
          buildText(_evidence.name()),
          buildTitle("DESCRIPTIONS"),
          buildListDescription(_evidence.descriptions()),
          buildTitle("HOW IT WORKS"),
          buildListDescription(_evidence.howItWorks()),
          buildTitle("POSSIBLE GHOSTS"),
          buildText(_evidence.ghosts()),
          buildBackButton(context)
        ],
      ),
    ));
  }
}
