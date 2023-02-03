import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';

/// eventAdminFab widget returns the SpeedDial widget which which allows
/// numbers to be entered into a memory and dialled with the push of a single button.
Widget eventAdminFab({
  required BuildContext context,
  required Event event,
  required ExploreEventsViewModel exploreEventsViewModel,
}) {
  return SpeedDial(
    icon: Icons.menu,
    activeIcon: Icons.close,
    buttonSize: 55.0,
    overlayColor: Theme.of(context).colorScheme.onBackground,
    overlayOpacity: 0.5,
    backgroundColor: Theme.of(context).primaryColor,
    foregroundColor: Theme.of(context).colorScheme.secondary,
    elevation: 8.0,
    children: [
      SpeedDialChild(
        child: const Icon(
          Icons.delete,
        ),
        label: 'Delete Event',
        labelStyle: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(color: Theme.of(context).colorScheme.secondary),
        foregroundColor: Theme.of(context).colorScheme.secondary,
        backgroundColor: Theme.of(context).primaryColor,
        labelBackgroundColor: Theme.of(context).primaryColor,
        onTap: () {
          exploreEventsViewModel.deleteEvent(eventId: event.id!);
        },
      ),
      SpeedDialChild(
        child: const Icon(
          Icons.edit,
        ),
        label: 'Edit Event',
        labelStyle: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(color: Theme.of(context).colorScheme.secondary),
        foregroundColor: Theme.of(context).colorScheme.secondary,
        backgroundColor: Theme.of(context).primaryColor,
        labelBackgroundColor: Theme.of(context).primaryColor,
        onTap: () {
          navigationService.pushScreen("/editEventPage", arguments: event);
        },
      ),
    ],
  );
}
