::::::: {#dartdoc-main-content .main-content above-sidebar="services_event_service/EventService-class-sidebar.html" below-sidebar=""}
<div>

# [fetchEventsInitial]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[fetchEventsInitial]{.name}()
:::

::: {.section .desc .markdown}
Fetches the initial set of events, loading from the cache first, and
then refreshing the feed.

This method loads events from the cache, adds them to the event stream,
and then triggers a feed refresh to fetch the latest events from the API
and update the stream accordingly.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> fetchEventsInitial() async {
  _events = await loadCachedData();
  _eventStreamController.add(_events);
  refreshFeed();
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [event_service](../../services_event_service/)
3.  [EventService](../../services_event_service/EventService-class.html)
4.  fetchEventsInitial method

##### EventService class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
