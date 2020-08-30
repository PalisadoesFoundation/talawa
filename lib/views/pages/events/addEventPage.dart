import 'package:flutter/material.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/uidata.dart';

import 'package:talawa/utils/apiFuctions.dart';
import 'package:intl/intl.dart';

class AddEvent extends StatefulWidget {
  AddEvent({Key key}) : super(key: key);

  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final locationController = TextEditingController();

  Map switchVals = {
    'Make Public': true,
    'Make Registerable': true,
    'Recurring': true,
    'All Day': false
  };
  var recurranceList = ['DAILY', 'WEEKLY', 'MONTHLY', 'YEARLY'];
  String recurrance = 'DAILY';
  Preferences preferences = Preferences();
  void initState() {
    super.initState();
  }

  DateTime selectedDate = DateTime.now();
  Map startEndTimes = {
    'Start Time': DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 12, 0)
        .millisecondsSinceEpoch,
    'End Time': DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 23, 59)
        .millisecondsSinceEpoch,
  };

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<void> _selectTime(
      BuildContext context, String name, TimeOfDay time) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: time,
    );
    if (picked != null && picked != time)
      setState(() {
        startEndTimes[name] = DateTime(
                DateTime.now().year,
                DateTime.now().month,
                DateTime.now().day,
                picked.hour,
                picked.minute)
            .millisecondsSinceEpoch;
      });
  }

  Future<void> createEvent() async {
    final String currentOrgID = await preferences.getCurrentOrgId();
    DateTime date =
        DateTime(selectedDate.year, selectedDate.month, selectedDate.day)
            .toUtc();
    int startTime = DateTime(
            selectedDate.year,
            selectedDate.month,
            selectedDate.day,
            startEndTimes['End Time'].hour,
            startEndTimes['End Time'].minute)
        .millisecondsSinceEpoch;
    int endTime = DateTime(
            selectedDate.year,
            selectedDate.month,
            selectedDate.day,
            startEndTimes['Start Time'].hour,
            startEndTimes['Start Time'].minute)
        .millisecondsSinceEpoch;
    print(endTime);
    String mutation = Queries().addEvent(
      organizationId: currentOrgID,
      title: titleController.text,
      description: descriptionController.text,
      location: locationController.text,
      isPublic: switchVals['Make Public'],
      isRegisterable: switchVals['Make Registerable'],
      recurring: switchVals['Recurring'],
      allDay: switchVals['All Day'],
      recurrance: recurrance,
      startTime: startTime,
      endTime: endTime,
      date: date,
    );
    ApiFunctions apiFunctions = ApiFunctions();
    Map result = await apiFunctions.gqlmutation(mutation);
  }

  @override
  Widget build(BuildContext context) {
    print(TimeOfDay.fromDateTime(
        DateTime.fromMicrosecondsSinceEpoch(startEndTimes['Start Time'])));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New Event',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(bottom: 100),
        children: <Widget>[
          inputField('Title', titleController),
          inputField('Description', descriptionController),
          inputField('Location', locationController),
          switchTile('Make Public'),
          switchTile('Make Registerable'),
          switchTile('Recurring'),
          switchTile('All Day'),
          recurrencedropdown(),
          dateButton(),
          timeButton('Start Time', startEndTimes['Start Time']),
          timeButton('End Time', startEndTimes['End Time']),
        ],
      ),
      floatingActionButton: addEventFab(),
    );
  }

  Widget dateButton() {
    return ListTile(
      onTap: () {
        _selectDate(context);
      },
      leading: Text(
        'Date',
        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
      ),
      trailing: Text(
        '${DateFormat.yMMMd().format(selectedDate)}',
        style: TextStyle(fontSize: 16, color: UIData.secondaryColor),
      ),
    );
  }

  Widget timeButton(String name, int time) {
    print(TimeOfDay.fromDateTime(DateTime.fromMicrosecondsSinceEpoch(time)));
    return AbsorbPointer(
        absorbing: switchVals['All Day'],
        child: ListTile(
          onTap: () {
            _selectTime(
                context,
                name,
                TimeOfDay.fromDateTime(
                    DateTime.fromMicrosecondsSinceEpoch(time)));
          },
          leading: Text(
            name,
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
          trailing: Text(
            TimeOfDay.fromDateTime(DateTime.fromMicrosecondsSinceEpoch(time))
                .format(context),
            style: TextStyle(
                color: !switchVals['All Day']
                    ? UIData.secondaryColor
                    : Colors.grey),
          ),
        ));
  }

  Widget addEventFab() {
    return FloatingActionButton(
        backgroundColor: UIData.secondaryColor,
        child: Icon(
          Icons.check,
          color: Colors.white,
        ),
        onPressed: () {
          createEvent();
          Navigator.of(context).pop();
        });
  }

  Widget inputField(String name, TextEditingController controller) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: TextField(
          maxLines: name == 'Description' ? null : 1,
          controller: controller,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: Colors.teal)),
              hintText: name),
        ));
  }

  Widget switchTile(String name) {
    return SwitchListTile(
        activeColor: UIData.secondaryColor,
        value: switchVals[name],
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        title: Text(
          name,
          style: TextStyle(color: Colors.grey[600]),
        ),
        onChanged: (val) {
          setState(() {
            switchVals[name] = val;
          });
        });
  }

  Widget recurrencedropdown() {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20),
      leading: Text(
        'Recurrence',
        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
      ),
      trailing: AbsorbPointer(
        absorbing: !switchVals['Recurring'],
        child: DropdownButton<String>(
          style: TextStyle(
              color: switchVals['Recurring']
                  ? UIData.secondaryColor
                  : Colors.grey),
          value: recurrance,
          icon: Icon(Icons.arrow_drop_down),
          onChanged: (String newValue) {
            setState(() {
              recurrance = newValue;
            });
          },
          items: recurranceList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
