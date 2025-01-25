




getConnectionType method - ConnectivityService class - connectivity\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/third\_party\_service/connectivity\_service.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_third_party_service_connectivity_service/)
3. [ConnectivityService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_third_party_service_connectivity_service/ConnectivityService-class.html)
4. getConnectionType method

getConnectionType


dark\_mode

light\_mode




# getConnectionType method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<[List](https://api.flutter.dev/flutter/dart-core/List-class.html)>
getConnectionType()

Checks the current internet connectivity status of the device.

**params**:
None

**returns**:

* `Future<List<ConnectivityResult>>`: indicates if the url is reachable.

## Implementation

```
Future<List<ConnectivityResult>> getConnectionType() async {
  final result = await connectivity.checkConnectivity();
  return result;
}
```

 


1. [talawa](../../index.html)
2. [connectivity\_service](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_third_party_service_connectivity_service/)
3. [ConnectivityService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_third_party_service_connectivity_service/ConnectivityService-class.html)
4. getConnectionType method

##### ConnectivityService class





talawa
1.0.0+1






