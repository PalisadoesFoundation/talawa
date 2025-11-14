<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [connectivity_view_model](../view_model_connectivity_view_model/view_model_connectivity_view_model-library.md)
3.  AppConnectivity class

<div class="self-name">

AppConnectivity

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="view_model_connectivity_view_model/view_model_connectivity_view_model-library-sidebar.html"
below-sidebar="view_model_connectivity_view_model/AppConnectivity-class-sidebar.html">

<div>

# <span class="kind-class">AppConnectivity</span> class

</div>

<div class="section desc markdown">

This class provides services related to network connectivity monitoring
and handling.

It leverages the `connectivity` package to track the device's internet
connection status. It offers methods to:

- Initialize the AppConnectivity:
  [initialise](../view_model_connectivity_view_model/AppConnectivity/initialise.md)
- Subscribe to connectivity changes:
  [enableSubscription](../view_model_connectivity_view_model/AppConnectivity/enableSubscription.md)
- Handle online and offline states:
  [handleOnline](../view_model_connectivity_view_model/AppConnectivity/handleOnline.md),
  [handleOffline](../view_model_connectivity_view_model/AppConnectivity/handleOffline.md)
- Handle the device's overall connectivity status:
  [handleConnection](../view_model_connectivity_view_model/AppConnectivity/handleConnection.md)
- Triggers the snackbar UI to show online status.:
  [showSnackbar](../view_model_connectivity_view_model/AppConnectivity/showSnackbar.md)

</div>

<div class="section">

Inheritance  
- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [BaseModel](../view_model_base_view_model/BaseModel-class.md)
- AppConnectivity

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[AppConnectivity](../view_model_connectivity_view_model/AppConnectivity/AppConnectivity.md)</span><span class="signature"></span>  

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[connectivityStream](../view_model_connectivity_view_model/AppConnectivity/connectivityStream.md)</span> <span class="signature">↔ [Stream](https://api.flutter.dev/flutter/dart-async/Stream-class.html)<span class="signature">\<<span class="type-parameter">[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[ConnectivityResult](https://pub.dev/documentation/connectivity_plus_platform_interface/2.0.1/connectivity_plus_platform_interface/ConnectivityResult.html)</span>\></span></span>\></span></span>  
Stream from
[ConnectivityService](../services_third_party_service_connectivity_service/ConnectivityService-class.md).

<div class="features">

<span class="feature">late</span><span class="feature">final</span>

</div>

<span class="name">[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[hasListeners](../view_model_base_view_model/BaseModel/hasListeners.md)</span> <span class="signature">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
Whether any listeners are currently registered.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[isBusy](../view_model_base_view_model/BaseModel/isBusy.md)</span> <span class="signature">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
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

<span class="name">[state](../view_model_base_view_model/BaseModel/state.md)</span> <span class="signature">→ [ViewState](../enums_enums/ViewState.md)</span>  
<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

</div>

<div id="instance-methods" class="section summary offset-anchor">

## Methods

<span class="name">[addListener](../view_model_base_view_model/BaseModel/addListener.md)</span><span class="signature">(<span id="addListener-param-listener" class="parameter"><span class="type-annotation">[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)</span> <span class="parameter-name">listener</span></span>) <span class="returntype parameter">→ void</span> </span>  
Register a closure to be called when the object changes.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[dispose](../view_model_connectivity_view_model/AppConnectivity/dispose.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
[addListener](../view_model_base_view_model/BaseModel/addListener.md)
will throw after the object is disposed).

<span class="name">[enableSubscription](../view_model_connectivity_view_model/AppConnectivity/enableSubscription.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Subscribes to
[connectivityStream](../view_model_connectivity_view_model/AppConnectivity/connectivityStream.md)
of
[ConnectivityService](../services_third_party_service_connectivity_service/ConnectivityService-class.md).

<span class="name">[handleConnection](../view_model_connectivity_view_model/AppConnectivity/handleConnection.md)</span><span class="signature">(<span id="handleConnection-param-result" class="parameter"><span class="type-annotation">[List](https://api.flutter.dev/flutter/dart-core/List-class.md)<span class="signature">\<<span class="type-parameter">[ConnectivityResult](https://pub.dev/documentation/connectivity_plus_platform_interface/2.0.1/connectivity_plus_platform_interface/ConnectivityResult.html)</span>\></span></span> <span class="parameter-name">result</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
This function handles the device's connectivity status based on the
provided
[List\<ConnectivityResult\>](https://api.flutter.dev/flutter/dart-core/List-class.html).

<span class="name">[handleOffline](../view_model_connectivity_view_model/AppConnectivity/handleOffline.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
This function handles the actions to be taken when the device is
offline.

<span class="name">[handleOnline](../view_model_connectivity_view_model/AppConnectivity/handleOnline.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
This function handles the actions to be taken when the device is online.

<span class="name">[initialise](../view_model_connectivity_view_model/AppConnectivity/initialise.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Initializes the
[AppConnectivity](../view_model_connectivity_view_model/AppConnectivity-class.md).

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[notifyListeners](../view_model_base_view_model/BaseModel/notifyListeners.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Call all the registered listeners.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[removeListener](../view_model_base_view_model/BaseModel/removeListener.md)</span><span class="signature">(<span id="removeListener-param-listener" class="parameter"><span class="type-annotation">[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)</span> <span class="parameter-name">listener</span></span>) <span class="returntype parameter">→ void</span> </span>  
Remove a previously registered closure from the list of closures that
are notified when the object changes.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[setState](../view_model_base_view_model/BaseModel/setState.md)</span><span class="signature">(<span id="setState-param-viewState" class="parameter"><span class="type-annotation">[ViewState](../enums_enums/ViewState.md)</span> <span class="parameter-name">viewState</span></span>) <span class="returntype parameter">→ void</span> </span>  
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

<div id="static-properties" class="section summary offset-anchor">

## Static Properties

<span class="name">[isOnline](../view_model_connectivity_view_model/AppConnectivity/isOnline.md)</span> <span class="signature">↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
flag to handle online status.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

</div>

<div id="static-methods" class="section summary offset-anchor">

## Static Methods

<span class="name">[showSnackbar](../view_model_connectivity_view_model/AppConnectivity/showSnackbar.md)</span><span class="signature">(<span id="showSnackbar-param-isOnline" class="parameter"></span>) <span class="returntype parameter">→ void</span> </span>  
Triggers the snackbar UI to show online status.

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../index.md)
2.  [connectivity_view_model](../view_model_connectivity_view_model/view_model_connectivity_view_model-library.md)
3.  AppConnectivity class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
