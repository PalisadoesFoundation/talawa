




write method - AttendeeAdapter class - event\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [models/events/event\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/)
3. [AttendeeAdapter](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/AttendeeAdapter-class.html)
4. write method

write


dark\_mode

light\_mode




# write method


1. @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

void
write(

1. dynamic writer,
2. [Attendee](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/Attendee-class.html) obj

)

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
2. [event\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/)
3. [AttendeeAdapter](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/AttendeeAdapter-class.html)
4. write method

##### AttendeeAdapter class





talawa
1.0.0+1






