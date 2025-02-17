:::::: {#dartdoc-main-content .main-content above-sidebar="models_events_event_volunteer_group/EventVolunteerGroup-class-sidebar.html" below-sidebar=""}
<div>

# [EventVolunteerGroup.fromJson]{.kind-constructor} constructor

</div>

::: {.section .multi-line-signature}
[EventVolunteerGroup.fromJson]{.name}(

1.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter},
    [dynamic]{.type-parameter}\>]{.signature}]{.type-annotation}
    [json]{.parameter-name}]{#fromJson-param-json .parameter}

)
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
factory EventVolunteerGroup.fromJson(Map<String, dynamic> json) {
  return EventVolunteerGroup(
    id: json['_id'] as String?,
    createdAt: json['createdAt'] as String?,
    creator: json['creator'] == null
        ? null
        : User.fromJson(
            json['creator'] as Map<String, dynamic>,
            fromOrg: true,
          ),
    event: json['event'] == null
        ? null
        : Event.fromJson(json['event'] as Map<String, dynamic>),
    leader: json['leader'] == null
        ? null
        : User.fromJson(
            json['leader'] as Map<String, dynamic>,
            fromOrg: true,
          ),
    name: json['name'] as String?,
    updatedAt: json['updatedAt'] as String?,
    volunteers: (json['volunteers'] as List<dynamic>?)
        ?.map((e) => EventVolunteer.fromJson(e as Map<String, dynamic>))
        .toList(),
    volunteersRequired: json['volunteersRequired'] as int?,
  );
}
```
:::
::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [event_volunteer_group](../../models_events_event_volunteer_group/)
3.  [EventVolunteerGroup](../../models_events_event_volunteer_group/EventVolunteerGroup-class.html)
4.  EventVolunteerGroup.fromJson factory constructor

##### EventVolunteerGroup class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
