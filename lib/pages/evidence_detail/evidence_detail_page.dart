import 'package:flutter/material.dart';
import 'package:phasmophobiaassistant/i18n/i18n.dart';
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
          buildTitle(i("evidence").toUpperCase()),
          buildText(_evidence.name()),
          buildWrapImages(_evidence.images()),
          buildTitle(i("descriptions").toUpperCase()),
          buildListDescription(_evidence.descriptions()),
          buildTitle(i("how.it.works")),
          buildListDescription(_evidence.howItWorks()),
          buildTitle(i("possible.ghosts")),
          buildText(_evidence.ghosts()),
          buildBackButton(context)
        ],
      ),
    ));
  }
}
