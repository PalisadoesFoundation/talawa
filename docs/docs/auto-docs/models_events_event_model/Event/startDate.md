



menu

1.  [talawa](../../index.md)
2.  [models/events/event_model.dart](../../models_events_event_model/)
3.  [Event](../../models_events_event_model/Event-class.md)
4.  startDate property


startDate


 dark_mode   light_mode 




<div>

# startDate property

</div>



[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
get startDate



Computed property: formatted start date (e.g. \"2025-07-30\").



## Implementation

``` language-dart
String? get startDate =>
    startAt != null ? DateFormat('yyyy-MM-dd').format(startAt!) : null;
```








1.  [talawa](../../index.md)
2.  [event_model](../../models_events_event_model/)
3.  [Event](../../models_events_event_model/Event-class.md)
4.  startDate property

##### Event class









 talawa 1.0.0+1 
