::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [models/events/event_model.dart](../../models_events_event_model/)
3.  [EventAdapter](../../models_events_event_model/EventAdapter-class.html)
4.  write method

::: self-name
write
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="models_events_event_model/EventAdapter-class-sidebar.html" below-sidebar=""}
<div>

# [write]{.kind-method} method

</div>

::: {.section .multi-line-signature}
<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[void]{.returntype} [write]{.name}(

1.  [[[BinaryWriter](https://pub.dev/documentation/hive/2.2.3/hive/BinaryWriter-class.html)]{.type-annotation}
    [writer]{.parameter-name}, ]{#write-param-writer .parameter}
2.  [[[Event](../../models_events_event_model/Event-class.html)]{.type-annotation}
    [obj]{.parameter-name}]{#write-param-obj .parameter}

)

::: features
[override]{.feature}
:::
:::

::: {.section .desc .markdown}
Is called when a value has to be encoded.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
@override
void write(BinaryWriter writer, Event obj) {
  writer
    ..writeByte(17)
    ..writeByte(0)
    ..write(obj.id)
    ..writeByte(1)
    ..write(obj.title)
    ..writeByte(2)
    ..write(obj.description)
    ..writeByte(3)
    ..write(obj.location)
    ..writeByte(4)
    ..write(obj.recurring)
    ..writeByte(5)
    ..write(obj.allDay)
    ..writeByte(6)
    ..write(obj.startDate)
    ..writeByte(7)
    ..write(obj.endDate)
    ..writeByte(8)
    ..write(obj.startTime)
    ..writeByte(9)
    ..write(obj.endTime)
    ..writeByte(10)
    ..write(obj.isPublic)
    ..writeByte(11)
    ..write(obj.isRegistered)
    ..writeByte(12)
    ..write(obj.isRegisterable)
    ..writeByte(13)
    ..write(obj.creator)
    ..writeByte(14)
    ..write(obj.organization)
    ..writeByte(15)
    ..write(obj.admins)
    ..writeByte(16)
    ..write(obj.attendees);
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
4.  write method

##### EventAdapter class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
