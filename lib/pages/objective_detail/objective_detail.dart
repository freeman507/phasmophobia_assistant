import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:phasmophobiaassistant/i18n/i18n.dart';
import 'package:phasmophobiaassistant/models/Objective.dart';
import 'package:phasmophobiaassistant/widgets/detail_page.dart';

class ObjectiveDetail extends DetailPage {
  Objective _objective;

  ObjectiveDetail(this._objective);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildTitle(i("objective").toUpperCase()),
            buildText(_objective.name()),
            buildTitle(i("description").toUpperCase()),
            buildText(_objective.description()),
            buildTitle(i("details").toUpperCase()),
            buildText(_objective.details()),
            buildBackButton(context)
          ],
        ),
      ),
    );
  }
}
