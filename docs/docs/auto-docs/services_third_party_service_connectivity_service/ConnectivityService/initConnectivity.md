




initConnectivity method - ConnectivityService class - connectivity\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/third\_party\_service/connectivity\_service.dart](../../services_third_party_service_connectivity_service/services_third_party_service_connectivity_service-library.html)
3. [ConnectivityService](../../services_third_party_service_connectivity_service/ConnectivityService-class.html)
4. initConnectivity method

initConnectivity


dark\_mode

light\_mode




# initConnectivity method


Future<void>
initConnectivity({

1. required [Client](https://pub.dev/documentation/http/1.2.2/http/Client-class.html) client,

})

This function initializes connectivity monitoring.

**params**:

* `client`: An instance of `http.Client` to make the HTTP request.

**returns**:
None


## Implementation

```
Future<void> initConnectivity({required http.Client client}) async {
  _client = client;
  connectionStatusController = StreamController<List<ConnectivityResult>>();

  /// Listen for future changes in connectivity
  enableSubscription();
}
```

 


1. [talawa](../../index.html)
2. [connectivity\_service](../../services_third_party_service_connectivity_service/services_third_party_service_connectivity_service-library.html)
3. [ConnectivityService](../../services_third_party_service_connectivity_service/ConnectivityService-class.html)
4. initConnectivity method

##### ConnectivityService class





talawa
1.0.0+1






