//flutter packages are called here
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:talawa/model/events.dart';
import 'package:talawa/services/app_localization.dart';
import 'package:talawa/services/queries_.dart';

//pages are called here
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/api_functions.dart';
import 'package:talawa/utils/custom_toast.dart';
import 'package:talawa/utils/ui_scaling.dart';
import 'package:intl/intl.dart';
import 'package:talawa/views/pages/events/events.dart';
import 'package:talawa/views/widgets/show_progress.dart';
import 'package:talawa/views/widgets/event_widgets.dart';
import 'package:talawa/enums/event_recurrance.dart';

// ignore: must_be_immutable
class EditEvent extends StatefulWidget {
  EditEvent({Key key, @required this.event}) : super(key: key);
  EventsModel event;

  @override
  _EditEventState createState() => _EditEventState();
}

class _EditEventState extends State<EditEvent> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final locationController = TextEditingController();
  bool _validateTitle = false,
      _validateDescription = false,
      _validateLocation = false;
  ApiFunctions apiFunctions = ApiFunctions();

  DateTimeRange dateRange = DateTimeRange(
    start: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 1, 0),
    end: DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day + 1, 1, 0),
  );

  Map<String, DateTime> startEndTimes = {
    'Start Time': DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 12, 0),
    'End Time': DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 23, 59),
  };

  Map event;
  Map<String, bool> switchVals = {
    'Make Public': true,
    'Make Registerable': true,
    'Recurring': true,
    'All Day': false,
  };

  var recurranceList = ['DAILY', 'WEEKLY', 'MONTHLY', 'YEARLY'];
  String recurrance = 'DAILY';
  Preferences preferences = Preferences();
  final EventWidgets _eventWidgets = EventWidgets();
  String currentOrgId;

  @override
  void initState() {
    super.initState();
    getCurrentOrgId();
    debugPrint(widget.event.toString());
    initevent();
  }

  initevent() {
    setState(() {
      titleController.text = widget.event.title;
      descriptionController.text = widget.event.description;
      locationController.text = widget.event.location;
      switchVals = {
        'Make Public': widget.event.isPublic,
        'Make Registerable': widget.event.isRegisterable,
        'Recurring': widget.event.recurring,
        'All Day': widget.event.allDay,
      };
      recurrance = recurranceValues.reverse[widget.event.recurrance];
    });
  }

  //getting current organization id
  getCurrentOrgId() async {
    final orgId = await preferences.getCurrentOrgId();
    setState(() {
      currentOrgId = orgId;
    });
    debugPrint(currentOrgId);
  }

  //method called to select the date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTimeRange picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(now.year, now.month, now.day),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != dateRange) {
      setState(() {
        dateRange = picked;
      });
    }
  }

  //method to select the time
  Future<void> _selectTime(
      BuildContext context, String name, TimeOfDay time) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: time);
    if (picked != null && picked != time) {
      setState(() {
        startEndTimes[name] = DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          picked.hour,
          picked.minute,
        );
      });
    }
  }

  //method used to create and event
  Future<void> updateEvent() async {
    final DateTime startTime = DateTime(
      dateRange.start.year,
      dateRange.start.month,
      dateRange.start.day,
      startEndTimes['Start Time'].hour,
      startEndTimes['Start Time'].minute,
    );
    final DateTime endTime = DateTime(
      dateRange.end.year,
      dateRange.end.month,
      dateRange.end.day,
      startEndTimes['End Time'].hour,
      startEndTimes['End Time'].minute,
    );

    if (switchVals['All Day']) {
      startEndTimes = {
        'Start Time': DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 12, 0),
        'End Time': DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 23, 59),
      };
    }
    final String mutation = Queries().updateEvent(
      eventId: widget.event.id,
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
    final Map result = await apiFunctions.gqlquery(mutation);
    if (result["exception"] != null) {
      CustomToast.exceptionToast(
        msg: AppLocalizations.of(context)
            .translate("Could not update event! Please try again later"),
      );
    }
    debugPrint('Result is : $result');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).translate('Edit Event'),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(bottom: SizeConfig.safeBlockVertical * 12.5),
        children: <Widget>[
          inputField('Title', titleController),
          inputField('Description', descriptionController),
          inputField('Location', locationController),
          switchTile('Make Public'),
          switchTile('Make Registerable'),
          switchTile('Recurring'),
          switchTile('All Day'),
          _eventWidgets.recurrenceDropdown(
            recurringSwitchVal: switchVals['Recurring'],
            recurrance: recurrance,
            context: context,
            recurranceList: recurranceList,
            onChanged: (String newValue) {
              setState(() {
                recurrance = newValue;
              });
            },
          ),
          //widget for the date buttons
          _eventWidgets.dateButton(
            context: context,
            dateText:
                '${DateFormat.yMMMd().format(dateRange.start)} | ${DateFormat.yMMMd().format(dateRange.end)} ',
            onTap: () {
              _selectDate(context);
            },
          ),
          timeButton('Start Time', startEndTimes['Start Time']),
          timeButton('End Time', startEndTimes['End Time']),
        ],
      ),
      //widget to add the event
      floatingActionButton: _eventWidgets.addEventFab(
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
              msg: AppLocalizations.of(context)
                  .translate('Fill in the empty fields'),
              backgroundColor: Colors.grey[500],
            );
          } else {
            try {
              showProgress(context,
                  '${AppLocalizations.of(context).translate("Updating Event Details")} . . .',
                  isDismissible: false);
              await updateEvent();
            } catch (e) {
              if (e == "User cannot delete event they didn't create") {
                Fluttertoast.showToast(
                  msg: AppLocalizations.of(context)
                      .translate("You can't edit events you didn't create"),
                  backgroundColor: Colors.grey[500],
                );
              }
            }
            hideProgress();
            debugPrint('EDITING DONE');
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const Events(),
              ),
              (route) => false,
            );
          }
        },
      ),
    );
  }

  //widget for time buttons
  Widget timeButton(String name, DateTime time) {
    return _eventWidgets.timeButton(
      name: name,
      allDaySwitchVal: switchVals['All Day'],
      timeText: TimeOfDay.fromDateTime(time).format(context),
      onTap: () {
        _selectTime(context, name, TimeOfDay.fromDateTime(time));
      },
      context: context,
    );
  }

  //widget for the input field
  Widget inputField(String name, TextEditingController controller) {
    return _eventWidgets.inputField(
      name: name,
      controller: controller,
      context: context,
      errorText: name == 'Title'
          ? _validateTitle
              ? AppLocalizations.of(context).translate("Field Can't Be Empty")
              : null
          : name == 'Description'
              ? _validateDescription
                  ? AppLocalizations.of(context)
                      .translate("Field Can't Be Empty")
                  : null
              : name == 'Location'
                  ? _validateLocation
                      ? AppLocalizations.of(context)
                          .translate("Field Can't Be Empty")
                      : null
                  : null,
    );
  }

  Widget switchTile(String name) {
    return _eventWidgets.switchTile(
      name: name,
      context: context,
      switchValue: switchVals[name],
      onChanged: (val) {
        setState(() {
          switchVals[name] = val;
        });
      },
    );
  }
}
