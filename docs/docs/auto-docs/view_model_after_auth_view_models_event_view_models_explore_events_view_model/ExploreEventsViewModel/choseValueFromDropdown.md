::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [choseValueFromDropdown]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[choseValueFromDropdown]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [value]{.parameter-name}]{#choseValueFromDropdown-param-value
    .parameter}

)
:::

::: {.section .desc .markdown}
This function takes the choosen value from dropdown and return the
filter events, if empty list then return relevant message.

**params**:

-   `value`: choosen value from dropdown.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> choseValueFromDropdown(String value) async {
  _chosenValue = value;
  notifyListeners();
  setState(ViewState.busy);

  if (!demoMode) {
    switch (_chosenValue) {
      // if `_chosenValue` is "All events".
      case 'All Events':
        {
          // all events
          _events = _bufferEvents;
          // if list is empty
          _emptyListMessage = "Looks like there aren't any events.";
        }
        break;
      // if `_chosenValue` is "created event".
      case 'My Events':
        {
          // loop through the `_events` list and check
          // for the creator id matched the current user id.
          _events = List.from(
            _bufferEvents.where(
              (element) => element.creator!.id == userConfig.currentUser.id,
            ),
          );
          // if list is empty
          _emptyListMessage = "You have not created any event.";
        }
        break;
      // if `_chosenValue` is "Registered Events".
      case 'Registered Events':
        {
          // loop through the `_events` list and filter elements
          // if `element.isRegistered` is true and user is not the creator.
          _events = List.from(
            _bufferEvents.where(
              (element) =>
                  element.isRegistered == true &&
                  element.creator!.id != userConfig.currentUser.id,
            ),
          );
          // if list is empty
          _emptyListMessage = "No registered events are present";
        }
        break;
      // if `_chosenValue` is "Registered Events".
      case 'Public Events':
        {
          // loop through the `_events` list and filter elements
          // with the `isPublic` as true.
          _events = _bufferEvents
              .where((element) => element.isPublic == true)
              .toList();

          // if list is empty
          _emptyListMessage = "There aren't any public events.";
        }
        break;
      case 'Private Events':
        {
          // loop through the `_events` list and filter elements
          // with the `isPublic` as false.
          _events = _bufferEvents
              .where((element) => element.isPublic == false)
              .toList();
          // if list is empty
          _emptyListMessage = "There aren't any private events.";
        }
        break;

      default:
        {
          _events = _bufferEvents;
        }
    }
  }
  await Future.delayed(const Duration(milliseconds: 500));
  setState(ViewState.idle);
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
4.  choseValueFromDropdown method

##### ExploreEventsViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
