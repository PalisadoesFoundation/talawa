::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [services/event_service.dart](../../services_event_service/)
3.  [EventService](../../services_event_service/EventService-class.html)
4.  eventStream property

::: self-name
eventStream
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_event_service/EventService-class-sidebar.html" below-sidebar=""}
<div>

# [eventStream]{.kind-property} property

</div>

::: {#getter .section}
::: {.section .multi-line-signature}
[[Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Event](../../models_events_event_model/Event-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.returntype}
get [eventStream]{.name}
:::

::: {.section .desc .markdown}
The event stream.

params: None returns:

-   `Stream<Event>`: returns the event stream
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Stream<List<Event>> get eventStream => _eventStream;
```
:::
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [event_service](../../services_event_service/)
3.  [EventService](../../services_event_service/EventService-class.html)
4.  eventStream property

##### EventService class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
