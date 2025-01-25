::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [services/event_service.dart](../../services_event_service/)
3.  [EventService](../../services_event_service/EventService-class.html)
4.  refreshFeed method

::: self-name
refreshFeed
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_event_service/EventService-class-sidebar.html" below-sidebar=""}
<div>

# [refreshFeed]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[refreshFeed]{.name}()
:::

::: {.section .desc .markdown}
Refreshes the event feed by fetching the latest events from the API and
updating the event stream.

This method retrieves the latest events using the
`getNewFeedAndRefreshCache` method and adds the new events to the event
stream.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> refreshFeed() async {
  _events = await getNewFeedAndRefreshCache();
  _eventStreamController.add(_events);
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [event_service](../../services_event_service/)
3.  [EventService](../../services_event_service/EventService-class.html)
4.  refreshFeed method

##### EventService class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
