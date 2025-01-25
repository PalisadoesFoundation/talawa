::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/after_auth_view_models/event_view_models/event_info_view_model.dart](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/)
3.  [EventInfoViewModel](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.html)
4.  fetchVolunteerGroups method

::: self-name
fetchVolunteerGroups
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [fetchVolunteerGroups]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[fetchVolunteerGroups]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [eventId]{.parameter-name}]{#fetchVolunteerGroups-param-eventId
    .parameter}

)
:::

::: {.section .desc .markdown}
Fetches all volunteer groups for the current event.

**params**:

-   `eventId`: The ID of the event to fetch volunteer groups for.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
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
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [event_info_view_model](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/)
3.  [EventInfoViewModel](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.html)
4.  fetchVolunteerGroups method

##### EventInfoViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
