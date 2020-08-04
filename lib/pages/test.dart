import 'package:flutter/material.dart';
import 'dart:async';
import 'package:time/time.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

DateTime start = DateTime.now();
DateTime end = DateTime(2020,10, 10);
Duration dateDiff =  end.difference(start);

class _TestState extends State<Test> {
  Timer _timer;

  int days;
  int hours;
  int min;
  int seconds;
  Duration dateDiff2 = dateDiff;

  @override
  void initState() {
    super.initState();
    days = (dateDiff2.inSeconds/86400).floor();
    hours = ((dateDiff2.inSeconds - days*86400)/3600).floor();
    min = ((dateDiff2.inSeconds - days*86400 - hours*3600)/60).floor();
    seconds = ((dateDiff2.inSeconds - days*86400 - hours*3600 - min*60));
  }

  void startTimer(Duration dateDiff) {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
        oneSec,
        (Timer timer) => setState(() {
          dateDiff2 = dateDiff2 - 1.seconds;
          days = (dateDiff2.inSeconds/86400).floor();
          hours = ((dateDiff2.inSeconds - days*86400)/3600).floor();
          min = ((dateDiff2.inSeconds - days*86400 - hours*3600)/60).floor();
          seconds = ((dateDiff2.inSeconds - days*86400 - hours*3600 - min*60));
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
        Text('$days Days $hours Hours $min Minutes  $seconds Seconds',
            style: TextStyle(
              fontSize: 50,
            )),
        RaisedButton(
          onPressed: (){startTimer(dateDiff);},
        )
      ]),
    );
  }
}

