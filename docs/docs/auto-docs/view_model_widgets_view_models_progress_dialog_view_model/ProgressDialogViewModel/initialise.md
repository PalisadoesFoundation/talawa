
<div>

# initialise method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]




Initializes the state of the component by checking the online status and
updating the view accordingly.

This method performs the following actions:

1.  Sets the view state to busy to indicate that an initialization
    process is underway.
2.  Checks the online status of the application.
    -   If the app is offline, it sets the `connectivityPresent` flag to
        `false`.
    -   If the app is online, it sets the `connectivityPresent` flag to
        `true`.
3.  Updates the view state to idle after the online status check is
    complete.

**params**: None

**returns**: None



## Implementation

``` language-dart
Future<void>  async {
  setState(ViewState.busy);
  if (!AppConnectivity.isOnline) {
    connectivityPresent = false;
  } else {
    connectivityPresent = true;
  }
  setState(ViewState.idle);
}
```







1.  [talawa](../../index.md)
2.  [progress_dialog_view_model](../../view_model_widgets_view_models_progress_dialog_view_model/)
3.  [ProgressDialogViewModel](../../view_model_widgets_view_models_progress_dialog_view_model/ProgressDialogViewModel-class.md)
4.  initialise method

##### ProgressDialogViewModel class







