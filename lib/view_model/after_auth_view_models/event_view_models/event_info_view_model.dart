import 'package:flutter/material.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/event_model.dart';
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
    setState(ViewState.busy);

    attendees = event.attendees ?? [];
    setState(ViewState.idle);
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
        attendees.add(
          Attendee(
            id: UserConfig().currentUser.id,
            firstName: UserConfig().currentUser.firstName,
            lastName: UserConfig().currentUser.lastName,
            image: UserConfig().currentUser.image,
          ),
        );
      }
      print(registerResult);
      fabTitle = getFabTitle();
      navigationService.pop();
      notifyListeners();
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
}
