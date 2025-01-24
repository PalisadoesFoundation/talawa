




AgendaCategory.fromJson constructor - AgendaCategory - event\_agenda\_category library - Dart API







menu

1. [talawa](../../index.html)
2. [models/events/event\_agenda\_category.dart](../../models_events_event_agenda_category/models_events_event_agenda_category-library.html)
3. [AgendaCategory](../../models_events_event_agenda_category/AgendaCategory-class.html)
4. AgendaCategory.fromJson factory constructor

AgendaCategory.fromJson


dark\_mode

light\_mode




# AgendaCategory.fromJson constructor


AgendaCategory.fromJson(

1. Map<String, dynamic> json

)

Creates a new `AgendaCategory` instance from a JSON map.


## Implementation

```
factory AgendaCategory.fromJson(Map<String, dynamic> json) {
  return AgendaCategory(
    id: json['_id'] as String?,
    name: json['name'] as String?,
    description: json['description'] as String?,
  );
}
```

 


1. [talawa](../../index.html)
2. [event\_agenda\_category](../../models_events_event_agenda_category/models_events_event_agenda_category-library.html)
3. [AgendaCategory](../../models_events_event_agenda_category/AgendaCategory-class.html)
4. AgendaCategory.fromJson factory constructor

##### AgendaCategory class





talawa
1.0.0+1






