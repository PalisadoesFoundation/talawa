import 'dart:async';

import 'package:intl/intl.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/event_queries.dart';

class EventService {
  EventService() {
    _eventStream = _eventStreamController.stream.asBroadcastStream();
    _currentOrg = _userConfig.currentOrg;
    setOrgStreamSubscription();
  }

  final _userConfig = locator<UserConfig>();
  final _dbFunctions = locator<DataBaseMutationFunctions>();

  late OrgInfo _currentOrg;
  late StreamSubscription _currentOrganizationStreamSubscription;
  late Stream<Event> _eventStream;

  final List<Event> _events = [];
  final StreamController<Event> _eventStreamController =
      StreamController<Event>();
  Stream<Event> get eventStream => _eventStream;
  // ignore: prefer_final_fields
  Set<String> _ids = {};

  void setOrgStreamSubscription() {
    _currentOrganizationStreamSubscription =
        _userConfig.currentOrfInfoStream.listen((updatedOrganization) {
      _currentOrg = updatedOrganization;
      _events.clear();
      _ids.clear();
      getEvents();
    });
  }

  Future<void> getEvents() async {
    final String currentOrgID = _currentOrg.id!;
    _dbFunctions.init();
    final String mutation = EventQueries().fetchOrgEvents(currentOrgID);

    final result = await _dbFunctions.gqlAuthMutation(mutation);
    if (result["events"] == null) return;
    final List eventsJson = result["events"] as List;
    eventsJson.forEach((eventJsonData) {
      final Event event = Event.fromJson(eventJsonData as Map<String, dynamic>);
      if (!_ids.contains(event.id)) {
        _ids.add(event.id!);
        _events.add(event);
      }
    });

    _events.removeWhere(
      (element) =>
          int.tryParse(element.startTime!) == null ||
          int.tryParse(element.endTime!) == null ||
          element.organization!.id != _currentOrg.id,
    );
    _events.sort((a, b) {
      return DateTime.fromMicrosecondsSinceEpoch(int.parse(a.startTime!))
          .compareTo(
              DateTime.fromMicrosecondsSinceEpoch(int.parse(b.startTime!)));
    });
    _parseEventDateTime();

    _events.forEach((element) {
      _eventStreamController.add(element);
    });
  }

  void _parseEventDateTime() {
    _events.forEach((element) {
      final DateTime _startDate =
          DateTime.fromMicrosecondsSinceEpoch(int.parse(element.startTime!))
              .toLocal();
      final DateTime _endDate =
          DateTime.fromMicrosecondsSinceEpoch(int.parse(element.endTime!))
              .toLocal();
      element.startDate = DateFormat('yMd').format(_startDate);
      element.endDate = DateFormat('yMd').format(_endDate);
      element.startTime = DateFormat.jm().format(_startDate);
      element.endTime = DateFormat.jm().format(_endDate);
    });
  }

  void dispose() {
    _currentOrganizationStreamSubscription.cancel();
  }
}
