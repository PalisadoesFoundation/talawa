




write method - EventAdapter class - event\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [models/events/event\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/)
3. [EventAdapter](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/EventAdapter-class.html)
4. write method

write


dark\_mode

light\_mode




# write method


1. @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

void
write(

1. dynamic writer,
2. [Event](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/Event-class.html) obj

)

## Implementation

```
@override
void write(BinaryWriter writer, Event obj) {
  writer
    ..writeByte(17)
    ..writeByte(0)
    ..write(obj.id)
    ..writeByte(1)
    ..write(obj.title)
    ..writeByte(2)
    ..write(obj.description)
    ..writeByte(3)
    ..write(obj.location)
    ..writeByte(4)
    ..write(obj.recurring)
    ..writeByte(5)
    ..write(obj.allDay)
    ..writeByte(6)
    ..write(obj.startDate)
    ..writeByte(7)
    ..write(obj.endDate)
    ..writeByte(8)
    ..write(obj.startTime)
    ..writeByte(9)
    ..write(obj.endTime)
    ..writeByte(10)
    ..write(obj.isPublic)
    ..writeByte(11)
    ..write(obj.isRegistered)
    ..writeByte(12)
    ..write(obj.isRegisterable)
    ..writeByte(13)
    ..write(obj.creator)
    ..writeByte(14)
    ..write(obj.organization)
    ..writeByte(15)
    ..write(obj.admins)
    ..writeByte(16)
    ..write(obj.attendees);
}
```

 


1. [talawa](../../index.html)
2. [event\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/)
3. [EventAdapter](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_model/EventAdapter-class.html)
4. write method

##### EventAdapter class





talawa
1.0.0+1






