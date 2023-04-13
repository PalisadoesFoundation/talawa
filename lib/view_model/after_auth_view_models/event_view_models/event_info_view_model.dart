// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/event_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';

/// EventInfoViewModel class helps interacting with model to serve view with the event information data.'
///
/// Methods include:
/// * `registerForEvent` : to register user for an event.
/// * `getFabTitle` : to get the status of "registration" for an event.
class EventInfoViewModel extends BaseModel {
  late ExploreEventsViewModel exploreEventsInstance;
  late Event event;
  late String fabTitle;
  late List<User> registrants;

  /// initialise with the event data fetched from the model.
  Future<void> initialize({required Map<String, dynamic> args}) async {
    event = args["event"] as Event;
    exploreEventsInstance =
        args["exploreEventViewModel"] as ExploreEventsViewModel;
    fabTitle = getFabTitle();
    setState(ViewState.busy);
    final fetchRegistrantsByEventQueryResult = await locator<EventService>()
        .fetchRegistrantsByEvent(event.id!) as QueryResult;
    final registrantsJsonList = fetchRegistrantsByEventQueryResult
        .data!['registrantsByEvent'] as List<Object?>;
    registrants = registrantsJsonList
        .map(
          (registrantJson) => User.fromJson(
            registrantJson! as Map<String, dynamic>,
            fromOrg: true,
          ),
        )
        .toList();
    setState(ViewState.idle);
  }

  /// This function helps the user to register for an event.
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
      //final registerResult = await EventService().registerForAnEvent(event.id!);
      // if the registration is successful.
      if (registerResult != null) {
        event.isRegistered = true;
        registrants.add(locator<UserConfig>().currentUser);
      }
      print(registerResult);
      fabTitle = getFabTitle();
      navigationService.pop();
      notifyListeners();
    }
  }

  /// This function returns `String` type for the event registration status.
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
