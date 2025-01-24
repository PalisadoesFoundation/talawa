




read method - AttendeeAdapter class - event\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [models/events/event\_model.dart](../../models_events_event_model/models_events_event_model-library.html)
3. [AttendeeAdapter](../../models_events_event_model/AttendeeAdapter-class.html)
4. read method

read


dark\_mode

light\_mode




# read method


1. @override

[Attendee](../../models_events_event_model/Attendee-class.html)
read(

1. [BinaryReader](https://pub.dev/documentation/hive/2.2.3/hive/BinaryReader-class.html) reader

)
override

Is called when a value has to be decoded.


## Implementation

```
@override
Attendee read(BinaryReader reader) {
  final numOfFields = reader.readByte();
  final fields = <int, dynamic>{
    for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
  };
  return Attendee(
    id: fields[0] as String?,
    firstName: fields[1] as String?,
    lastName: fields[2] as String?,
    image: fields[3] as String?,
  );
}
```

 


1. [talawa](../../index.html)
2. [event\_model](../../models_events_event_model/models_events_event_model-library.html)
3. [AttendeeAdapter](../../models_events_event_model/AttendeeAdapter-class.html)
4. read method

##### AttendeeAdapter class





talawa
1.0.0+1






