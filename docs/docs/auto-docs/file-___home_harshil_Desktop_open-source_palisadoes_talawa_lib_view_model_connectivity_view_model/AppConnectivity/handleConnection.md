




handleConnection method - AppConnectivity class - connectivity\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/connectivity\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_connectivity_view_model/)
3. [AppConnectivity](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_connectivity_view_model/AppConnectivity-class.html)
4. handleConnection method

handleConnection


dark\_mode

light\_mode




# handleConnection method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
handleConnection(

1. [List](https://api.flutter.dev/flutter/dart-core/List-class.html) result

)

This function handles the device's connectivity status based on the provided [List<ConnectivityResult>](https://api.flutter.dev/flutter/dart-core/List-class.html).

**params**:

* `result`: A [List<ConnectivityResult>](https://api.flutter.dev/flutter/dart-core/List-class.html) indicating the current connectivity status.

**returns**:
None


## Implementation

```
Future<void> handleConnection(List<ConnectivityResult> result) async {
  if (result.any(
    (r) =>
        ![ConnectivityResult.none, ConnectivityResult.bluetooth].contains(r),
  )) {
    handleOnline();
  } else {
    handleOffline();
  }
}
```

 


1. [talawa](../../index.html)
2. [connectivity\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_connectivity_view_model/)
3. [AppConnectivity](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_connectivity_view_model/AppConnectivity-class.html)
4. handleConnection method

##### AppConnectivity class





talawa
1.0.0+1






