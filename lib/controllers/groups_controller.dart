import 'package:flutter/cupertino.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/services/queries_.dart';
import 'package:talawa/utils/api_functions.dart';

class GroupController with ChangeNotifier {
  Preferences preferences = Preferences();
  ApiFunctions apiFunctions = ApiFunctions();
  List _eventList = [];
  List _displayedEvents = [];
  bool fetched = true;

  //variable for organization Id
  String _currOrgId;

  //Exception string
  String exception;

  //Getter for displayed events
  List get displayedEvents {
    return [..._displayedEvents];
  }

  //Getter for empty displayedEvents
  bool get isEventsEmpty {
    return _displayedEvents.isEmpty;
  }

  //Getter to return null org
  bool get isCurrOrgIdNull {
    return _currOrgId == null;
  }

  //Getter for error which might occured during fetching posts
  bool get isErrorOccurred {
    return exception != null;
  }

  bool get isScreenEmpty {
    return _currOrgId == null || _eventList.isEmpty;
  }

  List get getDisplayedEvents {
    return _eventList;
  }

  bool get isDataFetched {
    return fetched;
  }

  // Function to get the events
  Future<void> getEventsOnInitialise() async {
    final bool isOrgIdChanged =
        (await preferences.getCurrentOrgId()) == _currOrgId;
    if (_eventList.isNotEmpty && isOrgIdChanged) {
      return;
    }

    await getEvents();
  }

  //function to get the events
  Future<void> getEvents() async {
    final String currentOrgID = await preferences.getCurrentOrgId();
    _currOrgId = currentOrgID;
    if (_currOrgId != null) {
      final Map result =
          await apiFunctions.gqlquery(Queries().fetchOrgEvents(currentOrgID));
      if (result['exception'] != null) {
        exception = result['exception'] as String;
      } else {
        _eventList = result == null
            ? []
            : result['events'].reversed.toList() as List<dynamic>;
        _eventList.removeWhere((element) =>
            element['title'] == 'Talawa Congress' ||
            element['title'] == 'test' ||
            element['title'] == 'Talawa Conference Test' ||
            element['title'] == 'mayhem' ||
            element['title'] == 'mayhem1' ||
            element['isRegistered'] == false ||
            element['organization']['_id'] !=
                currentOrgID); //dont know who keeps adding these
        // This removes all invalid date formats other than Unix time
        _eventList.removeWhere(
            (element) => int.tryParse(element['startTime'] as String) == null);
        _eventList.sort((a, b) {
          return DateTime.fromMicrosecondsSinceEpoch(
                  int.parse(a['startTime'] as String))
              .compareTo(DateTime.fromMicrosecondsSinceEpoch(
                  int.parse(b['startTime'] as String)));
        });
        // eventsToDates(_eventList, DateTime.now());
        _displayedEvents = _eventList;
        print(_displayedEvents);
        notifyListeners();
      }
    }
  }
}
