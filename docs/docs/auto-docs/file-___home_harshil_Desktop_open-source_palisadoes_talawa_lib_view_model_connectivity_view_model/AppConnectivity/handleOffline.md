




handleOffline method - AppConnectivity class - connectivity\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/connectivity\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_connectivity_view_model/)
3. [AppConnectivity](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_connectivity_view_model/AppConnectivity-class.html)
4. handleOffline method

handleOffline


dark\_mode

light\_mode




# handleOffline method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
handleOffline()

This function handles the actions to be taken when the device is offline.

**params**:
None

**returns**:
None


## Implementation

```
Future<void> handleOffline() async {
  isOnline = false;
  showSnackbar(isOnline: false);
  databaseFunctions.init();
}
```

 


1. [talawa](../../index.html)
2. [connectivity\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_connectivity_view_model/)
3. [AppConnectivity](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_connectivity_view_model/AppConnectivity-class.html)
4. handleOffline method

##### AppConnectivity class





talawa
1.0.0+1






