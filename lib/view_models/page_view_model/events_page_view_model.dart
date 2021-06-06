import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:talawa/enums/event_recurrance.dart';
import 'package:talawa/enums/viewstate.dart';
import 'package:talawa/model/events.dart';
import 'package:talawa/services/app_localization.dart';
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
  List<EventsModel> _eventList = [], _displayEvents = [];
  Timer timer = Timer();

  List<EventsModel> get eventList => _eventList;
  List<EventsModel> get displayEvents => _displayEvents;
  String get dateSelected => _dateSelected;
  String get userID => _userID;

  setDisplayEvents(List<EventsModel> events) {
    _displayEvents = events;
    notifyListeners();
  }

  setEventList(List<EventsModel> events) {
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
    _eventList = result == null
        ? []
        : eventsModelFromJson(
            jsonEncode((result['events'] as List).reversed.toList()));
    _eventList.removeWhere((element) =>
        element.title == 'Talawa Congress' ||
        element.title == 'test' ||
        element.title == 'Talawa Conference Test' ||
        element.title == 'mayhem' ||
        element.title == 'mayhem1' ||
        element.organization.id !=
            _currentOrgID); //dont know who keeps adding these
    // This removes all invalid date formats other than Unix time
    _eventList
        .removeWhere((element) => int.tryParse(element.startTime) == null);
    _eventList.sort((a, b) {
      return DateTime.fromMicrosecondsSinceEpoch(int.parse(a.startTime))
          .compareTo(
              DateTime.fromMicrosecondsSinceEpoch(int.parse(b.startTime)));
    });
    eventsToDates(_eventList, DateTime.now());
    setDisplayEvents(_eventList);
    _userID = await _preferences.getUserId();
    // notifyListeners();
    setState(ViewState.idle);
  }

  Map<DateTime, List<EventsModel>> eventsToDates(
      List<EventsModel> events, DateTime now) {
    final Map<DateTime, List<EventsModel>> eventDates = {};
    addDateToMap(DateTime date, EventsModel event) {
      if (eventDates[date] == null) {
        eventDates[date] = [];
        eventDates[date].add(event);
      } else {
        eventDates[date].add(event);
      }
    }

    for (final event in events) {
      if (!event.recurring) {
        addDateToMap(
            DateTime.fromMicrosecondsSinceEpoch(int.parse(event.startTime)),
            event);
      } else {
        if (event.recurrance == Recurrance.daily) {
          int day =
              DateTime.fromMicrosecondsSinceEpoch(int.parse(event.startTime))
                  .day;
          final int lastday =
              DateTime.fromMicrosecondsSinceEpoch(int.parse(event.endTime)).day;
          while (day <= lastday) {
            addDateToMap(DateTime(now.year, now.month, day), event);
            day += 1;
          }
        }
        if (event.recurrance == Recurrance.weekly) {
          int day =
              DateTime.fromMicrosecondsSinceEpoch(int.parse(event.startTime))
                  .day;
          final int lastday =
              DateTime.fromMicrosecondsSinceEpoch(int.parse(event.endTime)).day;
          while (day <= lastday) {
            addDateToMap(DateTime(now.year, now.month, day), event);

            day += 7;
          }
        }
        if (event.recurrance == Recurrance.monthly) {
          final DateTime firstDate =
              DateTime.fromMicrosecondsSinceEpoch(int.parse(event.startTime));
          addDateToMap(DateTime(now.year, now.month, firstDate.day), event);
        }
        if (event.recurrance == Recurrance.yearly) {
          final DateTime firstDate =
              DateTime.fromMicrosecondsSinceEpoch(int.parse(event.startTime));
          if (now.month == firstDate.month) {
            addDateToMap(DateTime(now.year, now.month, firstDate.day), event);
          }
        }
      }
    }
    return eventDates;
  }

  //get all events for a given day
  //account for recurring events
  List<EventsModel> filterEventsByDay(
      DateTime currentDate, List<EventsModel> events) {
    final List<EventsModel> currentevents = [];

    for (final event in events) {
      final DateTime startTime =
          DateTime.fromMicrosecondsSinceEpoch(int.parse(event.startTime));
      final DateTime endTime =
          DateTime.fromMicrosecondsSinceEpoch(int.parse(event.endTime));
      if (!event.recurring && timer.isSameDay(currentDate, startTime)) {
        currentevents.add(event);
      }
      if ((event.recurrance == Recurrance.daily) &&
          timer.liesBetween(currentDate, startTime, endTime)) {
        currentevents.add(event);
      } else if (event.recurrance == Recurrance.weekly &&
          timer.isSameWeekDay(currentDate, startTime)) {
        currentevents.add(event);
      } else if (event.recurrance == Recurrance.monthly &&
          currentDate.day == startTime.day) {
        currentevents.add(event);
      } else if (event.recurrance == Recurrance.yearly &&
          currentDate.month == startTime.month &&
          currentDate.day == startTime.day) {
        currentevents.add(event);
      }
    }
    return currentevents;
  }

  //function called to delete the event
  Future<void> deleteEvent(BuildContext context, EventsModel event) async {
    if (event.creator.id != _userID) {
      Fluttertoast.showToast(
          msg: AppLocalizations.of(context)
              .translate("You can\'t delete events you didn't create"));
    } else {
      showProgress(context,
          '${AppLocalizations.of(context).translate("Deleting Event")} . . .',
          isDismissible: false);
      final String mutation = Queries().deleteEvent(event.id);
      final Map result = await _apiFunctions.gqlquery(mutation);
      if (result["exception"] != null) {
        CustomToast.exceptionToast(
          msg: AppLocalizations.of(context).translate(
            "Could not delete event! Please try again later",
          ),
        );
      }
      await getEvents();
      hideProgress();
    }
  }

  //function to called be called for register
  Future<void> register(BuildContext context, String eventId) async {
    final Map result = await Queries().registerForEvent(eventId) as Map;
    print(result);
  }

  //functions to edit the event
  Future<void> editEvent(BuildContext context, EventsModel event) async {
    if (event.creator.id != _userID) {
      Fluttertoast.showToast(
        msg: AppLocalizations.of(context).translate(
          "You cannot edit events you didn't create",
        ),
      );
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
