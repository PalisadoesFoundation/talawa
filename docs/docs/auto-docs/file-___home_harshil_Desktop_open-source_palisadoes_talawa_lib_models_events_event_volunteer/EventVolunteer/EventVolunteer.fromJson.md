




EventVolunteer.fromJson constructor - EventVolunteer - event\_volunteer library - Dart API







menu

1. [talawa](../../index.html)
2. [models/events/event\_volunteer.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_volunteer/)
3. [EventVolunteer](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_volunteer/EventVolunteer-class.html)
4. EventVolunteer.fromJson factory constructor

EventVolunteer.fromJson


dark\_mode

light\_mode




# EventVolunteer.fromJson constructor


EventVolunteer.fromJson(

1. [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> json

)

## Implementation

```
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

 


1. [talawa](../../index.html)
2. [event\_volunteer](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_volunteer/)
3. [EventVolunteer](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_volunteer/EventVolunteer-class.html)
4. EventVolunteer.fromJson factory constructor

##### EventVolunteer class





talawa
1.0.0+1






