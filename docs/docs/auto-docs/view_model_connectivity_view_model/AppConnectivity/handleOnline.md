
<div>

# handleOnline method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]




This function handles the actions to be taken when the device is online.

**params**: None

**returns**: None



## Implementation

``` language-dart
Future<void>  async {
  isOnline = true;
  showSnackbar(isOnline: true);
  databaseFunctions.;
  cacheService.offlineActionQueue..forEach((action) async {
    final result = await action.;
    GraphqlExceptionResolver.encounteredExceptionOrError(
      CriticalActionException('action done'),
    );
    debugPrint(result.);
  });
}
```







1.  [talawa](../../index.md)
2.  [connectivity_view_model](../../view_model_connectivity_view_model/)
3.  [AppConnectivity](../../view_model_connectivity_view_model/AppConnectivity-class.md)
4.  handleOnline method

##### AppConnectivity class







