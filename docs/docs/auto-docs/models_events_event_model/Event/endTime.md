



menu

1.  [talawa](../../index.md)
2.  [models/events/event_model.dart](../../models_events_event_model/)
3.  [Event](../../models_events_event_model/Event-class.md)
4.  endTime property


endTime


 dark_mode   light_mode 




<div>

# endTime property

</div>



[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
get endTime



Computed property: formatted end time (e.g. \"05:00 PM\").



## Implementation

``` language-dart
String get endTime =>
    endAt != null ? DateFormat('hh:mm a').format(endAt!) : '';
```








1.  [talawa](../../index.md)
2.  [event_model](../../models_events_event_model/)
3.  [Event](../../models_events_event_model/Event-class.md)
4.  endTime property

##### Event class









 talawa 1.0.0+1 
