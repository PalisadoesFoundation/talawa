




getConnectionType method - ConnectivityService class - connectivity\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/third\_party\_service/connectivity\_service.dart](../../services_third_party_service_connectivity_service/services_third_party_service_connectivity_service-library.html)
3. [ConnectivityService](../../services_third_party_service_connectivity_service/ConnectivityService-class.html)
4. getConnectionType method

getConnectionType


dark\_mode

light\_mode




# getConnectionType method


Future<List<[ConnectivityResult](https://pub.dev/documentation/connectivity_plus_platform_interface/2.0.1/connectivity_plus_platform_interface/ConnectivityResult.html)>>
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
2. [connectivity\_service](../../services_third_party_service_connectivity_service/services_third_party_service_connectivity_service-library.html)
3. [ConnectivityService](../../services_third_party_service_connectivity_service/ConnectivityService-class.html)
4. getConnectionType method

##### ConnectivityService class





talawa
1.0.0+1






