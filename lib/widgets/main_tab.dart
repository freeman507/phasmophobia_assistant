import 'package:flutter/material.dart';
import 'package:phasmophobiaassistant/i18n/i18n.dart';
import 'package:phasmophobiaassistant/pages/about/about_page.dart';
import 'package:phasmophobiaassistant/pages/configuration/configuration_page.dart';
import 'package:phasmophobiaassistant/pages/evidences/evidences_page.dart';
import 'package:phasmophobiaassistant/pages/objectives/objectives_page.dart';

class MainTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadLanguage(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return buildDefaultTabController(context);
        } else {
          return Container(
            color: Colors.black,
          );
        }
      },
    );
  }

  DefaultTabController buildDefaultTabController(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset("assets/background.png"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                goToConfigurationPage(context);
              },
            ),
            IconButton(
              icon: Icon(Icons.info_outline),
              onPressed: () {
                goToAboutPage(context);
              },
            )
          ],
          centerTitle: true,
          bottom: TabBar(
            tabs: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  i("objectives"),
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  i("evidences"),
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

  void goToConfigurationPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ConfigurationPage()),
    );
  }
}
