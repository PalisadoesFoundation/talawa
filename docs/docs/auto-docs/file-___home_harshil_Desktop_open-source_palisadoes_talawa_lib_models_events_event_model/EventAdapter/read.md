




read method - EventAdapter class - event\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [models/events/event\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/)
3. [EventAdapter](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/EventAdapter-class.html)
4. read method

read


dark\_mode

light\_mode




# read method


1. @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

[Event](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/Event-class.html)
read(

1. dynamic reader

)

## Implementation

```
@override
Event read(BinaryReader reader) {
  final numOfFields = reader.readByte();
  final fields = <int, dynamic>{
    for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
  };
  return Event(
    id: fields[0] as String?,
    title: fields[1] as String?,
    description: fields[2] as String?,
    attendees: (fields[16] as List?)?.cast<Attendee>(),
    location: fields[3] as String?,
    recurring: fields[4] as bool?,
    allDay: fields[5] as bool?,
    startDate: fields[6] as String?,
    endDate: fields[7] as String?,
    startTime: fields[8] as String?,
    endTime: fields[9] as String?,
    isPublic: fields[10] as bool?,
    isRegistered: fields[11] as bool?,
    isRegisterable: fields[12] as bool?,
    creator: fields[13] as User?,
    organization: fields[14] as OrgInfo?,
    admins: (fields[15] as List?)?.cast<User>(),
  );
}
```

 


1. [talawa](../../index.html)
2. [event\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/)
3. [EventAdapter](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/EventAdapter-class.html)
4. read method

##### EventAdapter class





talawa
1.0.0+1






