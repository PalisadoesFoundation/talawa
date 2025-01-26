::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/after_auth_view_models/event_view_models/create_event_view_model.dart](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/)
3.  [CreateEventViewModel](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.html)
4.  createEvent method

::: self-name
createEvent
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [createEvent]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[createEvent]{.name}()
:::

::: {.section .desc .markdown}
This function is used to create the event for the organization.

The function uses `database_mutation_functions` services to call the
graphQL mutation for creating an event and passes the required variables
for the event.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> createEvent() async {
  await actionHandlerService.performAction(
    actionType: ActionType.critical,
    criticalActionFailureMessage: TalawaErrors.eventCreationFailed,
    action: () async {
      titleFocus.unfocus();
      locationFocus.unfocus();
      descriptionFocus.unfocus();
      validate = AutovalidateMode.always;
      if (formKey.currentState!.validate()) {
        validate = AutovalidateMode.disabled;

        // variables initialisation
        final DateTime startTime = DateTime(
          eventStartDate.year,
          eventStartDate.month,
          eventStartDate.day,
          eventStartTime.hour,
          eventStartTime.minute,
        );
        final DateTime endTime = DateTime(
          eventEndDate.year,
          eventEndDate.month,
          eventEndDate.day,
          eventEndTime.hour,
          eventEndTime.minute,
        );
        // all required data for creating an event
        final Map<String, dynamic> variables = {
          "data": {
            'title': eventTitleTextController.text,
            'description': eventDescriptionTextController.text,
            'location': eventLocationTextController.text,
            'isPublic': isPublicSwitch,
            'isRegisterable': isRegisterableSwitch,
            'recurring': isRecurring,
            'allDay': isAllDay,
            'organizationId': _currentOrg.id,
            'startDate': DateFormat('yyyy-MM-dd').format(eventStartDate),
            'endDate': DateFormat('yyyy-MM-dd').format(eventEndDate),
            'startTime':
                isAllDay ? null : DateFormat('HH:mm:ss').format(startTime),
            'endTime':
                isAllDay ? null : DateFormat('HH:mm:ss').format(endTime),
          },
          if (isRecurring)
            'recurrenceRuleData': {
              'recurrenceStartDate': DateFormat('yyyy-MM-dd').format(
                recurrenceStartDate,
              ),
              'recurrenceEndDate': recurrenceEndDate != null
                  ? DateFormat('yyyy-MM-dd').format(recurrenceEndDate!)
                  : null,
              'frequency': frequency,
              'weekDays': (frequency == Frequency.weekly ||
                      (frequency == Frequency.monthly &&
                          weekDayOccurenceInMonth != null))
                  ? weekDays.toList()
                  : null,
              'interval': interval,
              'count': count,
              'weekDayOccurenceInMonth': weekDayOccurenceInMonth,
            },
        };

        print(variables);

        navigationService.pushDialog(
          const CustomProgressDialog(key: Key('EventCreationProgress')),
        );
        // invoke the `gqlAuthMutation` function of `databaseFunctions`
        // service along with the mutation query and variable map.
        final result = await _eventService.createEvent(variables: variables);
        return result;
      }
      return databaseFunctions.noData;
    },
    onValidResult: (result) async {
      await _eventService.getEvents();
    },
    updateUI: () {
      navigationService.pop();
    },
    apiCallSuccessUpdateUI: () {
      navigationService.pop();
    },
  );
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [create_event_view_model](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/)
3.  [CreateEventViewModel](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.html)
4.  createEvent method

##### CreateEventViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
