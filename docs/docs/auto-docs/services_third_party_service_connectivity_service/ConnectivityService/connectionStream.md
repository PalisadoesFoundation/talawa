



menu

1.  [talawa](../../index.md)
2.  [services/third_party_service/connectivity_service.dart](../../services_third_party_service_connectivity_service/)
3.  [ConnectivityService](../../services_third_party_service_connectivity_service/ConnectivityService-class.md)
4.  connectionStream property


connectionStream


 dark_mode   light_mode 




<div>

# connectionStream property

</div>



[[Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[ConnectivityResult](https://pub.dev/documentation/connectivity_plus_platform_interface/2.0.1/connectivity_plus_platform_interface/ConnectivityResult.html)]\>]]\>]]
get connectionStream



Getter for the stream of connection status changes.



## Implementation

``` language-dart
Stream<List<ConnectivityResult>> get connectionStream =>
    connectionStatusController.stream;
```








1.  [talawa](../../index.md)
2.  [connectivity_service](../../services_third_party_service_connectivity_service/)
3.  [ConnectivityService](../../services_third_party_service_connectivity_service/ConnectivityService-class.md)
4.  connectionStream property

##### ConnectivityService class









 talawa 1.0.0+1 
