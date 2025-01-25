::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [models/events/event_model.dart](../../models_events_event_model/)
3.  [EventAdapter](../../models_events_event_model/EventAdapter-class.html)
4.  read method

::: self-name
read
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="models_events_event_model/EventAdapter-class-sidebar.html" below-sidebar=""}
<div>

# [read]{.kind-method} method

</div>

::: {.section .multi-line-signature}
<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[Event](../../models_events_event_model/Event-class.html)]{.returntype}
[read]{.name}(

1.  [[[BinaryReader](https://pub.dev/documentation/hive/2.2.3/hive/BinaryReader-class.html)]{.type-annotation}
    [reader]{.parameter-name}]{#read-param-reader .parameter}

)

::: features
[override]{.feature}
:::
:::

::: {.section .desc .markdown}
Is called when a value has to be decoded.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
@override
Event read(BinaryReader reader) {
  final numOfFields = reader.readByte();
  final fields = <int, dynamic>{
    for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
  };
  return Event(
    id: fields[0] as String?,
    title: fields[1] as String?,
    description: fields[2] as String?,
    attendees: (fields[16] as List?)?.cast<Attendee>(),
    location: fields[3] as String?,
    recurring: fields[4] as bool?,
    allDay: fields[5] as bool?,
    startDate: fields[6] as String?,
    endDate: fields[7] as String?,
    startTime: fields[8] as String?,
    endTime: fields[9] as String?,
    isPublic: fields[10] as bool?,
    isRegistered: fields[11] as bool?,
    isRegisterable: fields[12] as bool?,
    creator: fields[13] as User?,
    organization: fields[14] as OrgInfo?,
    admins: (fields[15] as List?)?.cast<User>(),
  );
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [event_model](../../models_events_event_model/)
3.  [EventAdapter](../../models_events_event_model/EventAdapter-class.html)
4.  read method

##### EventAdapter class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
