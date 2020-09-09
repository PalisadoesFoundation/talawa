import 'package:flutter/material.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/apiFuctions.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:intl/intl.dart';

class EditEvent extends StatefulWidget {
  Map event;
  EditEvent({Key key, @required this.event}) : super(key: key);

  @override
  _EditEventState createState() => _EditEventState();
}

class _EditEventState extends State<EditEvent> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final locationController = TextEditingController();

  DateTimeRange dateRange = DateTimeRange(
      start: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 1, 0),
      end: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day + 1, 1, 0));

  Map<String, DateTime> startEndTimes = {
    'Start Time': DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 12, 0),
    'End Time': DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 23, 59),
  };

  Map event;
  Map switchVals = {
    'Make Public': true,
    'Make Registerable': true,
    'Recurring': true,
    'All Day': false
  };

  var recurranceList = ['DAILY', 'WEEKLY', 'MONTHLY', 'YEARLY'];
  String recurrance = 'DAILY';
  Preferences preferences = Preferences();
  String currentOrgId;

  void initState() {
    super.initState();
    getCurrentOrgId();
    print(widget.event);
    initevent();
  }

  initevent() {
    setState(() {
      titleController.text = widget.event['title'];
      descriptionController.text = widget.event['description'];
      switchVals = {
        'Make Public': widget.event['isPublic'],
        'Make Registerable': widget.event['isRegisterable'],
        'Recurring': widget.event['recurring'],
        'All Day': widget.event['allDay']
      };
      recurrance = widget.event['recurrance'];
    });
  }

  getCurrentOrgId() async {
    final orgId = await preferences.getCurrentOrgId();
    setState(() {
      currentOrgId = orgId;
    });
    print(currentOrgId);
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime now = DateTime.now();
    final DateTimeRange picked = await showDateRangePicker(
        context: context,
        // initialDate: selectedDate,
        firstDate: DateTime(now.year, now.month, now.day),
        lastDate: DateTime(2101));
    if (picked != null && picked != dateRange)
      setState(() {
        dateRange = picked;
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
            picked.minute);
      });
  }

  Future<void> createEvent() async {
    final String currentOrgID = await preferences.getCurrentOrgId();

    DateTime startTime = DateTime(
        dateRange.start.year,
        dateRange.start.month,
        dateRange.start.day,
        startEndTimes['End Time'].hour,
        startEndTimes['End Time'].minute);
    DateTime endTime = DateTime(
        dateRange.start.year,
        dateRange.start.month,
        dateRange.start.day,
        startEndTimes['Start Time'].hour,
        startEndTimes['Start Time'].minute);

    if (switchVals['All Day']) {
      startEndTimes = {
        'Start Time': DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 12, 0),
        'End Time': DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 23, 59),
      };
    }

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
      startDate: DateFormat('MM/dd/yyyy').format(dateRange.start).toString(),
      endDate: DateFormat('MM/dd/yyyy').format(dateRange.end).toString(),
      startTime: DateFormat.jm().format(startTime),
      endTime: DateFormat.jm().format(endTime).toString(),
    );
    ApiFunctions apiFunctions = ApiFunctions();
    Map result = await apiFunctions.gqlmutation(mutation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Event',
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
        '${DateFormat.yMMMd().format(dateRange.start)} | ${DateFormat.yMMMd().format(dateRange.end)} ',
        style: TextStyle(fontSize: 16, color: UIData.secondaryColor),
      ),
    );
  }

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
}
