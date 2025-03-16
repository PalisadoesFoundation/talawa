
<div>

# eventEndTime property

</div>


[TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html)
eventEndTime


getter/setter pair




Event End Time.



## Implementation

``` language-dart
TimeOfDay eventEndTime = TimeOfDay..replacing(
  hour: (TimeOfDay..hour + (TimeOfDay..minute >= 30 ? 1 : 0)) % 24,
  minute: (TimeOfDay..minute + 30) % 60,
);
```







1.  [talawa](../../index.md)
2.  [create_event_view_model](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/)
3.  [CreateEventViewModel](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.md)
4.  eventEndTime property

##### CreateEventViewModel class







