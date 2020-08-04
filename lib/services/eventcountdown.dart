import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:time/time.dart';
import 'dart:async';


class EventCountDown extends StatefulWidget {
  final DateTime eventDate;
  final TextStyle textStyle;

  EventCountDown({Key key, this.eventDate, this.textStyle});

  @override
  _EventCountDownState createState() => _EventCountDownState();
}

class _EventCountDownState extends State<EventCountDown> {

  Timer _timer;

  int days;
  int hours;
  int min;
  int seconds;
  Duration dateDiff2;

  @override
  void initState() {
    super.initState();
    dateDiff2 = widget.eventDate.difference(DateTime.now());
    days = (dateDiff2.inSeconds/86400).floor();
    hours = ((dateDiff2.inSeconds - days*86400)/3600).floor();
    min = ((dateDiff2.inSeconds - days*86400 - hours*3600)/60).floor();
    seconds = ((dateDiff2.inSeconds - days*86400 - hours*3600 - min*60));
    startTimer(dateDiff2);
  }

  void startTimer(Duration dateDiff) {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
        oneSec,
    (Timer timer) => setState(() {
      if (dateDiff2.inSeconds < 1){
        timer.cancel();
      } else {
      dateDiff2 = dateDiff2 - 1.seconds;
      days = (dateDiff2.inSeconds/86400).floor();
      hours = ((dateDiff2.inSeconds - days*86400)/3600).floor();
      min = ((dateDiff2.inSeconds - days*86400 - hours*3600)/60).floor();
      seconds = ((dateDiff2.inSeconds - days*86400 - hours*3600 - min*60));}
    }));}


    @override
    Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text('$days Days $hours Hours $min Minutes  $seconds Seconds'
              ),
        ]);

  }
}






