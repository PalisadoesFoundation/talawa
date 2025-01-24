




deleteEvent method - ExploreEventsViewModel class - explore\_events\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/explore\_events\_view\_model.dart](../../view_model_after_auth_view_models_event_view_models_explore_events_view_model/view_model_after_auth_view_models_event_view_models_explore_events_view_model-library.html)
3. [ExploreEventsViewModel](../../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel-class.html)
4. deleteEvent method

deleteEvent


dark\_mode

light\_mode




# deleteEvent method


Future<void>
deleteEvent({

1. required String eventId,

})

This function deletes the event.

**params**:

* `eventId`: id of the event that need to be delete.

**returns**:
None


## Implementation

```
Future<void> deleteEvent({required String eventId}) async {
  navigationService.pushDialog(
    CustomAlertDialog(
      reverse: true,
      dialogSubTitle: 'Are you sure you want to delete this event?',
      successText: 'Delete',
      success: () async {
        navigationService.pop(); // Close the confirmation dialog
        navigationService.pushDialog(
          const CustomProgressDialog(key: Key('DeleteEventProgress')),
        );
        await actionHandlerService.performAction(
          actionType: ActionType.critical,
          criticalActionFailureMessage: TalawaErrors.eventDeletionFailed,
          action: () async {
            Future<QueryResult<Object?>>? result;
            result = _eventService.deleteEvent(eventId);
            return result;
          },
          onValidResult: (result) async {
            setState(ViewState.busy);
            _uniqueEventIds.remove(eventId);
            _events.removeWhere((element) => element.id == eventId);
            _userEvents.removeWhere((element) => element.id == eventId);
            await Future.delayed(const Duration(milliseconds: 500));
            navigationService.pop(); // Dismiss progress dialog
            setState(ViewState.idle);
          },
          updateUI: () async {
            navigationService
                .pop(); // Ensure progress dialog is popped in case of error
          },
        );
      },
    ),
  );
}
```

 


1. [talawa](../../index.html)
2. [explore\_events\_view\_model](../../view_model_after_auth_view_models_event_view_models_explore_events_view_model/view_model_after_auth_view_models_event_view_models_explore_events_view_model-library.html)
3. [ExploreEventsViewModel](../../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel-class.html)
4. deleteEvent method

##### ExploreEventsViewModel class





talawa
1.0.0+1






