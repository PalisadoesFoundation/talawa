




initConnectivity method - ConnectivityService class - connectivity\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/third\_party\_service/connectivity\_service.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_third_party_service_connectivity_service/)
3. [ConnectivityService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_third_party_service_connectivity_service/ConnectivityService-class.html)
4. initConnectivity method

initConnectivity


dark\_mode

light\_mode




# initConnectivity method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
initConnectivity({

1. required dynamic client,

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
2. [connectivity\_service](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_third_party_service_connectivity_service/)
3. [ConnectivityService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_third_party_service_connectivity_service/ConnectivityService-class.html)
4. initConnectivity method

##### ConnectivityService class





talawa
1.0.0+1






