




toJson method - Attendee class - event\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [models/events/event\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/)
3. [Attendee](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/Attendee-class.html)
4. toJson method

toJson


dark\_mode

light\_mode




# toJson method


[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic>
toJson()

Converts the Attendee instance to a map structure..

This method is used to convert the Attendee instance to a map structure that can be converted to a JSON object.

**params**:
None

**returns**:

* `Map<String, dynamic>`: A map structure that can be converted to a JSON object.

## Implementation

```
Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['_id'] = this.id;
  data['firstName'] = this.firstName;
  data['lastName'] = this.lastName;
  data['image'] = this.image;
  return data;
}
```

 


1. [talawa](../../index.html)
2. [event\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/)
3. [Attendee](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/Attendee-class.html)
4. toJson method

##### Attendee class





talawa
1.0.0+1






