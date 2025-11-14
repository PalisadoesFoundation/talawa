<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [connectivity_service](../services_third_party_service_connectivity_service/services_third_party_service_connectivity_service-library.md)
3.  ConnectivityService class

<div class="self-name">

ConnectivityService

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="services_third_party_service_connectivity_service/services_third_party_service_connectivity_service-library-sidebar.html"
below-sidebar="services_third_party_service_connectivity_service/ConnectivityService-class-sidebar.html">

<div>

# <span class="kind-class">ConnectivityService</span> class

</div>

<div class="section desc markdown">

This class provides services related to network connectivity monitoring
and handling.

It includes methods for:

- Initializing the network service -
  [initConnectivity](../services_third_party_service_connectivity_service/ConnectivityService/initConnectivity.md)
- Monitoring connectivity changes -
  [enableSubscription](../services_third_party_service_connectivity_service/ConnectivityService/enableSubscription.md)
- Handling online and offline states - `handleOnline`, `handleOffline`
- Checking reachability of a given URI -
  [isReachable](../services_third_party_service_connectivity_service/ConnectivityService/isReachable.md)
- Handling the device's connectivity status - `handleConnection`
- Checking if the device has any type of network connection -
  [hasConnection](../services_third_party_service_connectivity_service/ConnectivityService/hasConnection.md)

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[ConnectivityService](../services_third_party_service_connectivity_service/ConnectivityService/ConnectivityService.md)</span><span class="signature">(<span id="-param-connectivityInstance" class="parameter"><span class="type-annotation">[Connectivity](https://pub.dev/documentation/connectivity_plus/6.1.5/connectivity_plus/Connectivity-class.md)</span> <span class="parameter-name">connectivityInstance</span></span>)</span>  

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[connectionStatusController](../services_third_party_service_connectivity_service/ConnectivityService/connectionStatusController.md)</span> <span class="signature">↔ [StreamController](https://api.flutter.dev/flutter/dart-async/StreamController-class.html)<span class="signature">\<<span class="type-parameter">[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[ConnectivityResult](https://pub.dev/documentation/connectivity_plus_platform_interface/2.0.1/connectivity_plus_platform_interface/ConnectivityResult.html)</span>\></span></span>\></span></span>  
Stream controller for network status changes.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[connectionStream](../services_third_party_service_connectivity_service/ConnectivityService/connectionStream.md)</span> <span class="signature">→ [Stream](https://api.flutter.dev/flutter/dart-async/Stream-class.html)<span class="signature">\<<span class="type-parameter">[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[ConnectivityResult](https://pub.dev/documentation/connectivity_plus_platform_interface/2.0.1/connectivity_plus_platform_interface/ConnectivityResult.html)</span>\></span></span>\></span></span>  
Getter for the stream of connection status changes.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[connectivityInstance](../services_third_party_service_connectivity_service/ConnectivityService/connectivityInstance.md)</span> <span class="signature">↔ [Connectivity](https://pub.dev/documentation/connectivity_plus/6.1.5/connectivity_plus/Connectivity-class.html)</span>  
dependency injection connectivity.

<div class="features">

<span class="feature">late</span><span class="feature">final</span>

</div>

<span class="name">[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)</span> <span class="signature">→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)</span>  
A representation of the runtime type of the object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

</div>

<div id="instance-methods" class="section summary offset-anchor">

## Methods

<span class="name">[enableSubscription](../services_third_party_service_connectivity_service/ConnectivityService/enableSubscription.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
This function enables the subscription to connectivity changes.

<span class="name">[getConnectionType](../services_third_party_service_connectivity_service/ConnectivityService/getConnectionType.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[ConnectivityResult](https://pub.dev/documentation/connectivity_plus_platform_interface/2.0.1/connectivity_plus_platform_interface/ConnectivityResult.html)</span>\></span></span>\></span></span> </span>  
Checks the current internet connectivity status of the device.

<span class="name">[hasConnection](../services_third_party_service_connectivity_service/ConnectivityService/hasConnection.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>\></span></span> </span>  
This function checks if the device currently has any type of network
connection.

<span class="name">[initConnectivity](../services_third_party_service_connectivity_service/ConnectivityService/initConnectivity.md)</span><span class="signature">(<span id="initConnectivity-param-client" class="parameter"></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
This function initializes connectivity monitoring.

<span class="name">[isReachable](../services_third_party_service_connectivity_service/ConnectivityService/isReachable.md)</span><span class="signature">(<span id="isReachable-param-client" class="parameter"></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>\></span></span> </span>  
This function checks if a given URI is reachable within a specified
timeout period.

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
A string representation of this object.

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

<div id="operators" class="section summary offset-anchor inherited">

## Operators

<span class="name">[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)</span><span class="signature">(<span id="==-param-other" class="parameter"><span class="type-annotation">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)</span> <span class="parameter-name">other</span></span>) <span class="returntype parameter">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span> </span>  
The equality operator.

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../index.md)
2.  [connectivity_service](../services_third_party_service_connectivity_service/services_third_party_service_connectivity_service-library.md)
3.  ConnectivityService class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
