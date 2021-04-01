import 'package:flutter/material.dart';
import 'dart:async';

class TimerCount extends StatefulWidget {
  @override
  TimerCountState createState() => TimerCountState();
}


class TimerCountState extends State<TimerCount> {
  @override
  Widget build(BuildContext context) {}
  int _time = 120;
  int _timeMin;
  int _timesec;
  void timerCountdown() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      _timeMin = (_time / 60).truncate();
      _timesec = _time % 60;
      if (_time == 0) {
        timer.cancel();
      } else {
        _time--;
      }
      print(_time);
      setState(() {});
    });
  }

}