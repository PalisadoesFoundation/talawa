




setEventEndDate method - CreateEventViewModel class - create\_event\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/create\_event\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_create_event_view_model/)
3. [CreateEventViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.html)
4. setEventEndDate method

setEventEndDate


dark\_mode

light\_mode




# setEventEndDate method


void
setEventEndDate(

1. [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html) selectedEndDate

)

Updates the event end date to selected event end date.

**params**:

* `selectedEndDate`: new event end date selected by user.

**returns**:
None


## Implementation

```
void setEventEndDate(DateTime selectedEndDate) {
  eventEndDate = selectedEndDate;
  notifyListeners();
}
```

 


1. [talawa](../../index.html)
2. [create\_event\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_create_event_view_model/)
3. [CreateEventViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.html)
4. setEventEndDate method

##### CreateEventViewModel class





talawa
1.0.0+1






