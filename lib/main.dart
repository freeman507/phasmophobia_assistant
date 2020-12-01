import 'package:flutter/material.dart';
import 'package:phasmophobiaassistant/pages/about/about_page.dart';
import 'package:phasmophobiaassistant/pages/evidences/evidences_page.dart';
import 'package:phasmophobiaassistant/pages/objectives/objectives_page.dart';

void main() {
  String title = "Phasmophobia Assistant";

  runApp(MaterialApp(
    title: title,
    theme: ThemeData(
      // Define the default brightness and colors.
      brightness: Brightness.dark,
      primaryColor: Colors.grey[900],
      accentColor: Colors.grey[800],
      buttonColor: Colors.grey[800],

      // Define the default font family.
      fontFamily: 'Poppins',

      // Define the default TextTheme. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      ),
    ),
    home: MainTab(),
  ));
}

class MainTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset("assets/background.png"),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 15),
              child: InkWell(
                child: Icon(Icons.info_outline),
                onTap: () {
                  goToAboutPage(context);
                },
              ),
            ),
          ],
          centerTitle: true,
          bottom: TabBar(
            tabs: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "Objectives",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "Evidences",
                  style: TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ObjectivesPage(),
            EvidencesPage(),
          ],
        ),
      ),
    );
  }

  void goToAboutPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AboutPage()),
    );
  }
}
