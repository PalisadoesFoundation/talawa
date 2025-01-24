




Event.fromJson constructor - Event - event\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [models/events/event\_model.dart](../../models_events_event_model/models_events_event_model-library.html)
3. [Event](../../models_events_event_model/Event-class.html)
4. Event.fromJson factory constructor

Event.fromJson


dark\_mode

light\_mode




# Event.fromJson constructor


Event.fromJson(

1. Map<String, dynamic> json

)

## Implementation

```
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

 


1. [talawa](../../index.html)
2. [event\_model](../../models_events_event_model/models_events_event_model-library.html)
3. [Event](../../models_events_event_model/Event-class.html)
4. Event.fromJson factory constructor

##### Event class





talawa
1.0.0+1






