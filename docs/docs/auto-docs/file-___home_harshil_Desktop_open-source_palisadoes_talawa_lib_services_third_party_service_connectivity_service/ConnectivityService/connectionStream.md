




connectionStream property - ConnectivityService class - connectivity\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/third\_party\_service/connectivity\_service.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_third_party_service_connectivity_service/)
3. [ConnectivityService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_third_party_service_connectivity_service/ConnectivityService-class.html)
4. connectionStream property

connectionStream


dark\_mode

light\_mode




# connectionStream property


[Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)<[List](https://api.flutter.dev/flutter/dart-core/List-class.html)>
get
connectionStream

Getter for the stream of connection status changes.


## Implementation

```
Stream<List<ConnectivityResult>> get connectionStream =>
    connectionStatusController.stream;
```


 


1. [talawa](../../index.html)
2. [connectivity\_service](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_third_party_service_connectivity_service/)
3. [ConnectivityService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_third_party_service_connectivity_service/ConnectivityService-class.html)
4. connectionStream property

##### ConnectivityService class





talawa
1.0.0+1






