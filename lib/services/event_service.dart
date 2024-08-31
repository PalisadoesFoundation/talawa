import 'dart:async';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/constants/constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/organization/org_info.dart';
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
/// * `dispose` : to cancel the stream subscription of an organization.
class EventService extends BaseFeedManager<Event> {
  EventService() : super(HiveKeys.eventFeedKey) {
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
  late Stream<List<Event>> _eventStream;

  final StreamController<List<Event>> _eventStreamController =
      StreamController<List<Event>>();

  List<Event> _events = [];

  /// The event stream.
  ///
  /// params:
  /// None
  /// returns:
  /// * `Stream<Event>`: returns the event stream
  Stream<List<Event>> get eventStream => _eventStream;

  @override
  Future<List<Event>> fetchDataFromApi() async {
    // get current organization id
    final String currentOrgID = _currentOrg.id!;
    // mutation to fetch the events
    final String mutation = EventQueries().fetchOrgEvents(currentOrgID);
    final result = await _dbFunctions.gqlAuthMutation(mutation);

    if (result.data == null) {
      throw Exception('unable to fetch data');
    }

    print(result.data!["eventsByOrganizationConnection"]);
    final List<Map<String, dynamic>> eventsJson = result
        .data!["eventsByOrganizationConnection"] as List<Map<String, dynamic>>;
    eventsJson.forEach((eventJsonData) {
      final Event event = Event.fromJson(eventJsonData);
      event.isRegistered = event.attendees?.any(
            (attendee) => attendee.id == _userConfig.currentUser.id,
          ) ??
          false;
      _events.insert(0, event);
    });
    return _events;
  }

  /// Fetches the initial set of events, loading from the cache first, and then refreshing the feed.
  ///
  /// This method loads events from the cache, adds them to the event stream, and then triggers a feed refresh
  /// to fetch the latest events from the API and update the stream accordingly.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> fetchEventsInitial() async {
    _events = await loadCachedData();
    _eventStreamController.add(_events);
    refreshFeed();
  }

  /// Refreshes the event feed by fetching the latest events from the API and updating the event stream.
  ///
  /// This method retrieves the latest events using the `getNewFeedAndRefreshCache` method and adds the new events
  /// to the event stream.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> refreshFeed() async {
    _events = await getNewFeedAndRefreshCache();
    _eventStreamController.add(_events);
  }

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
    final List<Event> newEvents = await getNewFeedAndRefreshCache();
    _eventStreamController.add(newEvents);
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
