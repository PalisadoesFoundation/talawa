import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/services/event_service.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';

class EventInfoViewModel extends BaseModel {
  late ExploreEventsViewModel exploreEventsInstance;
  late Event event;
  late String fabTitle;

  initialize({required Map<String, dynamic> args}) {
    event = args["event"] as Event;
    exploreEventsInstance =
        args["exploreEventViewModel"] as ExploreEventsViewModel;
    fabTitle = getFabTitle();
    print(event.isRegistered);
  }

  registerForEvent() async {
    if (event.isRegisterable == true && event.isRegistered == false) {
      navigationService.pushDialog(
        const CustomProgressDialog(
          key: Key('RegisterEvent'),
        ),
      );

      final registerResult = await EventService().registerForAnEvent(event.id!);
      if (registerResult != null) {
        event.isRegistered = true;
      }
      print(registerResult);
      fabTitle = getFabTitle();
      navigationService.pop();
      notifyListeners();
    }
  }

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
