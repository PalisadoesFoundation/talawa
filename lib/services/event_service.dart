import 'dart:async';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/constants/constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/events/event_volunteer_group.dart';
import 'package:talawa/services/caching/base_feed_manager.dart';
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
class EventService extends BaseFeedManager<Event> {
  EventService() : super(HiveKeys.eventFeedKey) {
    _eventStream = _eventStreamController.stream.asBroadcastStream();
    _userConfig.initialiseStream();
  }

  // variables declaration
  final _userConfig = locator<UserConfig>();
  final _dbFunctions = locator<DataBaseMutationFunctions>();

  StreamSubscription? _currentOrganizationStreamSubscription;
  late Stream<List<Event>> _eventStream;

  final StreamController<List<Event>> _eventStreamController =
      StreamController<List<Event>>();

  final List<Event> _events = [];

  /// The event stream.
  ///
  /// params:
  /// None
  /// returns:
  /// * `Stream<Event>`: returns the event stream
  Stream<List<Event>> get eventStream => _eventStream;

  /// Getter for list of events.
  List<Event> get events => _events;

  @override
  Future<List<Event>> fetchDataFromApi({Map<String, dynamic>? params}) async {
    // get current organization id
    final String currentOrgID = _userConfig.currentOrg.id!;
    final Map<String, dynamic> variables = {
      'id': currentOrgID,
      'first': 200,
      'startDate': params?['startDate'] ??
          DateTime.now()
              .subtract(const Duration(days: 30))
              .toUtc()
              .toIso8601String(),
      'endDate': params?['endDate'] ??
          DateTime.now()
              .add(const Duration(days: 30))
              .toUtc()
              .toIso8601String(),
      'includeRecurring': params?['includeRecurring'] ?? true,
    };

    // mutation to fetch the events
    final String query = EventQueries().fetchOrgEvents();
    final result = await _dbFunctions.gqlAuthQuery(query, variables: variables);

    // Check for GraphQL errors or null data
    if (result.hasException || result.data == null) {
      throw Exception('Failed to fetch events: ${result.exception}');
    }

    final org = result.data!['organization'] as Map<String, dynamic>;
    final eventsMap = org['events'] as Map<String, dynamic>;
    final List<Event> newEvents = [];
    for (final edge in eventsMap['edges'] as List) {
      final event = Event.fromJson(
        (edge as Map<String, dynamic>)['node'] as Map<String, dynamic>,
      );
      newEvents.add(event);
    }

    return newEvents;
  }

