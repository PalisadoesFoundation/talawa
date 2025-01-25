




Attendee.fromJson constructor - Attendee - event\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [models/events/event\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/)
3. [Attendee](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/Attendee-class.html)
4. Attendee.fromJson constructor

Attendee.fromJson


dark\_mode

light\_mode




# Attendee.fromJson constructor


Attendee.fromJson(

1. [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> json

)

## Implementation

```
Attendee.fromJson(Map<String, dynamic> json) {
  id = json['_id'] as String?;
  firstName = json['firstName'] as String?;
  lastName = json['lastName'] as String?;
  image = json['image'] as String?;
}
```

 


1. [talawa](../../index.html)
2. [event\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/)
3. [Attendee](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/Attendee-class.html)
4. Attendee.fromJson constructor

##### Attendee class





talawa
1.0.0+1






