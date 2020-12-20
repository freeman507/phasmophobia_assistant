import 'dart:async';

import 'package:flutter/material.dart';

class TimerText extends StatefulWidget {
  final int duration;

  final Stopwatch stopwatch;

  const TimerText(this.stopwatch, this.duration);

  TimerTextState createState() => TimerTextState();
}

class TimerTextState extends State<TimerText> {

  Timer timer;

  TimerTextState() {
    timer = new Timer.periodic(new Duration(milliseconds: 30), callback);
  }

  void callback(Timer timer) {
    if (widget.stopwatch.isRunning) {
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle timerTextStyle = const TextStyle(
        fontSize: 24.0, fontFamily: "Open Sans");

    var time = widget.duration - widget.stopwatch.elapsedMilliseconds;

    if (time <= 0) {
      widget.stopwatch.stop();
      widget.stopwatch.reset();
      time = 0;
    }

    String formattedTime = format(time);

    return new Text(
      formattedTime, style: timerTextStyle, textAlign: TextAlign.center,);
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