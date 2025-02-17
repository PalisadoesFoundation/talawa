
<div>

# read method

</div>


<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[Attendee](../../models_events_event_model/Attendee-class.html)]
read(

1.  [[[BinaryReader](https://pub.dev/documentation/hive/2.2.3/hive/BinaryReader-class.html)]
    reader]

)


override




Is called when a value has to be decoded.



## Implementation

``` language-dart
@override
Attendee read(BinaryReader reader) {
  final numOfFields = reader.;
  final fields = <int, dynamic>{
    for (int i = 0; i < numOfFields; i++) reader.: reader.,
  };
  return Attendee(
    id: fields[0] as String?,
    firstName: fields[1] as String?,
    lastName: fields[2] as String?,
    image: fields[3] as String?,
  );
}
```







1.  [talawa](../../index.html)
2.  [event_model](../../models_events_event_model/)
3.  [AttendeeAdapter](../../models_events_event_model/AttendeeAdapter-class.html)
4.  read method

##### AttendeeAdapter class







