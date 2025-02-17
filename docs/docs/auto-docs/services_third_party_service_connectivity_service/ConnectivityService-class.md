
<div>

# ConnectivityService class

</div>


This class provides services related to network connectivity monitoring
and handling.

It includes methods for:

-   Initializing the network service -
    [initConnectivity](../services_third_party_service_connectivity_service/ConnectivityService/initConnectivity.md)
-   Monitoring connectivity changes -
    [enableSubscription](../services_third_party_service_connectivity_service/ConnectivityService/enableSubscription.md)
-   Handling online and offline states - `handleOnline`, `handleOffline`
-   Checking reachability of a given URI -
    [isReachable](../services_third_party_service_connectivity_service/ConnectivityService/isReachable.md)
-   Handling the device\'s connectivity status - `handleConnection`
-   Checking if the device has any type of network connection -
    [hasConnection](../services_third_party_service_connectivity_service/ConnectivityService/hasConnection.md)



## Constructors

[[ConnectivityService](../services_third_party_service_connectivity_service/ConnectivityService/ConnectivityService.md)][([[[Connectivity](https://pub.dev/documentation/connectivity_plus/6.1.2/connectivity_plus/Connectivity-class.md)] connectivityInstance])]

:   



## Properties

[[connectionStatusController](../services_third_party_service_connectivity_service/ConnectivityService/connectionStatusController.md)] [↔ [StreamController](https://api.flutter.dev/flutter/dart-async/StreamController-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[ConnectivityResult](https://pub.dev/documentation/connectivity_plus_platform_interface/2.0.1/connectivity_plus_platform_interface/ConnectivityResult.html)]\>]]\>]]
:   Stream controller for network status changes.
    ::: features
    getter/setter pair
    :::

[[connectionStream](../services_third_party_service_connectivity_service/ConnectivityService/connectionStream.md)] [→ [Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[ConnectivityResult](https://pub.dev/documentation/connectivity_plus_platform_interface/2.0.1/connectivity_plus_platform_interface/ConnectivityResult.html)]\>]]\>]]
:   Getter for the stream of connection status changes.
    ::: features
    no setter
    :::

[[connectivityInstance](../services_third_party_service_connectivity_service/ConnectivityService/connectivityInstance.md)] [↔ [Connectivity](https://pub.dev/documentation/connectivity_plus/6.1.2/connectivity_plus/Connectivity-class.html)]
:   dependency injection connectivity.
    ::: features
    latefinal
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::



## Methods

[[enableSubscription](../services_third_party_service_connectivity_service/ConnectivityService/enableSubscription.md)][() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   This function enables the subscription to connectivity changes.

[[getConnectionType](../services_third_party_service_connectivity_service/ConnectivityService/getConnectionType.md)][() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[ConnectivityResult](https://pub.dev/documentation/connectivity_plus_platform_interface/2.0.1/connectivity_plus_platform_interface/ConnectivityResult.html)]\>]]\>]] ]
:   Checks the current internet connectivity status of the device.

[[hasConnection](../services_third_party_service_connectivity_service/ConnectivityService/hasConnection.md)][() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]\>]] ]
:   This function checks if the device currently has any type of network
    connection.

[[initConnectivity](../services_third_party_service_connectivity_service/ConnectivityService/initConnectivity.md)][({[required [[Client](https://pub.dev/documentation/http/1.2.2/http/Client-class.md)] client]}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   This function initializes connectivity monitoring.

[[isReachable](../services_third_party_service_connectivity_service/ConnectivityService/isReachable.md)][({[[[Client](https://pub.dev/documentation/http/1.2.2/http/Client-class.md)?] client, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?] uriString]}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]\>]] ]
:   This function checks if a given URI is reachable within a specified
    timeout period.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.md)
2.  [connectivity_service](../services_third_party_service_connectivity_service/)
3.  ConnectivityService class

##### connectivity_service library







