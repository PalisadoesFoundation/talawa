import 'dart:async';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/event_model.dart';

import 'package:talawa/models/events/event_volunteer_group.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/event_queries.dart';

/// EventService class provides different services in the context of Event.
///
/// Services include:
/// * `setOrgStreamSubscription` : to set organization stream subscription for user.
/// * `getEvents` : to get all events of the organization.
/// * `fetchAttendeesByEvent` : to fetch all attendees of an event.
/// * `registerForAnEvent` : to register for an event.
/// * `deleteEvent` : to delete an event.
/// * `editEvent` : to edit the event.
/// * `fetchEventVolunteers` : to fetch all volunteers of an event.
/// * `createVolunteerGroup` : to create a volunteer group.
/// * `addVolunteerToGroup` : to add a volunteer to a group.
/// * `dispose` : to cancel the stream subscription of an organization.
class EventService {
  EventService() {
    _eventStream = _eventStreamController.stream.asBroadcastStream();
    print(_eventStream);
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

  /// This function is used to create an event using a GraphQL mutation.
  ///
  /// **params**:
  /// * `variables`: A map of key-value pairs representing the variables required for the GraphQL mutation.
  ///
  /// **returns**:
  /// * `Future<QueryResult<Object?>>`: which contains the result of the GraphQL mutation.
  Future<QueryResult<Object?>> createEvent({
    required Map<String, dynamic> variables,
  }) async {
    final result = await databaseFunctions.gqlAuthMutation(
      EventQueries().addEvent(),
      variables: variables,
    );
    return result;
  }

  /// This function is used to fetch all the events of an organization.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> getEvents() async {
    // get current organization id
    final String currentOrgID = _currentOrg.id!;
    // mutation to fetch the events
    final String mutation = EventQueries().fetchOrgEvents(currentOrgID);
    final result = await _dbFunctions.gqlAuthMutation(mutation);

    if (result.data == null) return;

    final List eventsJson =
        result.data!["eventsByOrganizationConnection"] as List;
    eventsJson.forEach((eventJsonData) {
      final Event event = Event.fromJson(eventJsonData as Map<String, dynamic>);
      event.isRegistered = event.attendees?.any(
            (attendee) => attendee.id == _userConfig.currentUser.id,
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
  Future<dynamic> fetchAttendeesByEvent(String eventId) async {
    final result = await _dbFunctions.gqlAuthQuery(
      EventQueries().attendeesByEvent(eventId),
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
  /// * `Future<QueryResult<Object?>>`: Information about the event deletion
  Future<QueryResult<Object?>> deleteEvent(String eventId) async {
    final result = await _dbFunctions.gqlAuthMutation(
      EventQueries().deleteEvent(eventId),
    );
    return result;
  }

  /// This function is used to edit an event.
  ///
  /// **params**:
  /// * `eventId`: id of an event
  /// * `variables`: this will be `map` type and contain all the event details need to be update.
  ///
  /// **returns**:
  /// * `Future<QueryResult<Object?>>`: Information about the event deletion.
  Future<QueryResult<Object?>> editEvent({
    required String eventId,
    required Map<String, dynamic> variables,
  }) async {
    final result = await _dbFunctions.gqlAuthMutation(
      EventQueries().updateEvent(eventId: eventId),
      variables: variables,
    );

    return result;
  }

  /// This function is used to create a volunteer group.
  ///
  /// **params**:
  /// * `variables`: this will be `map` type and contain all the volunteer group details need to be created.
  ///
  /// **returns**:
  /// * `Future<dynamic>`: Information about the created volunteer group.
  Future<dynamic> createVolunteerGroup(Map<String, dynamic> variables) async {
    final result = await _dbFunctions.gqlAuthMutation(
      EventQueries().createVolunteerGroup(),
      variables: {'data': variables},
    );
    return result;
  }

  /// This function is used to remove a volunteer group.
  ///
  /// **params**:
  /// * `variables`: This will be a `map` type and contain the ID of the volunteer group to be deleted.
  ///
  /// **returns**:
  /// * `Future<dynamic>`: Information about the removed volunteer group.
  Future<dynamic> removeVolunteerGroup(Map<String, dynamic> variables) async {
    final result = await _dbFunctions.gqlAuthMutation(
      EventQueries().removeEventVolunteerGroup(),
      variables: variables,
    );
    return result;
  }

  /// This function is used to add a volunteer to a group.
  ///
  /// **params**:
  /// * `variables`: this will be `map` type and contain all the details needed to add a volunteer to a group.
  ///
  /// **returns**:
  /// * `Future<dynamic>`: Information about the added volunteer.
  Future<dynamic> addVolunteerToGroup(Map<String, dynamic> variables) async {
    final result = await _dbFunctions.gqlAuthMutation(
      EventQueries().addVolunteerToGroup(),
      variables: {'data': variables},
    );
    return result;
  }

  /// This function is used to remove a volunteer from a group.
  ///
  /// **params**:
  /// * `variables`: this will be `map` type and contain the ID of the volunteer to be removed.
  ///
  /// **returns**:
  /// * `Future<dynamic>`: Information about the removed volunteer.
  Future<dynamic> removeVolunteerFromGroup(
    Map<String, dynamic> variables,
  ) async {
    final result = await _dbFunctions.gqlAuthMutation(
      EventQueries().removeVolunteerMutation(),
      variables: variables,
    );
    return result;
  }

  /// This function is used to update the information of a volunteer group.
  ///
  /// **params**:
  /// * `variables`: This is a `Map<String, dynamic>` type that contains the ID of the volunteer group to be updated and the fields to be updated.
  ///
  /// **returns**:
  /// * `Future<dynamic>`: Information about the updated volunteer group.
  Future<dynamic> updateVolunteerGroup(Map<String, dynamic> variables) async {
    final result = await _dbFunctions.gqlAuthMutation(
      EventQueries().updateVolunteerGroupMutation(),
      variables: variables,
    );
    return result;
  }

  /// This function is used to fetch all volunteer groups for an event.
  ///
  /// **params**:
  /// * `eventId`: Id of the event to fetch volunteer groups.
  ///
  /// **returns**:
  /// * `Future<List<EventVolunteerGroup>>`: returns the list of volunteer groups
  Future<List<EventVolunteerGroup>> fetchVolunteerGroupsByEvent(
    String eventId,
  ) async {
    try {
      final variables = {
        "where": {"eventId": eventId},
      };
      print(1);
      final result = await _dbFunctions.gqlAuthQuery(
        EventQueries().fetchVolunteerGroups(),
        variables: variables,
      );
      print(2);
      final List groupsJson =
          (result as QueryResult).data!['getEventVolunteerGroups'] as List;

      return groupsJson
          .map(
            (groupJson) =>
                EventVolunteerGroup.fromJson(groupJson as Map<String, dynamic>),
          )
          .toList();
    } catch (e) {
      print('Error fetching volunteer groups: $e');
      rethrow;
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
