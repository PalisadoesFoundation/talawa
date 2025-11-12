



menu

1.  [talawa](../../index.md)
2.  [models/events/event_model.dart](../../models_events_event_model/)
3.  [Event](../../models_events_event_model/Event-class.md)
4.  endDate property


endDate


 dark_mode   light_mode 




<div>

# endDate property

</div>



[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
get endDate



Computed property: formatted end date (e.g. \"2025-07-31\").



## Implementation

``` language-dart
String? get endDate =>
    endAt != null ? DateFormat('yyyy-MM-dd').format(endAt!) : null;
```








1.  [talawa](../../index.md)
2.  [event_model](../../models_events_event_model/)
3.  [Event](../../models_events_event_model/Event-class.md)
4.  endDate property

##### Event class









 talawa 1.0.0+1 
