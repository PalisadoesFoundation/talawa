::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [models/events/event_model.dart](../../models_events_event_model/)
3.  [Event](../../models_events_event_model/Event-class.html)
4.  Event.fromJson factory constructor

::: self-name
Event.fromJson
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="models_events_event_model/Event-class-sidebar.html" below-sidebar=""}
<div>

# [Event.fromJson]{.kind-constructor} constructor

</div>

::: {.section .multi-line-signature}
[Event.fromJson]{.name}(

1.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter},
    [dynamic]{.type-parameter}\>]{.signature}]{.type-annotation}
    [json]{.parameter-name}]{#fromJson-param-json .parameter}

)
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
factory Event.fromJson(
  Map<String, dynamic> json,
) {
  return Event(
    id: json['_id'] as String,
    title: json['title'] as String?,
    description: json['description'] as String?,
    location: json['location'] as String?,
    recurring: json['recurring'] as bool?,
    allDay: json['allDay'] as bool?,
    startDate: json['startDate'] as String?,
    endDate: json['endDate'] as String?,
    startTime: json['startTime'] as String?,
    endTime: json['endTime'] as String?,
    isPublic: json['isPublic'] as bool?,
    isRegistered: json['isRegistered'] as bool?,
    isRegisterable: json['isRegisterable'] as bool?,
    creator: json['creator'] == null
        ? null
        : User.fromJson(
            json['creator'] as Map<String, dynamic>,
            fromOrg: true,
          ),
    organization: json['organization'] == null
        ? null
        : OrgInfo.fromJson(json['organization'] as Map<String, dynamic>),
    admins: json['admins'] == null
        ? null
        : (json['admins'] as List<dynamic>?)
            ?.map(
              (e) => User.fromJson(e as Map<String, dynamic>, fromOrg: true),
            )
            .toList(),
    attendees: (json["attendees"] as List<dynamic>?)?.isEmpty ?? true
        ? null
        : (json['attendees'] as List<dynamic>?)
            ?.map(
              (e) => Attendee.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
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
3.  [Event](../../models_events_event_model/Event-class.html)
4.  Event.fromJson factory constructor

##### Event class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
