::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [deleteEvent]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[deleteEvent]{.name}({

1.  [required
    [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [eventId]{.parameter-name}, ]{#deleteEvent-param-eventId .parameter}

})
:::

::: {.section .desc .markdown}
This function deletes the event.

**params**:

-   `eventId`: id of the event that need to be delete.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
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
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [explore_events_view_model](../../view_model_after_auth_view_models_event_view_models_explore_events_view_model/)
3.  [ExploreEventsViewModel](../../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel-class.html)
4.  deleteEvent method

##### ExploreEventsViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
