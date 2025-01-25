




EventVolunteerGroup.fromJson constructor - EventVolunteerGroup - event\_volunteer\_group library - Dart API







menu

1. [talawa](../../index.html)
2. [models/events/event\_volunteer\_group.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_volunteer_group/)
3. [EventVolunteerGroup](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_volunteer_group/EventVolunteerGroup-class.html)
4. EventVolunteerGroup.fromJson factory constructor

EventVolunteerGroup.fromJson


dark\_mode

light\_mode




# EventVolunteerGroup.fromJson constructor


EventVolunteerGroup.fromJson(

1. [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> json

)

## Implementation

```
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

 


1. [talawa](../../index.html)
2. [event\_volunteer\_group](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_volunteer_group/)
3. [EventVolunteerGroup](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_volunteer_group/EventVolunteerGroup-class.html)
4. EventVolunteerGroup.fromJson factory constructor

##### EventVolunteerGroup class





talawa
1.0.0+1






