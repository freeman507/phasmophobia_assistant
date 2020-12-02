import 'package:flutter/material.dart';
import 'package:phasmophobiaassistant/i18n/i18n.dart';
import 'package:phasmophobiaassistant/widgets/detail_page.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends DetailPage {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildTitle(i("about").toUpperCase()),
          buildText(
              "The Phasmophobia Assistant app is a tool to help players of Phasmophobia in your journeys. The app doesn't need internet acess or any authorization device to use. This project is open source and don't have any finantial intent. This is for Phasmophobia community."),
          buildText("Enjoy Phasmophobia Assistant!"),
          buildText(i("content.reference").toUpperCase()),
          buildLink("https://phasmophobia.fandom.com/wiki/Phasmophobia_Wiki"),
          buildText(i("app.based.on").toUpperCase()),
          buildLink("https://github.com/Beatusvir/phasmophobia-assistant"),
          buildText(i("source.code").toUpperCase()),
          buildLink("https://github.com/freeman507/phasmophobia_assistant"),
          buildText(i("maintainers").toUpperCase()),
          buildText("Felipe Zanella - Developer"),
          buildText("Maycon Yamamotto - UI Designer"),
          buildText("Bruno Augusto - UX Designer"),
          buildBackButton(context)
        ],
      ),
    ));
  }

  buildLink(String url) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Text(
          url,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.lightBlueAccent),
        ),
      ),
      onTap: () {
        launch(url);
      },
    );
  }
}
