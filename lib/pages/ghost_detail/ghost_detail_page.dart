import 'package:flutter/material.dart';
import 'package:phasmophobiaassistant/i18n/i18n.dart';
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
          buildTitle(i("ghost")),
          buildText(_ghost.name()),
          buildTitle(i("description")),
          buildListDescription(_ghost.descriptions()),
          buildTitle(i("strengths")),
          buildText(_ghost.strength()),
          buildTitle(i("weakness")),
          buildText(_ghost.weakness()),
          buildTitle(i("evidences")),
          buildText(_ghost.evidences()),
          buildBackButton(context)
        ],
      ),
    ));
  }

}
