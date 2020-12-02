import 'package:flutter/material.dart';
import 'package:phasmophobiaassistant/i18n/i18n.dart';
import 'package:phasmophobiaassistant/widgets/main_tab.dart';

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
