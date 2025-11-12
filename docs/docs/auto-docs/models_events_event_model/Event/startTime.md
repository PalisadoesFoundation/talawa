



menu

1.  [talawa](../../index.md)
2.  [models/events/event_model.dart](../../models_events_event_model/)
3.  [Event](../../models_events_event_model/Event-class.md)
4.  startTime property


startTime


 dark_mode   light_mode 




<div>

# startTime property

</div>



[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
get startTime



Computed property: formatted start time (e.g. \"09:00 AM\").



## Implementation

``` language-dart
String get startTime =>
    startAt != null ? DateFormat('hh:mm a').format(startAt!) : '';
```








1.  [talawa](../../index.md)
2.  [event_model](../../models_events_event_model/)
3.  [Event](../../models_events_event_model/Event-class.md)
4.  startTime property

##### Event class









 talawa 1.0.0+1 
