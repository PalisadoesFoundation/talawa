
<div>

# enableSubscription method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]




This function enables the subscription to connectivity changes.

**params**: None

**returns**: None



## Implementation

``` language-dart
Future<void>  async {
  connectivityInstance.onConnectivityChanged.listen(
    (List<ConnectivityResult> result) {
      print(result);
      connectionStatusController.add(result);
    },
    onError: (error) {
      // Handle errors during listening for changes
      print('Error listening for connectivity changes: $error');
    },
  );
}
```







1.  [talawa](../../index.html)
2.  [connectivity_service](../../services_third_party_service_connectivity_service/)
3.  [ConnectivityService](../../services_third_party_service_connectivity_service/ConnectivityService-class.html)
4.  enableSubscription method

##### ConnectivityService class







