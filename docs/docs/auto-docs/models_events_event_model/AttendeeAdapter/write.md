




write method - AttendeeAdapter class - event\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [models/events/event\_model.dart](../../models_events_event_model/models_events_event_model-library.html)
3. [AttendeeAdapter](../../models_events_event_model/AttendeeAdapter-class.html)
4. write method

write


dark\_mode

light\_mode




# write method


1. @override

void
write(

1. [BinaryWriter](https://pub.dev/documentation/hive/2.2.3/hive/BinaryWriter-class.html) writer,
2. [Attendee](../../models_events_event_model/Attendee-class.html) obj

)
override

Is called when a value has to be encoded.


## Implementation

```
@override
void write(BinaryWriter writer, Attendee obj) {
  writer
    ..writeByte(4)
    ..writeByte(0)
    ..write(obj.id)
    ..writeByte(1)
    ..write(obj.firstName)
    ..writeByte(2)
    ..write(obj.lastName)
    ..writeByte(3)
    ..write(obj.image);
}
```

 


1. [talawa](../../index.html)
2. [event\_model](../../models_events_event_model/models_events_event_model-library.html)
3. [AttendeeAdapter](../../models_events_event_model/AttendeeAdapter-class.html)
4. write method

##### AttendeeAdapter class





talawa
1.0.0+1






