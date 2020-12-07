import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phasmophobiaassistant/i18n/i18n.dart';

class ConfigurationPage extends StatefulWidget {
  @override
  _ConfigurationPageState createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  var dropdownValue = language.toUpperCase() ?? "english";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/background.png"),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(10),
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    i("language"),
                    style: TextStyle(fontSize: 18),
                  ),
                  Divider(),
                  buildDropdownButton(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Row(
        children: <Widget>[
          Expanded(
            child: Container(
                margin: EdgeInsets.all(10),
                child: RaisedButton(
                  child: Text(i("save")),
                  onPressed: () {
                    saveLanguage(dropdownValue.toLowerCase());
                    showDialog(
                      context: context,
                      builder: (_) => buildAlertDialog(),
                      barrierDismissible: false,
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }

  AlertDialog buildAlertDialog() {
    var oldLanguage = language;
    language = dropdownValue.toLowerCase();
    return AlertDialog(
      content: Text(i("restart.app")),
      actions: <Widget>[
        FlatButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.pop(context);
            language = oldLanguage;
          },
        ),
      ],
      elevation: 24,
    );
  }

  DropdownButton<String> buildDropdownButton() {
    return DropdownButton(
      value: dropdownValue,
      items: <String>[
        "ENGLISH",
        "PORTUGUESE",
        "GERMANY",
        "SPANISH",
        "POLISH",
        "RUSSIAN",
        "UKRANIAN",
        "FRENCH",
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(i(value.toLowerCase())),
        );
      }).toList(),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
    );
  }
}
