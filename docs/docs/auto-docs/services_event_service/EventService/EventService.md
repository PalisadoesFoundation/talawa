:::::: {#dartdoc-main-content .main-content above-sidebar="services_event_service/EventService-class-sidebar.html" below-sidebar=""}
<div>

# [EventService]{.kind-constructor} constructor

</div>

::: {.section .multi-line-signature}
[EventService]{.name}()
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
EventService() : super(HiveKeys.eventFeedKey) {
  _eventStream = _eventStreamController.stream.asBroadcastStream();
  print(_eventStream);
  _currentOrg = _userConfig.currentOrg;
  _userConfig.initialiseStream();
  setOrgStreamSubscription();
}
```
:::
::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [event_service](../../services_event_service/)
3.  [EventService](../../services_event_service/EventService-class.html)
4.  EventService constructor

##### EventService class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
