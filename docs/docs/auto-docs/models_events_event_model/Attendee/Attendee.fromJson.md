




Attendee.fromJson constructor - Attendee - event\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [models/events/event\_model.dart](../../models_events_event_model/models_events_event_model-library.html)
3. [Attendee](../../models_events_event_model/Attendee-class.html)
4. Attendee.fromJson constructor

Attendee.fromJson


dark\_mode

light\_mode




# Attendee.fromJson constructor


Attendee.fromJson(

1. Map<String, dynamic> json

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
2. [event\_model](../../models_events_event_model/models_events_event_model-library.html)
3. [Attendee](../../models_events_event_model/Attendee-class.html)
4. Attendee.fromJson constructor

##### Attendee class





talawa
1.0.0+1






