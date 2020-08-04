import 'package:flutter/material.dart';
import 'package:countdown_app/services/datepickert.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:countdown_app/services/event.dart';


class NewEvent extends StatefulWidget {
  @override
  _NewEventState createState() => _NewEventState();
}

class _NewEventState extends State<NewEvent> {

  final controllerStartTime = TextEditingController();
  final controllerTitle = TextEditingController();
  final _formKey = GlobalKey<FormState>();



  Future<Null> selectStartTime(
      BuildContext context, TimeOfDay selectedTime) async {
    final TimeOfDay pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      DateFormat _dateFormat = DateFormat.Hm();
      controllerStartTime.text = '${pickedTime.hour}:${pickedTime.minute}';
      eventTime = pickedTime;
    }
  }


  @override
  void dispose() {
    controllerStartTime.dispose();
    super.dispose();
  }

  void updateEvent(context, title, date, eventTime) {
      DateTime consolidate = DateTime(date.year,date.month,date.day,eventTime.hour,eventTime.minute);
      Event instance =  Event(title: title, date: consolidate, eventTime: eventTime);
      Navigator.pop(context, {
        'title': instance.title,
        'date': instance.date,
        'eventTime': instance.eventTime,
      });
  }

  String title = '';
  DateTime date = DateTime.now();
  TimeOfDay eventTime = TimeOfDay.now();



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
              'New Event',
          ),
        ),
      ),
      body: Form(
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: controllerTitle,
              decoration: InputDecoration(
                labelText: 'Event Title',
              ),
            ),
            MyTextFieldDatePicker(
              firstDate: DateTime.parse('19700101'),
              lastDate: DateTime.parse('20250101'),
              initialDate: DateTime.now(),
              onDateChanged: (selectDate) {
                date = selectDate;
              },
              ),
            TextFormField(
              controller: controllerStartTime,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "My Time:",
                prefixIcon: Icon(Icons.watch_later),
              ),
              onTap: () => selectStartTime(context, TimeOfDay.now()),
              readOnly: true,
            ),
            RaisedButton(
              child: Text('Save'),
              onPressed: (){
                title = controllerTitle.text;

                updateEvent(context, title, date, eventTime);
              },
            ),
          ],
        ),
        ),
      );
  }
}

