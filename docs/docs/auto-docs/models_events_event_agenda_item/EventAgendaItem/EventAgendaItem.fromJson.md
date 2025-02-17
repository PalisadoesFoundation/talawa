:::::: {#dartdoc-main-content .main-content above-sidebar="models_events_event_agenda_item/EventAgendaItem-class-sidebar.html" below-sidebar=""}
<div>

# [EventAgendaItem.fromJson]{.kind-constructor} constructor

</div>

::: {.section .multi-line-signature}
[EventAgendaItem.fromJson]{.name}(

1.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter},
    [dynamic]{.type-parameter}\>]{.signature}]{.type-annotation}
    [json]{.parameter-name}]{#fromJson-param-json .parameter}

)
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
factory EventAgendaItem.fromJson(Map<String, dynamic> json) {
  return EventAgendaItem(
    id: json['_id'] as String?,
    title: json['title'] as String?,
    description: json['description'] as String?,
    duration: json['duration'] as String?,
    attachments: (json['attachments'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    createdBy: json['createdBy'] != null
        ? User.fromJson(
            json['createdBy'] as Map<String, dynamic>,
            fromOrg: true,
          )
        : null,
    urls: (json['urls'] as List<dynamic>?)?.map((e) => e as String).toList(),
    relatedEvent: json['relatedEvent'] != null
        ? Event.fromJson(json['relatedEvent'] as Map<String, dynamic>)
        : null,
    categories: (json['categories'] as List<dynamic>?)
        ?.map((e) => AgendaCategory.fromJson(e as Map<String, dynamic>))
        .toList(),
    sequence: json['sequence'] as int?,
    organization: json['organization'] != null
        ? OrgInfo.fromJson(json['organization'] as Map<String, dynamic>)
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
2.  [event_agenda_item](../../models_events_event_agenda_item/)
3.  [EventAgendaItem](../../models_events_event_agenda_item/EventAgendaItem-class.html)
4.  EventAgendaItem.fromJson factory constructor

##### EventAgendaItem class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
