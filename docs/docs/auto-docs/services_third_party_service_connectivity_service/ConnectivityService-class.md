::::::::: {#dartdoc-main-content .main-content above-sidebar="services_third_party_service_connectivity_service/services_third_party_service_connectivity_service-library-sidebar.html" below-sidebar="services_third_party_service_connectivity_service/ConnectivityService-class-sidebar.html"}
<div>

# [ConnectivityService]{.kind-class} class

</div>

::: {.section .desc .markdown}
This class provides services related to network connectivity monitoring
and handling.

It includes methods for:

-   Initializing the network service -
    [initConnectivity](../services_third_party_service_connectivity_service/ConnectivityService/initConnectivity.html)
-   Monitoring connectivity changes -
    [enableSubscription](../services_third_party_service_connectivity_service/ConnectivityService/enableSubscription.html)
-   Handling online and offline states - `handleOnline`, `handleOffline`
-   Checking reachability of a given URI -
    [isReachable](../services_third_party_service_connectivity_service/ConnectivityService/isReachable.html)
-   Handling the device\'s connectivity status - `handleConnection`
-   Checking if the device has any type of network connection -
    [hasConnection](../services_third_party_service_connectivity_service/ConnectivityService/hasConnection.html)
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[ConnectivityService](../services_third_party_service_connectivity_service/ConnectivityService/ConnectivityService.html)]{.name}[([[[Connectivity](https://pub.dev/documentation/connectivity_plus/6.1.2/connectivity_plus/Connectivity-class.html)]{.type-annotation} [connectivityInstance]{.parameter-name}]{#-param-connectivityInstance .parameter})]{.signature}

:   
:::

::: {#instance-properties .section .summary .offset-anchor}
## Properties

[[connectionStatusController](../services_third_party_service_connectivity_service/ConnectivityService/connectionStatusController.html)]{.name} [↔ [StreamController](https://api.flutter.dev/flutter/dart-async/StreamController-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[ConnectivityResult](https://pub.dev/documentation/connectivity_plus_platform_interface/2.0.1/connectivity_plus_platform_interface/ConnectivityResult.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.signature}
:   Stream controller for network status changes.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[connectionStream](../services_third_party_service_connectivity_service/ConnectivityService/connectionStream.html)]{.name} [→ [Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[ConnectivityResult](https://pub.dev/documentation/connectivity_plus_platform_interface/2.0.1/connectivity_plus_platform_interface/ConnectivityResult.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.signature}
:   Getter for the stream of connection status changes.
    ::: features
    [no setter]{.feature}
    :::

[[connectivityInstance](../services_third_party_service_connectivity_service/ConnectivityService/connectivityInstance.html)]{.name} [↔ [Connectivity](https://pub.dev/documentation/connectivity_plus/6.1.2/connectivity_plus/Connectivity-class.html)]{.signature}
:   dependency injection connectivity.
    ::: features
    [late]{.feature}[final]{.feature}
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)]{.name} [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.signature}
:   The hash code for this object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)]{.name} [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]{.signature}
:   A representation of the runtime type of the object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::
:::

::: {#instance-methods .section .summary .offset-anchor}
## Methods

[[enableSubscription](../services_third_party_service_connectivity_service/ConnectivityService/enableSubscription.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   This function enables the subscription to connectivity changes.

[[getConnectionType](../services_third_party_service_connectivity_service/ConnectivityService/getConnectionType.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[ConnectivityResult](https://pub.dev/documentation/connectivity_plus_platform_interface/2.0.1/connectivity_plus_platform_interface/ConnectivityResult.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Checks the current internet connectivity status of the device.

[[hasConnection](../services_third_party_service_connectivity_service/ConnectivityService/hasConnection.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   This function checks if the device currently has any type of network
    connection.

[[initConnectivity](../services_third_party_service_connectivity_service/ConnectivityService/initConnectivity.html)]{.name}[({[required [[Client](https://pub.dev/documentation/http/1.2.2/http/Client-class.html)]{.type-annotation} [client]{.parameter-name}]{#initConnectivity-param-client .parameter}}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   This function initializes connectivity monitoring.

[[isReachable](../services_third_party_service_connectivity_service/ConnectivityService/isReachable.html)]{.name}[({[[[Client](https://pub.dev/documentation/http/1.2.2/http/Client-class.html)?]{.type-annotation} [client]{.parameter-name}, ]{#isReachable-param-client .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation} [uriString]{.parameter-name}]{#isReachable-param-uriString .parameter}}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   This function checks if a given URI is reachable within a specified
    timeout period.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)]{.name}[([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)]{.type-annotation} [invocation]{.parameter-name}]{#noSuchMethod-param-invocation .parameter}) [→ dynamic]{.returntype .parameter} ]{.signature}
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    [inherited]{.feature}
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   A string representation of this object.
    ::: features
    [inherited]{.feature}
    :::
:::

::: {#operators .section .summary .offset-anchor .inherited}
## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)]{.name}[([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)]{.type-annotation} [other]{.parameter-name}]{#==-param-other .parameter}) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.returntype .parameter} ]{.signature}
:   The equality operator.
    ::: features
    [inherited]{.feature}
    :::
:::
:::::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [connectivity_service](../services_third_party_service_connectivity_service/)
3.  ConnectivityService class

##### connectivity_service library

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
