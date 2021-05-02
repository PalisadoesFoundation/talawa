//flutter packages
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/services/queries_.dart';

//pages are called here
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/api_functions.dart';
import 'package:talawa/utils/custom_toast.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:intl/intl.dart';
import 'package:talawa/views/pages/events/events.dart';
import 'package:talawa/views/widgets/show_progress.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({Key key}) : super(key: key);

  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final locationController = TextEditingController();
  bool _validateTitle = false,
      _validateDescription = false,
      _validateLocation = false;
  ApiFunctions apiFunctions = ApiFunctions();

  Map<String, bool> switchVals = {
    'Make Public': true,
    'Make Registerable': true,
    'Recurring': true,
    'All Day': false
  };
  List<String> recurranceList = ['DAILY', 'WEEKLY', 'MONTHLY', 'YEARLY'];
  String recurrance = 'DAILY';
  Preferences preferences = Preferences();

  //getting the date for the event
  DateTimeRange dateRange = DateTimeRange(
      start: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 1, 0),
      end: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day + 1, 1, 0));

  //storing the start time of an event
  Map<String, DateTime> startEndTimes = {
    'Start Time': DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 12, 0),
    'End Time': DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 23, 59),
  };

  //method to be called when the user wants to select the date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTimeRange picked = await showDateRangePicker(
        context: context,
        // initialDate: selectedDate,
        firstDate: DateTime(now.year, now.month, now.day),
        lastDate: DateTime(2101));
    if (picked != null && picked != dateRange) {
      setState(() {
        dateRange = picked;
      });
    }
  }

  //method to be called when the user wants to select time
  Future<void> _selectTime(
      BuildContext context, String name, TimeOfDay time) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: time,
    );
    if (picked != null && picked != time) {
      setState(() {
        startEndTimes[name] = DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            picked.hour,
            picked.minute);
      });
    }
  }

  //method used to create an event
  Future<void> createEvent() async {
    final DateTime startDate = DateTime(
        dateRange.start.year, dateRange.start.month, dateRange.start.day);
    final DateTime endDate = DateTime(
        dateRange.start.year, dateRange.start.month, dateRange.start.day);
    final DateTime startTime = DateTime(
        dateRange.start.year,
        dateRange.start.month,
        dateRange.start.day,
        startEndTimes['Start Time'].hour,
        startEndTimes['Start Time'].minute);
    final DateTime endTime = DateTime(
        dateRange.end.year,
        dateRange.end.month,
        dateRange.end.day,
        startEndTimes['End Time'].hour,
        startEndTimes['End Time'].minute);

    if (switchVals['All Day']) {
      startEndTimes = {
        'Start Time': DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 12, 0),
        'End Time': DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 23, 59),
      };
    }
    final String currentOrgID = await preferences.getCurrentOrgId();
    final result = await Queries().addEvent(
      startDate: startDate.toString(),
      endDate: endDate.toString(),
      organizationId: currentOrgID,
      title: titleController.text,
      description: descriptionController.text,
      location: locationController.text,
      isPublic: switchVals['Make Public'],
      isRegisterable: switchVals['Make Registerable'],
      recurring: switchVals['Recurring'],
      allDay: switchVals['All Day'],
      recurrance: recurrance,
      startTime: startTime.microsecondsSinceEpoch.toString(),
      endTime: endTime.microsecondsSinceEpoch.toString(),
    );
    print('Result is : $result');
    if (result == null) {
      CustomToast.exceptionToast(
          msg: "Could not create event! Please Try Again later!");
    }
  }

  //main build starts from here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Event',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 100),
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

  //widget to get the date button
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
        '${DateFormat.yMMMd().format(dateRange.start)} | ${DateFormat.yMMMd().format(dateRange.end)} ',
        style: const TextStyle(fontSize: 16, color: UIData.secondaryColor),
      ),
    );
  }

  //widget to get the time button
  Widget timeButton(String name, DateTime time) {
    return AbsorbPointer(
        absorbing: switchVals['All Day'],
        child: ListTile(
          onTap: () {
            _selectTime(context, name, TimeOfDay.fromDateTime(time));
          },
          leading: Text(
            name,
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
          trailing: Text(
            TimeOfDay.fromDateTime(time).format(context),
            style: TextStyle(
                color: !switchVals['All Day']
                    ? UIData.secondaryColor
                    : Colors.grey),
          ),
        ));
  }

  //widget to add the event
  Widget addEventFab() {
    return FloatingActionButton(
      backgroundColor: UIData.secondaryColor,
      onPressed: () async {
        if (titleController.text.isEmpty ||
            descriptionController.text.isEmpty ||
            locationController.text.isEmpty) {
          if (titleController.text.isEmpty) {
            setState(() {
              _validateTitle = true;
            });
          }
          if (descriptionController.text.isEmpty) {
            setState(() {
              _validateDescription = true;
            });
          }
          if (locationController.text.isEmpty) {
            setState(() {
              _validateLocation = true;
            });
          }
          Fluttertoast.showToast(
              msg: 'Fill in the empty fields',
              backgroundColor: Colors.grey[500]);
        } else {
          showProgress(context, 'Creating New Event . . .',
              isDismissible: false);
          await createEvent();
          hideProgress();
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const Events()),
              (route) => false);
        }
      },
      child: const Icon(
        Icons.check,
        color: Colors.white,
      ),
    );
  }

  Widget inputField(String name, TextEditingController controller) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: TextField(
          maxLines: name == 'Description' ? null : 1,
          controller: controller,
          decoration: InputDecoration(
              errorText: name == 'Title'
                  ? _validateTitle
                      ? "Field Can't Be Empty"
                      : null
                  : name == 'Description'
                      ? _validateDescription
                          ? "Field Can't Be Empty"
                          : null
                      : name == 'Location'
                          ? _validateLocation
                              ? "Field Can't Be Empty"
                              : null
                          : null,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(color: Colors.teal)),
              hintText: name),
        ));
  }

  Widget switchTile(String name) {
    return SwitchListTile(
        activeColor: UIData.secondaryColor,
        value: switchVals[name],
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
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
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
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
          icon: const Icon(Icons.arrow_drop_down),
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
