




ConnectivityService class - connectivity\_service library - Dart API







menu

1. [talawa](../index.html)
2. [services/third\_party\_service/connectivity\_service.dart](../services_third_party_service_connectivity_service/services_third_party_service_connectivity_service-library.html)
3. ConnectivityService class

ConnectivityService


dark\_mode

light\_mode




# ConnectivityService class


This class provides services related to network connectivity monitoring and handling.

It includes methods for:

* Initializing the network service - [initConnectivity](../services_third_party_service_connectivity_service/ConnectivityService/initConnectivity.html)
* Monitoring connectivity changes - [enableSubscription](../services_third_party_service_connectivity_service/ConnectivityService/enableSubscription.html)
* Handling online and offline states - `handleOnline`, `handleOffline`
* Checking reachability of a given URI - [isReachable](../services_third_party_service_connectivity_service/ConnectivityService/isReachable.html)
* Handling the device's connectivity status - `handleConnection`
* Checking if the device has any type of network connection - [hasConnection](../services_third_party_service_connectivity_service/ConnectivityService/hasConnection.html)

## Constructors

[ConnectivityService](../services_third_party_service_connectivity_service/ConnectivityService/ConnectivityService.html)([Connectivity](https://pub.dev/documentation/connectivity_plus/6.1.1/connectivity_plus/Connectivity-class.html) connectivityInstance)




## Properties

[connectionStatusController](../services_third_party_service_connectivity_service/ConnectivityService/connectionStatusController.html)
↔ StreamController<List<[ConnectivityResult](https://pub.dev/documentation/connectivity_plus_platform_interface/2.0.1/connectivity_plus_platform_interface/ConnectivityResult.html)>>

Stream controller for network status changes.
getter/setter pair

[connectionStream](../services_third_party_service_connectivity_service/ConnectivityService/connectionStream.html)
→ Stream<List<[ConnectivityResult](https://pub.dev/documentation/connectivity_plus_platform_interface/2.0.1/connectivity_plus_platform_interface/ConnectivityResult.html)>>

Getter for the stream of connection status changes.
no setter

[connectivityInstance](../services_third_party_service_connectivity_service/ConnectivityService/connectivityInstance.html)
↔ [Connectivity](https://pub.dev/documentation/connectivity_plus/6.1.1/connectivity_plus/Connectivity-class.html)

dependency injection connectivity.
latefinal

[hashCode](../services_third_party_service_connectivity_service/ConnectivityService/hashCode.html)
→ int

The hash code for this object.
no setterinherited

[runtimeType](../services_third_party_service_connectivity_service/ConnectivityService/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited



## Methods

[enableSubscription](../services_third_party_service_connectivity_service/ConnectivityService/enableSubscription.html)()
→ Future<void>


This function enables the subscription to connectivity changes.

[getConnectionType](../services_third_party_service_connectivity_service/ConnectivityService/getConnectionType.html)()
→ Future<List<[ConnectivityResult](https://pub.dev/documentation/connectivity_plus_platform_interface/2.0.1/connectivity_plus_platform_interface/ConnectivityResult.html)>>


Checks the current internet connectivity status of the device.

[hasConnection](../services_third_party_service_connectivity_service/ConnectivityService/hasConnection.html)()
→ Future<bool>


This function checks if the device currently has any type of network connection.

[initConnectivity](../services_third_party_service_connectivity_service/ConnectivityService/initConnectivity.html)({required [Client](https://pub.dev/documentation/http/1.2.2/http/Client-class.html) client})
→ Future<void>


This function initializes connectivity monitoring.

[isReachable](../services_third_party_service_connectivity_service/ConnectivityService/isReachable.html)({[Client](https://pub.dev/documentation/http/1.2.2/http/Client-class.html)? client, String? uriString})
→ Future<bool>


This function checks if a given URI is reachable within a specified timeout period.

[noSuchMethod](../services_third_party_service_connectivity_service/ConnectivityService/noSuchMethod.html)(Invocation invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[toString](../services_third_party_service_connectivity_service/ConnectivityService/toString.html)()
→ String


A string representation of this object.
inherited



## Operators

[operator ==](../services_third_party_service_connectivity_service/ConnectivityService/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [connectivity\_service](../services_third_party_service_connectivity_service/services_third_party_service_connectivity_service-library.html)
3. ConnectivityService class

##### connectivity\_service library





talawa
1.0.0+1






