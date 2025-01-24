




handleConnection method - AppConnectivity class - connectivity\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/connectivity\_view\_model.dart](../../view_model_connectivity_view_model/view_model_connectivity_view_model-library.html)
3. [AppConnectivity](../../view_model_connectivity_view_model/AppConnectivity-class.html)
4. handleConnection method

handleConnection


dark\_mode

light\_mode




# handleConnection method


Future<void>
handleConnection(

1. List<[ConnectivityResult](https://pub.dev/documentation/connectivity_plus_platform_interface/2.0.1/connectivity_plus_platform_interface/ConnectivityResult.html)> result

)

This function handles the device's connectivity status based on the provided `List<ConnectivityResult>`.

**params**:

* `result`: A `List<ConnectivityResult>` indicating the current connectivity status.

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
2. [connectivity\_view\_model](../../view_model_connectivity_view_model/view_model_connectivity_view_model-library.html)
3. [AppConnectivity](../../view_model_connectivity_view_model/AppConnectivity-class.html)
4. handleConnection method

##### AppConnectivity class





talawa
1.0.0+1






