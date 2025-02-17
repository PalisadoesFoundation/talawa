:::::: {#dartdoc-main-content .main-content above-sidebar="models_events_event_volunteer/EventVolunteer-class-sidebar.html" below-sidebar=""}
<div>

# [EventVolunteer.fromJson]{.kind-constructor} constructor

</div>

::: {.section .multi-line-signature}
[EventVolunteer.fromJson]{.name}(

1.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter},
    [dynamic]{.type-parameter}\>]{.signature}]{.type-annotation}
    [json]{.parameter-name}]{#fromJson-param-json .parameter}

)
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
factory EventVolunteer.fromJson(Map<String, dynamic> json) {
  return EventVolunteer(
    id: json['_id'] as String?,
    creator: json['creator'] != null
        ? User.fromJson(
            json['creator'] as Map<String, dynamic>,
            fromOrg: true,
          )
        : null,
    event: json['event'] != null
        ? Event.fromJson(json['event'] as Map<String, dynamic>)
        : null,
    group: json['group'] != null
        ? EventVolunteerGroup.fromJson(json['group'] as Map<String, dynamic>)
        : null,
    isAssigned: json['isAssigned'] as bool?,
    isInvited: json['isInvited'] as bool?,
    response: json['response'] as String?,
    user: json['user'] != null
        ? User.fromJson(json['user'] as Map<String, dynamic>, fromOrg: true)
        : null,
  );
}
```
:::
::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [event_volunteer](../../models_events_event_volunteer/)
3.  [EventVolunteer](../../models_events_event_volunteer/EventVolunteer-class.html)
4.  EventVolunteer.fromJson factory constructor

##### EventVolunteer class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
