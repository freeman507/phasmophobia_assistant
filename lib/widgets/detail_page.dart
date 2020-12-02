import 'package:flutter/material.dart';
import 'package:phasmophobiaassistant/i18n/i18n.dart';

abstract class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Container buildBackButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: RaisedButton(
        child: Text(i("back")),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Container buildTitle(String title) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white70),
      ),
    );
  }

  Container buildText(String text) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Text(
        i(text),
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white70),
      ),
    );
  }

  Column buildListDescription(List<String> descriptions) {
    var list = <Widget>[];

    descriptions.forEach((description) {
      list.add(buildText(description));
    });

    return Column(
      children: list,
    );
  }
}
