import 'dart:async';

import 'package:flutter/material.dart';

class TimerText extends StatefulWidget {

  final Stopwatch stopwatch;

  int _duration;

  TimerTextState _timerTextState;

  TimerText(this.stopwatch, this._duration) {
    _timerTextState = new TimerTextState(stopwatch, _duration);
  }

  set duration(int value) {
    _duration = value;
    _timerTextState.duration = value;
  }

  TimerTextState createState() => _timerTextState;
}

class TimerTextState extends State<TimerText> {

  Timer timer;
  final Stopwatch stopwatch;
  int _duration;


  TimerTextState(this.stopwatch, this._duration) {
    timer = new Timer.periodic(new Duration(milliseconds: 30), callback);
  }

  set duration(int value) {
    setState(() {
      _duration = value;
    });
  }

  void callback(Timer timer) {
    if (stopwatch.isRunning) {
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle timerTextStyle = const TextStyle(fontSize: 24.0, fontFamily: "Open Sans");

    var time = _duration - stopwatch.elapsedMilliseconds;

    if (time <= 0) {
      stopwatch.stop();
      stopwatch.reset();
      time = 0;
    }

    String formattedTime = format(time);

    return new Text(formattedTime, style: timerTextStyle, textAlign: TextAlign.center,);
  }

  String format(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();

    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    return "$minutesStr:$secondsStr";
  }
}