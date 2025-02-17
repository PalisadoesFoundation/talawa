
<div>

# getFabTitle method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]




The funtion returns title to be displayed on Floating Action Button.

**params**: None

**returns**:

-   `String`: Returns the title to be displayed on Floating Action
    Button.



## Implementation

``` language-dart
String  {
  if (event.isRegisterable == false) {
    return "Not Registrable";
  } else if (event.isRegistered == true) {
    return "Registered";
  } else {
    return "Register";
  }
}
```







1.  [talawa](../../index.md)
2.  [event_info_view_model](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/)
3.  [EventInfoViewModel](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.md)
4.  getFabTitle method

##### EventInfoViewModel class







