
<div>

# initConnectivity method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]
initConnectivity({

1.  [required
    [[Client](https://pub.dev/documentation/http/1.2.2/http/Client-class.html)]
    client, ]

})



This function initializes connectivity monitoring.

**params**:

-   `client`: An instance of `http.Client` to make the HTTP request.

**returns**: None



## Implementation

``` language-dart
Future<void> initConnectivity({required http.Client client}) async {
  _client = client;
  connectionStatusController = StreamController<List<ConnectivityResult>>();

  /// Listen for future changes in connectivity
  ;
}
```







1.  [talawa](../../index.html)
2.  [connectivity_service](../../services_third_party_service_connectivity_service/)
3.  [ConnectivityService](../../services_third_party_service_connectivity_service/ConnectivityService-class.html)
4.  initConnectivity method

##### ConnectivityService class







