import 'package:flutter/material.dart';
import 'package:time/time.dart';
import 'package:intl/intl.dart';
import 'package:countdown_app/services/event.dart';
import 'package:countdown_app/services/eventcountdown.dart';
import 'package:countdown_app/data/FilePersistence.dart';




class Home extends StatefulWidget {

  @override

  _HomeState createState() => _HomeState();

}

class _HomeState extends State<Home> {

  List<Event> eventList= [];


  void updateEventList(Event newEvent) {
    setState(() {
      eventList.add(newEvent);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Format the difference of date from Hours to DHMS
    /*String _printDuration(Duration duration) {
      String twoDigits(int n) => n.toString().padLeft(2, "0");
      String twoDigitHours = twoDigits(duration.inHours.remainder(24));
      String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
      String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
      return "${twoDigits(duration.inDays)} Days: $twoDigitHours Hours:"
             " $twoDigitMinutes Minutes :$twoDigitSeconds Seconds";
    }*/


    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: eventList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(
                eventList[index].title,
                textAlign: TextAlign.center,
              ),
                subtitle:EventCountDown(
                  textStyle: TextStyle(
                    fontSize: 20,
                  ),
                  eventDate: eventList[index].date,
            ),
          ));
        },
      ),
      floatingActionButton: FlatButton(
          color: Colors.blue,
          onPressed: () async {
            dynamic result = await Navigator.pushNamed(context, '/new_event');
            Event newEvent = Event(
                title: result['title'],
                date: result['date'],
                eventTime: result['eventTime']);
            updateEventList(newEvent);
          },
          child: Icon(
            Icons.add,
          )),
    );
  }
}

