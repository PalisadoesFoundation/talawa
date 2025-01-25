




eventEndTime property - CreateEventViewModel class - create\_event\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/create\_event\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_create_event_view_model/)
3. [CreateEventViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.html)
4. eventEndTime property

eventEndTime


dark\_mode

light\_mode




# eventEndTime property


dynamic
eventEndTime
getter/setter pair

Event End Time.


## Implementation

```
TimeOfDay eventEndTime = TimeOfDay.now().replacing(
  hour: (TimeOfDay.now().hour + (TimeOfDay.now().minute >= 30 ? 1 : 0)) % 24,
  minute: (TimeOfDay.now().minute + 30) % 60,
);
```

 


1. [talawa](../../index.html)
2. [create\_event\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_create_event_view_model/)
3. [CreateEventViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.html)
4. eventEndTime property

##### CreateEventViewModel class





talawa
1.0.0+1






