import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/GQLClient.dart';
import 'package:talawa/utils/uidata.dart';

import 'package:provider/provider.dart';
import 'package:talawa/controllers/organisation_controller.dart';
import 'package:talawa/utils/apiFuctions.dart';
import 'package:intl/intl.dart';
import 'package:talawa/utils/userInfo.dart';
import 'package:talawa/views/pages/events.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class AddEvent extends StatefulWidget {
  AddEvent({Key key}) : super(key: key);

  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  Map switchVals = {
    'Make Public': true,
    'Make Registerable': true,
    'Recurring': true
  };
  var recurranceList = ['DAILY', 'WEEKLY', 'MONTHLY', 'YEARLY'];
  String recurrance = 'DAILY';
  UserInfo userInfo = UserInfo();
  Preferences preferences = Preferences();
  String currentOrgId;
  void initState() {
    super.initState();
    getCurrentOrgId();
  }

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

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

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime)
      setState(() {
        selectedTime = picked;
      });
  }

  Future<void> createEvent() async {
    DateTime date = DateTime(selectedDate.year, selectedDate.month, selectedDate.day, selectedTime.hour, selectedTime.minute);

    String mutation = Queries().addEvent(
      currentOrgId,
      titleController.text,
      descriptionController.text,
      switchVals['Make Public'],
      switchVals['Make Registerable'],
      switchVals['Recurring'],
      recurrance,
      date,
    );
    ApiFunctions apiFunctions = ApiFunctions();
    Map result = await apiFunctions.gqlmutation(mutation);
  }

  getCurrentOrgId() async {
    final orgId = await preferences.getCurrentOrgId();
    setState(() {
      currentOrgId = orgId;
    });
    print(currentOrgId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New Event',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: <Widget>[
          inputField('Title', titleController),
          inputField('Description', descriptionController),
          switchTile('Make Public'),
          switchTile('Make Registerable'),
          switchTile('Recurring'),
          recurrencedropdown(),
          dateButton(),
          timeButton(),
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


  Widget timeButton() {
    return ListTile(
      onTap: () {
        _selectTime(context);
      },
      leading: Text(
        'Time',
        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
      ),
      trailing: Text(
        selectedTime.format(context),
        style: TextStyle(fontSize: 16, color: UIData.secondaryColor),
      ),
    );
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
