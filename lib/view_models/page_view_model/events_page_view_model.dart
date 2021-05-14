import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:talawa/enums/viewstate.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/services/queries_.dart';
import 'package:talawa/utils/api_functions.dart';
import 'package:talawa/utils/custom_toast.dart';
import 'package:talawa/utils/timer.dart';
import 'package:talawa/views/pages/events/add_task_dialog.dart';
import 'package:talawa/views/pages/events/edit_event_dialog.dart';
import 'package:talawa/views/widgets/show_progress.dart';

import '../base_model.dart';

class EventPageViewModel extends BaseModel {
  final Preferences _preferences = Preferences();
  final ApiFunctions _apiFunctions = ApiFunctions();
  String _userID = "", orgID = "", _dateSelected = 'Today';
  List _eventList = [], _displayEvents = [];
  Timer timer = Timer();

  List get eventList => _eventList;
  List get displayEvents => _displayEvents;
  String get dateSelected => _dateSelected;

  setDisplayEvents(List events) {
    _displayEvents = events;
    notifyListeners();
  }

  setEventList(List events) {
    _eventList = events;
    notifyListeners();
  }

  setDateSelect(String date) {
    _dateSelected = date;
    notifyListeners();
  }

  initialize() {
    getEvents();
  }

  bool get isCurrOrgNull {
    return orgID.isEmpty;
  }

  Future<void> getEvents() async {
    setState(ViewState.busy);

    final String _currentOrgID = await _preferences.getCurrentOrgId();
    orgID = _currentOrgID;
    final Map result =
        await _apiFunctions.gqlquery(Queries().fetchOrgEvents(_currentOrgID));
    _eventList =
        result == null ? [] : (result['events'] as List).reversed.toList();
    _eventList.removeWhere((element) =>
        element['title'] == 'Talawa Congress' ||
        element['title'] == 'test' ||
        element['title'] == 'Talawa Conference Test' ||
        element['title'] == 'mayhem' ||
        element['title'] == 'mayhem1' ||
        element['organization']['_id'] !=
            _currentOrgID); //dont know who keeps adding these
    // This removes all invalid date formats other than Unix time
    _eventList.removeWhere(
        (element) => int.tryParse(element['startTime'] as String) == null);
    _eventList.sort((a, b) {
      return DateTime.fromMicrosecondsSinceEpoch(
              int.parse(a['startTime'] as String))
          .compareTo(DateTime.fromMicrosecondsSinceEpoch(
              int.parse(b['startTime'] as String)));
    });
    eventsToDates(_eventList, DateTime.now());
    setDisplayEvents(_eventList);
    _userID = await _preferences.getUserId();
    // notifyListeners();
    setState(ViewState.idle);
  }

  Map eventsToDates(List events, DateTime now) {
    final Map<DateTime, List<dynamic>> eventDates = {};
    addDateToMap(DateTime date, Map event) {
      if (eventDates[date] == null) {
        eventDates[date] = [event];
      } else {
        eventDates[date].add(event);
      }
    }

    for (final event in events) {
      if (!(event['recurring'] as bool)) {
        addDateToMap(
            DateTime.fromMicrosecondsSinceEpoch(
                int.parse(event['startTime'].toString())),
            event as Map);
      } else {
        if (event['recurrance'] == 'DAILY') {
          int day = DateTime.fromMicrosecondsSinceEpoch(
                  int.parse(event['startTime'].toString()))
              .day;
          final int lastday = DateTime.fromMicrosecondsSinceEpoch(
                  int.parse(event['endTime'].toString()))
              .day;
          while (day <= lastday) {
            addDateToMap(DateTime(now.year, now.month, day), event as Map);
            day += 1;
          }
        }
        if (event['recurrance'] == 'WEEKLY') {
          int day = DateTime.fromMicrosecondsSinceEpoch(
                  int.parse(event['startTime'].toString()))
              .day;
          final int lastday = DateTime.fromMicrosecondsSinceEpoch(
                  int.parse(event['endTime'].toString()))
              .day;
          while (day <= lastday) {
            addDateToMap(DateTime(now.year, now.month, day), event as Map);

            day += 7;
          }
        }
        if (event['recurrance'] == 'MONTHLY') {
          final DateTime firstDate = DateTime.fromMicrosecondsSinceEpoch(
              int.parse(event['startTime'].toString()));
          addDateToMap(
              DateTime(now.year, now.month, firstDate.day), event as Map);
        }
        if (event['recurrance'] == 'YEARLY') {
          final DateTime firstDate = DateTime.fromMicrosecondsSinceEpoch(
              int.parse(event['startTime'].toString()));
          if (now.month == firstDate.month) {
            addDateToMap(
                DateTime(now.year, now.month, firstDate.day), event as Map);
          }
        }
      }
    }
    return eventDates;
  }

  //get all events for a given day
  //account for recurring events
  List filterEventsByDay(DateTime currentDate, List events) {
    final List currentevents = [];

    for (final event in events) {
      final DateTime startTime = DateTime.fromMicrosecondsSinceEpoch(
          int.parse(event['startTime'].toString()));
      final DateTime endTime = DateTime.fromMicrosecondsSinceEpoch(
          int.parse(event['endTime'].toString()));
      if (!(event['recurring'] as bool) &&
          timer.isSameDay(currentDate, startTime)) {
        currentevents.add(event);
      }
      if ((event['recurrance'] == 'DAILY') &&
          timer.liesBetween(currentDate, startTime, endTime)) {
        currentevents.add(event);
      } else if (event['recurrance'] == 'WEEKLY' &&
          timer.isSameWeekDay(currentDate, startTime)) {
        currentevents.add(event);
      } else if (event['recurrance'] == 'MONTHLY' &&
          currentDate.day == startTime.day) {
        currentevents.add(event);
      } else if (event['recurrance'] == 'YEARLY' &&
          currentDate.month == startTime.month &&
          currentDate.day == startTime.day) {
        currentevents.add(event);
      }
    }
    return currentevents;
  }

  //function called to delete the event
  Future<void> deleteEvent(BuildContext context, String eventId) async {
    showProgress(context, 'Deleting Event . . .', isDismissible: false);
    final String mutation = Queries().deleteEvent(eventId);
    final Map result = await _apiFunctions.gqlquery(mutation);
    if (result["exception"] != null) {
      CustomToast.exceptionToast(
          msg: "Could not delete event! Please try again later");
    }
    await getEvents();
    hideProgress();
  }

  //function to called be called for register
  Future<void> register(BuildContext context, String eventId) async {
    final Map result = await Queries().registerForEvent(eventId) as Map;
    print(result);
  }

  //functions to edit the event
  Future<void> editEvent(BuildContext context, Map event) async {
    if (event['creator']['_id'] != _userID) {
      Fluttertoast.showToast(msg: "You cannot edit events you didn't create");
    } else {
      pushNewScreen(context,
          withNavBar: true,
          screen: EditEvent(
            event: event,
          ));
    }
  }

  Future<void> addEventTask(BuildContext context, String eventId) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddEventTask(
          eventId: eventId,
        );
      },
    );
  }
}
