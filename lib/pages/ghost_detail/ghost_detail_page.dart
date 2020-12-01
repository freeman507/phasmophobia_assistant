import 'package:flutter/material.dart';
import 'package:phasmophobiaassistant/models/Ghost.dart';
import 'package:phasmophobiaassistant/widgets/detail_page.dart';

class GhostDetailPage extends DetailPage {
  Ghost _ghost;

  GhostDetailPage(this._ghost);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildTitle("GHOST"),
          buildText(_ghost.name()),
          buildTitle("DESCRIPTION"),
          buildListDescription(_ghost.descriptions()),
          buildTitle("STRENGTHS"),
          buildText(_ghost.strength()),
          buildTitle("WEAKNESS"),
          buildText(_ghost.weakness()),
          buildTitle("EVIDENCES"),
          buildText(_ghost.evidences()),
          buildBackButton(context)
        ],
      ),
    ));
  }

}
