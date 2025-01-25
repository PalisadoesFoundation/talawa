




ConnectivityService class - connectivity\_service library - Dart API







menu

1. [talawa](../index.html)
2. [services/third\_party\_service/connectivity\_service.dart](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_third_party_service_connectivity_service/)
3. ConnectivityService class

ConnectivityService


dark\_mode

light\_mode




# ConnectivityService class


This class provides services related to network connectivity monitoring and handling.

It includes methods for:

* Initializing the network service - [initConnectivity](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_third_party_service_connectivity_service/ConnectivityService/initConnectivity.html)
* Monitoring connectivity changes - [enableSubscription](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_third_party_service_connectivity_service/ConnectivityService/enableSubscription.html)
* Handling online and offline states - `handleOnline`, `handleOffline`
* Checking reachability of a given URI - [isReachable](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_third_party_service_connectivity_service/ConnectivityService/isReachable.html)
* Handling the device's connectivity status - `handleConnection`
* Checking if the device has any type of network connection - [hasConnection](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_third_party_service_connectivity_service/ConnectivityService/hasConnection.html)

## Constructors

[ConnectivityService](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_third_party_service_connectivity_service/ConnectivityService/ConnectivityService.html)(dynamic connectivityInstance)




## Properties

[connectionStatusController](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_third_party_service_connectivity_service/ConnectivityService/connectionStatusController.html)
↔ [StreamController](https://api.flutter.dev/flutter/dart-async/StreamController-class.html)<[List](https://api.flutter.dev/flutter/dart-core/List-class.html)>

Stream controller for network status changes.
getter/setter pair

[connectionStream](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_third_party_service_connectivity_service/ConnectivityService/connectionStream.html)
→ [Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)<[List](https://api.flutter.dev/flutter/dart-core/List-class.html)>

Getter for the stream of connection status changes.
no setter

[connectivityInstance](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_third_party_service_connectivity_service/ConnectivityService/connectivityInstance.html)
↔ dynamic

dependency injection connectivity.
latefinal

[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)
→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)

The hash code for this object.
no setterinherited

[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)
→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)

A representation of the runtime type of the object.
no setterinherited



## Methods

[enableSubscription](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_third_party_service_connectivity_service/ConnectivityService/enableSubscription.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


This function enables the subscription to connectivity changes.

[getConnectionType](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_third_party_service_connectivity_service/ConnectivityService/getConnectionType.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<[List](https://api.flutter.dev/flutter/dart-core/List-class.html)>


Checks the current internet connectivity status of the device.

[hasConnection](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_third_party_service_connectivity_service/ConnectivityService/hasConnection.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)>


This function checks if the device currently has any type of network connection.

[initConnectivity](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_third_party_service_connectivity_service/ConnectivityService/initConnectivity.html)({required dynamic client})
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


This function initializes connectivity monitoring.

[isReachable](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_third_party_service_connectivity_service/ConnectivityService/isReachable.html)({dynamic client, [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? uriString})
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)>


This function checks if a given URI is reachable within a specified timeout period.

[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)()
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


A string representation of this object.
inherited



## Operators

[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other)
→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [connectivity\_service](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_third_party_service_connectivity_service/)
3. ConnectivityService class

##### connectivity\_service library





talawa
1.0.0+1






