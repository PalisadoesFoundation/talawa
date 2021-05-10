import 'package:flutter/material.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/services/queries_.dart';
import 'package:talawa/utils/api_functions.dart';

class GroupController with ChangeNotifier {
  bool fetched = true;
  List eventList = [];
  String _currOrgId;
  Preferences preferences = Preferences();
  ApiFunctions apiFunctions = ApiFunctions();

  String get getCurrOrgId {
    return _currOrgId;
  }

  bool get isScreenEmpty {
    return _currOrgId == null || eventList.isEmpty;
  }

  List get getDisplayedEvents {
    return eventList;
  }

  bool get isDataFetched {
    return fetched;
  }

  // Function to get the events
  Future<void> getEventsOnInitialise() async {
    final bool isOrgIdChanged =
        (await preferences.getCurrentOrgId()) == _currOrgId;
    if (eventList.isNotEmpty && isOrgIdChanged) {
      return;
    }

    await getEvents();
  }

  // Function to get the events
  Future<void> getEvents() async {
    fetched = false;
    final String currentOrgID = await preferences.getCurrentOrgId();
    _currOrgId = currentOrgID;

    final Map result = await apiFunctions.gqlquery(
      Queries().fetchOrgEvents(currentOrgID),
    );

    eventList = result == null
        ? []
        : result['events'].reversed.toList() as List<dynamic>;
    print(eventList);
    eventList.removeWhere(
      (element) =>
          element['title'] == 'Talawa Congress' ||
          element['title'] == 'test' ||
          element['title'] == 'Talawa Conference Test' ||
          element['title'] == 'mayhem' ||
          element['title'] == 'mayhem1' ||
          element['isRegistered'] == false ||
          element['organization']['_id'] != currentOrgID,
    ); //dont know who keeps adding these
    // This removes all invalid date formats other than Unix time
    print(eventList);
    eventList.removeWhere(
        (element) => int.tryParse(element['startTime'] as String) == null);
    eventList.sort(
      (a, b) {
        return DateTime.fromMicrosecondsSinceEpoch(
          int.parse(a['startTime'] as String),
        ).compareTo(
          DateTime.fromMicrosecondsSinceEpoch(
            int.parse(b['startTime'] as String),
          ),
        );
      },
    );
    fetched = true;
    notifyListeners();
  }
}
