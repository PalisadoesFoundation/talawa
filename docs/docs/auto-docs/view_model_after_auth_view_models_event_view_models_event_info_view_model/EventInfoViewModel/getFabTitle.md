




getFabTitle method - EventInfoViewModel class - event\_info\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/event\_info\_view\_model.dart](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/view_model_after_auth_view_models_event_view_models_event_info_view_model-library.html)
3. [EventInfoViewModel](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.html)
4. getFabTitle method

getFabTitle


dark\_mode

light\_mode




# getFabTitle method


String
getFabTitle()

The funtion returns title to be displayed on Floating Action Button.

**params**:
None

**returns**:

* `String`: Returns the title to be displayed on Floating Action Button.

## Implementation

```
String getFabTitle() {
  if (event.isRegisterable == false) {
    return "Not Registrable";
  } else if (event.isRegistered == true) {
    return "Registered";
  } else {
    return "Register";
  }
}
```

 


1. [talawa](../../index.html)
2. [event\_info\_view\_model](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/view_model_after_auth_view_models_event_view_models_event_info_view_model-library.html)
3. [EventInfoViewModel](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.html)
4. getFabTitle method

##### EventInfoViewModel class





talawa
1.0.0+1