  /// Fetches new events from the API and refreshes the cache.
  ///
  /// **params**:
  /// * `start`: DateTime representing the start date of the range.
  /// * `end`: DateTime representing the end date of the range.
  /// * `includeRecurring`: Whether to include recurring events (default: true)
  /// * `clearExisting`: Whether to clear existing events before adding new ones (default: false)
  ///
  /// **returns**:
  ///   None
  Future<void> fetchEventsWithDates(
    DateTime start,
    DateTime end, {
    bool includeRecurring = true,
  }) async {
    final newEvents = await getNewFeedAndRefreshCache(
      params: {
        'startDate': start.toUtc().toIso8601String(),
        'endDate': end.toUtc().toIso8601String(),
        'includeRecurring': includeRecurring,
      },
    );

    _events.addAll(
      newEvents.where(
        (newEvent) {
          if (newEvent.id != null) {
            return !_events.any(
              (existingEvent) =>
                  existingEvent.id != null && existingEvent.id == newEvent.id,
            );
          }
          return false;
        },
      ),
    );
    _eventStreamController.add(_events);
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

  /// This function is used to delete an event.
  ///
  /// **params**:
  /// * `event`: ID of the event to delete
  /// * `recurrenceType`: Type of deletion for recurring events:
  ///   - 'standalone' or null: Delete a non-recurring event
  ///   - 'single': Delete a single instance of a recurring event
  ///   - 'series': Delete the entire recurring event series
  ///   - 'thisAndFollowing': Delete this and all following instances
  ///
  /// **returns**:
  /// * `Future<QueryResult<Object?>>`: Information about the event deletion
  Future<QueryResult<Object?>> deleteEvent(
    Event event, {
    String? recurrenceType,
  }) async {
    final Map<String, Map<String, dynamic>> variables = {
      'input': {'id': event.id},
    };

    String query;
    switch (recurrenceType) {
      case 'single':
        query = EventQueries().deleteSingleEventOfRecurring();
        break;
      case 'series':
        variables['input']!["id"] = event.baseEvent?.id;

        query = EventQueries().deleteEntireEventSeriesOfRecurring();
        break;
      case 'thisAndFollowing':
        query = EventQueries().deleteThisAndFollowing();
        break;
      case 'standalone':
      default:
        query = EventQueries().deleteStandaloneEvent();
        break;
    }

    final result =
        await _dbFunctions.gqlAuthMutation(query, variables: variables);

    if (!result.hasException) {
      await clearEvents();
    }
    return result;
  }

  /// This function is used to edit an event.
  ///
  /// **params**:
  /// * `variables`: this will be `map` type and contain all the event details need to be update.
  /// * `recurrenceType`: Type of edit for recurring events:
  ///
  /// **returns**:
  /// * `Future<QueryResult<Object?>>`: Information about the event deletion.
  Future<QueryResult<Object?>> editEvent({
    required Map<String, dynamic> variables,
    String? recurrenceType,
  }) async {
    String query;
    switch (recurrenceType) {
      case 'single':
        query = EventQueries().updateSingleRecurringEventInstance();
        break;
      case 'series':
        query = EventQueries().updateEntireRecurringEventSeries();
        break;
      case 'thisAndFollowing':
        query = EventQueries().updateThisAndFollowingEvents();
        break;
      case 'standalone':
      default:
        query = EventQueries().updateStandaloneEvent();
        break;
    }

    final Map<String, dynamic> inputVariables = {
      'input': {
        ...variables,
      },
    };

    final result = await _dbFunctions.gqlAuthMutation(
      query,
      variables: inputVariables,
    );

    if (!result.hasException) {
      await clearEvents();
    }
    return result;
  }

  /// This function is used to clear all events from the local cache and stream.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> clearEvents() async {
    await clearCache();
    _events.clear();
    _eventStreamController.add(_events);
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
      final result = await _dbFunctions.gqlAuthQuery(
        EventQueries().fetchVolunteerGroups(),
        variables: variables,
      );
      final List groupsJson = result.data!['getEventVolunteerGroups'] as List;

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

  /// This function is used to create an agenda item.
  ///
  /// **params**:
  /// * `orgId`: ID of organisation to fetch categories.
  ///
  /// **returns**:
  /// * `Future<dynamic>`: Information about the created agenda item.
  Future<dynamic> fetchAgendaCategories(String orgId) async {
    final result = await _dbFunctions.gqlAuthMutation(
      EventQueries().fetchAgendaItemCategoriesByOrganization(orgId),
    );
    return result;
  }

  /// This function is used to create an agenda item.
  ///
  /// **params**:
  /// * `variables`: A map of key-value pairs representing the variables required for the GraphQL mutation.
  ///
  /// **returns**:
  /// * `Future<dynamic>`: Information about the created agenda item.
  Future<dynamic> createAgendaItem(Map<String, dynamic> variables) async {
    final result = await _dbFunctions.gqlAuthMutation(
      EventQueries().createAgendaItem(),
      variables: {'input': variables},
    );
    return result;
  }

  /// This function is used to delete an agenda item.
  ///
  /// **params**:
  /// * `variables`: A map of key-value pairs representing the variables required for the GraphQL mutation.
  ///
  /// **returns**:
  /// * `Future<dynamic>`: Information about the deleted agenda item.
  Future<dynamic> deleteAgendaItem(Map<String, dynamic> variables) async {
    final result = await _dbFunctions.gqlAuthMutation(
      EventQueries().deleteAgendaItem(),
      variables: variables,
    );
    return result;
  }

  /// This function is used to update an agenda item.
  ///
  /// **params**:
  /// * `itemId`: Id of agenda item which is to be updated
  /// * `variables`: A map of key-value pairs representing the variables required for the GraphQL mutation.
  ///
  /// **returns**:
  /// * `Future<dynamic>`: Information about the updated agenda item.
  Future<dynamic> updateAgendaItem(
    String itemId,
    Map<String, dynamic> variables,
  ) async {
    final result = await _dbFunctions.gqlAuthMutation(
      EventQueries().updateAgendaItem(),
      variables: {
        'updateAgendaItemId': itemId,
        'input': variables,
      },
    );
    return result;
  }

  /// This function is used to fetch all agenda items for a specific organization.
  ///
  /// **params**:
  /// * `eventId`: ID of the event to fetch agenda items.
  ///
  /// **returns**:
  /// * `Future<dynamic>`: A list of agenda items for the specified organization.
  Future<dynamic> fetchAgendaItems(String eventId) async {
    final result = await _dbFunctions.gqlAuthQuery(
      EventQueries().fetchAgendaItemsByEvent(eventId),
    );
    return result;
  }

  /// This function is used to cancel the stream subscription of an organization.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void dispose() {
    _currentOrganizationStreamSubscription?.cancel();
  }
}
