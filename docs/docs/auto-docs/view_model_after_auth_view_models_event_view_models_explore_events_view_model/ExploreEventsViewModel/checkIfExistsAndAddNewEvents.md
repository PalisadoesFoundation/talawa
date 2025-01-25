::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart](../../view_model_after_auth_view_models_event_view_models_explore_events_view_model/)
3.  [ExploreEventsViewModel](../../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel-class.html)
4.  checkIfExistsAndAddNewEvents method

::: self-name
checkIfExistsAndAddNewEvents
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [checkIfExistsAndAddNewEvents]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[checkIfExistsAndAddNewEvents]{.name}(

1.  [[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Event](../../models_events_event_model/Event-class.html)]{.type-parameter}\>]{.signature}]{.type-annotation}
    [newEvents]{.parameter-name}]{#checkIfExistsAndAddNewEvents-param-newEvents
    .parameter}

)
:::

::: {.section .desc .markdown}
This function add a new event if the event not exist.

**params**:

-   `newEvents`: `Event` type variable containing data to create a new
    event.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> checkIfExistsAndAddNewEvents(List<Event> newEvents) async {
  // Check if the event is unique and belongs to the current organization
  newEvents.forEach((newEvent) {
    if (!_uniqueEventIds.contains(newEvent.id) &&
        newEvent.organization!.id == userConfig.currentOrg.id) {
      _uniqueEventIds.add(newEvent.id!);
      _events.insert(0, newEvent);
    }
    if (!_userEvents.any((event) => event.id == newEvent.id) &&
        newEvent.creator!.id == userConfig.currentUser.id) {
      _userEvents.insert(0, newEvent);
    }
  });
  notifyListeners();
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [explore_events_view_model](../../view_model_after_auth_view_models_event_view_models_explore_events_view_model/)
3.  [ExploreEventsViewModel](../../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel-class.html)
4.  checkIfExistsAndAddNewEvents method

##### ExploreEventsViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
