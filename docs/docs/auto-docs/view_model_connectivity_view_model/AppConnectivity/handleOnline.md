




handleOnline method - AppConnectivity class - connectivity\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/connectivity\_view\_model.dart](../../view_model_connectivity_view_model/view_model_connectivity_view_model-library.html)
3. [AppConnectivity](../../view_model_connectivity_view_model/AppConnectivity-class.html)
4. handleOnline method

handleOnline


dark\_mode

light\_mode




# handleOnline method


Future<void>
handleOnline()

This function handles the actions to be taken when the device is online.

**params**:
None

**returns**:
None


## Implementation

```
Future<void> handleOnline() async {
  isOnline = true;
  showSnackbar(isOnline: true);
  databaseFunctions.init();
  cacheService.offlineActionQueue.getActions().forEach((action) async {
    final result = await action.execute();
    GraphqlExceptionResolver.encounteredExceptionOrError(
      CriticalActionException('action done'),
    );
    debugPrint(result.toString());
  });
}
```

 


1. [talawa](../../index.html)
2. [connectivity\_view\_model](../../view_model_connectivity_view_model/view_model_connectivity_view_model-library.html)
3. [AppConnectivity](../../view_model_connectivity_view_model/AppConnectivity-class.html)
4. handleOnline method

##### AppConnectivity class





talawa
1.0.0+1






