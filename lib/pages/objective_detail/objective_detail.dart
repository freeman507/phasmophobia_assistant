import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
            buildTitle("OBJECTIVE"),
            buildText(_objective.name()),
            buildTitle("DESCRIPTION"),
            buildText(_objective.description()),
            buildTitle("DETAILS"),
            buildText(_objective.details()),
            buildBackButton(context)
          ],
        ),
      ),
    );
  }
}
