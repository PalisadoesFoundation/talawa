// ignore_for_file: avoid_dynamic_calls

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/mainscreen_navigation_args.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/event_queries.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';

/// EventService class provides different services in the context of Event.
///
/// Services include:
/// * `setOrgStreamSubscription` : to set organization stream subscription for user.
/// * `getEvents` : to get all events of the organization.
/// * `fetchRegistrantsByEvent` : to fetch all registrants of an event.
/// * `registerForAnEvent` : to register for an event.
/// * `deleteEvent` : to delete an event.
/// * `editEvent` : to edit the event.
/// * `dispose` : to cancel the stream subscription of an organization.
class EventService {
  EventService() {
    _eventStream = _eventStreamController.stream.asBroadcastStream();
    _currentOrg = _userConfig.currentOrg;
    _userConfig.initialiseStream();
    setOrgStreamSubscription();
  }

  // variables declaration
  final _userConfig = locator<UserConfig>();
  final _dbFunctions = locator<DataBaseMutationFunctions>();

  late OrgInfo _currentOrg;
  late StreamSubscription _currentOrganizationStreamSubscription;
  late Stream<Event> _eventStream;

  final StreamController<Event> _eventStreamController =
      StreamController<Event>();

  /// The event stream.
  ///
  /// params:
  /// None
  /// returns:
  /// * `Stream<Event>`: returns the event stream
  Stream<Event> get eventStream => _eventStream;

  /// This function is used to set stream subscription for an organization.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void setOrgStreamSubscription() {
    _currentOrganizationStreamSubscription =
        _userConfig.currentOrgInfoStream.listen((updatedOrganization) {
      _currentOrg = updatedOrganization;
    });
  }

  /// This function is used to fetch all the events of an organization.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Future<void>`: void
  Future<void> getEvents() async {
    // refresh user's access token
    await _dbFunctions.refreshAccessToken(userConfig.currentUser.refreshToken!);
    _dbFunctions.init();

    // get current organization id
    final String currentOrgID = _currentOrg.id!;
    // mutation to fetch the events
    final String mutation = EventQueries().fetchOrgEvents(currentOrgID);
    final result = await _dbFunctions.gqlAuthMutation(mutation);

    if (result == null) return;
    final List eventsJson = result.data!["eventsByOrganization"] as List;
    eventsJson.forEach((eventJsonData) {
      final Event event = Event.fromJson(eventJsonData as Map<String, dynamic>);
      event.isRegistered = event.registrants?.any(
            (registrant) => registrant.id == _userConfig.currentUser.id,
          ) ??
          false;
      _eventStreamController.add(event);
    });
  }

  /// This function is used to fetch all registrants of an event.
  ///
  /// **params**:
  /// * `eventId`: id of an event.
  ///
  /// **returns**:
  /// * `Future<dynamic>`: Information about event registrants.
  Future<dynamic> fetchRegistrantsByEvent(String eventId) async {
    await _dbFunctions.refreshAccessToken(userConfig.currentUser.refreshToken!);
    final result = await _dbFunctions.gqlAuthQuery(
      EventQueries().registrantsByEvent(eventId),
    );
    return result;
  }

  /// This function is used to register user for an event.
  ///
  /// **params**:
  /// * `eventId`: id of an event.
  ///
  /// **returns**:
  /// * `Future<dynamic>`: Information about the event registration.
  Future<dynamic> registerForAnEvent(String eventId) async {
    final tokenResult = await _dbFunctions
        .refreshAccessToken(userConfig.currentUser.refreshToken!);
    debugPrint(tokenResult.toString());
    final Map<String, dynamic> variables = {'eventId': eventId};
    final result = await _dbFunctions.gqlAuthMutation(
      EventQueries().registerForEvent(),
      variables: variables,
    );
    return result;
  }

  /// This function is used to delete the event.
  ///
  /// **params**:
  /// * `eventId`: id of an event
  ///
  /// **returns**:
  /// * `Future<dynamic>`: Information about the event deletion
  Future<dynamic> deleteEvent(String eventId) async {
    navigationService.pushDialog(
      const CustomProgressDialog(key: Key('DeleteEventProgress')),
    );
    final tokenResult = await _dbFunctions
        .refreshAccessToken(userConfig.currentUser.refreshToken!);
    debugPrint(tokenResult.toString());
    final result = await _dbFunctions.gqlAuthMutation(
      EventQueries().deleteEvent(eventId),
    );
    navigationService.pop();
    return result;
  }

  /// This function is used to edit an event.
  ///
  /// **params**:
  /// * `eventId`: id of an event
  /// * `variables`: this will be `map` type and contain all the event details need to be update.
  ///
  /// **returns**:
  /// * `Future<void>`: void return
  Future<void> editEvent({
    required String eventId,
    required Map<String, dynamic> variables,
  }) async {
    navigationService.pushDialog(
      const CustomProgressDialog(
        key: Key('EditEventProgress'),
      ),
    );
    final tokenResult = await _dbFunctions
        .refreshAccessToken(userConfig.currentUser.refreshToken!);
    debugPrint(tokenResult.toString());
    final result = await _dbFunctions.gqlAuthMutation(
      EventQueries().updateEvent(eventId: eventId),
      variables: variables,
    );
    navigationService.pop();
    if (result != null) {
      navigationService.removeAllAndPush(
        Routes.exploreEventsScreen,
        Routes.mainScreen,
        arguments: MainScreenArgs(mainScreenIndex: 0, fromSignUp: false),
      );
    }
  }

  /// This function is used to cancel the stream subscription of an organization.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void dispose() {
    _currentOrganizationStreamSubscription.cancel();
  }
}
