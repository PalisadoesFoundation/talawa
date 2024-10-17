import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/events/event_volunteer_group.dart';
import 'package:talawa/services/event_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';

/// EventInfoViewModel class helps interacting with model to serve view with the event information data.
class EventInfoViewModel extends BaseModel {
  /// ExploreEventsViewModel instance to fetch the event data.
  late ExploreEventsViewModel exploreEventsInstance;

  /// Event instance to store the event data.
  late Event event;

  /// String type variable to store the FAB title.
  late String fabTitle;

  /// List of Attendee type to store the attendees data.
  late List<Attendee> attendees = [];

  late final List<EventVolunteerGroup> _volunteerGroups = [];

  /// List of volunteer groups of an event.
  List<EventVolunteerGroup> get volunteerGroups => _volunteerGroups;

  /// This function initializes the EventInfoViewModel class with the required arguments.
  ///
  /// **params**:
  /// * `args`: A map of arguments required to initialize the EventInfoViewModel class.
  ///
  /// **returns**:
  ///   None
  Future<void> initialize({required Map<String, dynamic> args}) async {
    event = args["event"] as Event;
    exploreEventsInstance =
        args["exploreEventViewModel"] as ExploreEventsViewModel;
    fabTitle = getFabTitle();
    attendees = event.attendees ?? [];
  }

  /// The function allows user to register for an event.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> registerForEvent() async {
    // if event registration is open and user not already registered for the event.
    if (event.isRegisterable == true && event.isRegistered == false) {
      navigationService.pushDialog(
        const CustomProgressDialog(
          key: Key('RegisterEvent'),
        ),
      );

      // use `registerForAnEvent` function provided by `EventService` service.
      final registerResult =
          await locator<EventService>().registerForAnEvent(event.id!);
      if (registerResult != null) {
        event.isRegistered = true;
        final userConfig = locator<UserConfig>();
        attendees.add(
          Attendee(
            id: userConfig.currentUser.id,
            firstName: userConfig.currentUser.firstName,
            lastName: userConfig.currentUser.lastName,
            image: userConfig.currentUser.image,
          ),
        );
      }
      fabTitle = getFabTitle();
      navigationService.pop();
      notifyListeners();
      await locator<EventService>().getEvents();
    }
  }

  /// The funtion returns title to be displayed on Floating Action Button.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: Returns the title to be displayed on Floating Action Button.
  String getFabTitle() {
    if (event.isRegisterable == false) {
      return "Not Registrable";
    } else if (event.isRegistered == true) {
      return "Registered";
    } else {
      return "Register";
    }
  }

  /// This function is used to create a new volunteer group for an event.
  ///
  /// **params**:
  /// * `event`: Name of the group
  /// * `groupName`: Name of the group
  /// * `volunteersRequired`: Total number of volunteers required for the group
  ///
  /// **returns**:
  /// * `Future<EventVolunteerGroup?>`: returns the new volunteer group for an event
  Future<EventVolunteerGroup?> createVolunteerGroup(
    Event event,
    String groupName,
    int volunteersRequired,
  ) async {
    try {
      final variables = {
        'eventId': event.id,
        'name': groupName,
        'volunteersRequired': volunteersRequired,
      };

      final result = await locator<EventService>()
          .createVolunteerGroup(variables) as QueryResult;

      if (result.data == null ||
          result.data!['createEventVolunteerGroup'] == null) {
        throw Exception('Failed to create volunteer group or no data returned');
      }

      final data = result.data!['createEventVolunteerGroup'];
      final newGroup =
          EventVolunteerGroup.fromJson(data as Map<String, dynamic>);

      _volunteerGroups.add(newGroup);
      notifyListeners();

      return newGroup;
    } catch (e) {
      print('Error creating volunteer group: $e');
    }
    return null;
  }

  /// Fetches all volunteer groups for the current event.
  ///
  /// **params**:
  /// * `eventId`: The ID of the event to fetch volunteer groups for.
  ///
  /// **returns**:
  ///   None
  Future<void> fetchVolunteerGroups(String eventId) async {
    try {
      final result =
          await locator<EventService>().fetchVolunteerGroupsByEvent(eventId);

      _volunteerGroups.clear();
      _volunteerGroups.addAll(result);
      notifyListeners();
    } catch (e) {
      print('Error fetching volunteer groups: $e');
      setState(ViewState.idle);
    }
  }
}
