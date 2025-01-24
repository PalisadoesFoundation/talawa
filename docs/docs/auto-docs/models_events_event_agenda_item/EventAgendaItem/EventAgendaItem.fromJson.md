




EventAgendaItem.fromJson constructor - EventAgendaItem - event\_agenda\_item library - Dart API







menu

1. [talawa](../../index.html)
2. [models/events/event\_agenda\_item.dart](../../models_events_event_agenda_item/models_events_event_agenda_item-library.html)
3. [EventAgendaItem](../../models_events_event_agenda_item/EventAgendaItem-class.html)
4. EventAgendaItem.fromJson factory constructor

EventAgendaItem.fromJson


dark\_mode

light\_mode




# EventAgendaItem.fromJson constructor


EventAgendaItem.fromJson(

1. Map<String, dynamic> json

)

## Implementation

```
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

 


1. [talawa](../../index.html)
2. [event\_agenda\_item](../../models_events_event_agenda_item/models_events_event_agenda_item-library.html)
3. [EventAgendaItem](../../models_events_event_agenda_item/EventAgendaItem-class.html)
4. EventAgendaItem.fromJson factory constructor

##### EventAgendaItem class





talawa
1.0.0+1






