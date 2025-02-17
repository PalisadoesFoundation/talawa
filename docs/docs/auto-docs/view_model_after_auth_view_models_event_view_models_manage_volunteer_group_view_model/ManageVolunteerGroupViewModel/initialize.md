::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [initialize]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[initialize]{.name}(

1.  [[[Event](../../models_events_event_model/Event-class.html)]{.type-annotation}
    [parentEvent]{.parameter-name}, ]{#initialize-param-parentEvent
    .parameter}
2.  [[[EventVolunteerGroup](../../models_events_event_volunteer_group/EventVolunteerGroup-class.html)]{.type-annotation}
    [group]{.parameter-name}]{#initialize-param-group .parameter}

)
:::

::: {.section .desc .markdown}
Initializes the view model with the given event and volunteer group.

**params**:

-   `parentEvent`: The event associated with the volunteer group.
-   `group`: The volunteer group to be managed.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> initialize(Event parentEvent, EventVolunteerGroup group) async {
  setState(ViewState.busy);

  event = parentEvent;
  if (group.volunteers != null) {
    _volunteers = List<EventVolunteer>.from(group.volunteers!);
  }

  setState(ViewState.idle);
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [manage_volunteer_group_view_model](../../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/)
3.  [ManageVolunteerGroupViewModel](../../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel-class.html)
4.  initialize method

##### ManageVolunteerGroupViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
