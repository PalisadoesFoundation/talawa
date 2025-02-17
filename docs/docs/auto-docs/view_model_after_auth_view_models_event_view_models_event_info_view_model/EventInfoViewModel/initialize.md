::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [initialize]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[initialize]{.name}({

1.  [required
    [[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter},
    [dynamic]{.type-parameter}\>]{.signature}]{.type-annotation}
    [args]{.parameter-name}, ]{#initialize-param-args .parameter}

})
:::

::: {.section .desc .markdown}
This function initializes the EventInfoViewModel class with the required
arguments.

**params**:

-   `args`: A map of arguments required to initialize the
    EventInfoViewModel class.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> initialize({required Map<String, dynamic> args}) async {
  event = args["event"] as Event;
  exploreEventsInstance =
      args["exploreEventViewModel"] as ExploreEventsViewModel;
  fabTitle = getFabTitle();
  await fetchCategories();
  await fetchAgendaItems();
  selectedCategories.clear();
  setState(ViewState.busy);
  attendees = event.attendees ?? [];
  setState(ViewState.idle);
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [event_info_view_model](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/)
3.  [EventInfoViewModel](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.html)
4.  initialize method

##### EventInfoViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
