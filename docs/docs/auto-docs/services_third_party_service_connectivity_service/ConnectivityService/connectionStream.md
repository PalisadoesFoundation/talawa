




connectionStream property - ConnectivityService class - connectivity\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/third\_party\_service/connectivity\_service.dart](../../services_third_party_service_connectivity_service/services_third_party_service_connectivity_service-library.html)
3. [ConnectivityService](../../services_third_party_service_connectivity_service/ConnectivityService-class.html)
4. connectionStream property

connectionStream


dark\_mode

light\_mode




# connectionStream property


Stream<List<[ConnectivityResult](https://pub.dev/documentation/connectivity_plus_platform_interface/2.0.1/connectivity_plus_platform_interface/ConnectivityResult.html)>>
get
connectionStream

Getter for the stream of connection status changes.


## Implementation

```
Stream<List<ConnectivityResult>> get connectionStream =>
    connectionStatusController.stream;
```


 


1. [talawa](../../index.html)
2. [connectivity\_service](../../services_third_party_service_connectivity_service/services_third_party_service_connectivity_service-library.html)
3. [ConnectivityService](../../services_third_party_service_connectivity_service/ConnectivityService-class.html)
4. connectionStream property

##### ConnectivityService class





talawa
1.0.0+1






