




initialise method - ProgressDialogViewModel class - progress\_dialog\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/widgets\_view\_models/progress\_dialog\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_progress_dialog_view_model/)
3. [ProgressDialogViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_progress_dialog_view_model/ProgressDialogViewModel-class.html)
4. initialise method

initialise


dark\_mode

light\_mode




# initialise method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
initialise()

Initializes the state of the component by checking the online status and updating the view accordingly.

This method performs the following actions:

1. Sets the view state to busy to indicate that an initialization process is underway.
2. Checks the online status of the application.
   * If the app is offline, it sets the `connectivityPresent` flag to `false`.
   * If the app is online, it sets the `connectivityPresent` flag to `true`.
3. Updates the view state to idle after the online status check is complete.

**params**:
None

**returns**:
None


## Implementation

```
Future<void> initialise() async {
  setState(ViewState.busy);
  if (!AppConnectivity.isOnline) {
    connectivityPresent = false;
  } else {
    connectivityPresent = true;
  }
  setState(ViewState.idle);
}
```

 


1. [talawa](../../index.html)
2. [progress\_dialog\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_progress_dialog_view_model/)
3. [ProgressDialogViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_progress_dialog_view_model/ProgressDialogViewModel-class.html)
4. initialise method

##### ProgressDialogViewModel class





talawa
1.0.0+1






