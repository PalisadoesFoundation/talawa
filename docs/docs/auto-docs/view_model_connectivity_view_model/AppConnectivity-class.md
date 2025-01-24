




AppConnectivity class - connectivity\_view\_model library - Dart API







menu

1. [talawa](../index.html)
2. [view\_model/connectivity\_view\_model.dart](../view_model_connectivity_view_model/view_model_connectivity_view_model-library.html)
3. AppConnectivity class

AppConnectivity


dark\_mode

light\_mode




# AppConnectivity class


This class provides services related to network connectivity monitoring and handling.

It leverages the `connectivity` package to track the device's internet connection status.
It offers methods to:

* Initialize the AppConnectivity: [initialise](../view_model_connectivity_view_model/AppConnectivity/initialise.html)
* Subscribe to connectivity changes: [enableSubscription](../view_model_connectivity_view_model/AppConnectivity/enableSubscription.html)
* Handle online and offline states: [handleOnline](../view_model_connectivity_view_model/AppConnectivity/handleOnline.html), [handleOffline](../view_model_connectivity_view_model/AppConnectivity/handleOffline.html)
* Handle the device's overall connectivity status: [handleConnection](../view_model_connectivity_view_model/AppConnectivity/handleConnection.html)
* Triggers the snackbar UI to show online status.: [showSnackbar](../view_model_connectivity_view_model/AppConnectivity/showSnackbar.html)

Inheritance

* Object
* [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
* [BaseModel](../view_model_base_view_model/BaseModel-class.html)
* AppConnectivity



## Constructors

[AppConnectivity](../view_model_connectivity_view_model/AppConnectivity/AppConnectivity.html)()




## Properties

[connectivityStream](../view_model_connectivity_view_model/AppConnectivity/connectivityStream.html)
↔ Stream<List<[ConnectivityResult](https://pub.dev/documentation/connectivity_plus_platform_interface/2.0.1/connectivity_plus_platform_interface/ConnectivityResult.html)>>

Stream from [ConnectivityService](../services_third_party_service_connectivity_service/ConnectivityService-class.html).
latefinal

[hashCode](https://api.flutter.dev/flutter/foundation/Listenable/hashCode.html)
→ int

The hash code for this object.
no setterinherited

[hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html)
→ bool

Whether any listeners are currently registered.
no setterinherited

[isBusy](../view_model_base_view_model/BaseModel/isBusy.html)
→ bool

no setterinherited

[runtimeType](https://api.flutter.dev/flutter/foundation/Listenable/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited

[state](../view_model_base_view_model/BaseModel/state.html)
→ [ViewState](../enums_enums/ViewState.html)

no setterinherited



## Methods

[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener)
→ void


Register a closure to be called when the object changes.
inherited

[dispose](../view_model_connectivity_view_model/AppConnectivity/dispose.html)()
→ void


Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html) will throw after the object is disposed).
override

[enableSubscription](../view_model_connectivity_view_model/AppConnectivity/enableSubscription.html)()
→ void


Subscribes to [connectivityStream](../view_model_connectivity_view_model/AppConnectivity/connectivityStream.html) of [ConnectivityService](../services_third_party_service_connectivity_service/ConnectivityService-class.html).

[handleConnection](../view_model_connectivity_view_model/AppConnectivity/handleConnection.html)(List<[ConnectivityResult](https://pub.dev/documentation/connectivity_plus_platform_interface/2.0.1/connectivity_plus_platform_interface/ConnectivityResult.html)> result)
→ Future<void>


This function handles the device's connectivity status based on the provided `List<ConnectivityResult>`.

[handleOffline](../view_model_connectivity_view_model/AppConnectivity/handleOffline.html)()
→ Future<void>


This function handles the actions to be taken when the device is offline.

[handleOnline](../view_model_connectivity_view_model/AppConnectivity/handleOnline.html)()
→ Future<void>


This function handles the actions to be taken when the device is online.

[initialise](../view_model_connectivity_view_model/AppConnectivity/initialise.html)()
→ Future<void>


Initializes the [AppConnectivity](../view_model_connectivity_view_model/AppConnectivity-class.html).

[noSuchMethod](https://api.flutter.dev/flutter/foundation/Listenable/noSuchMethod.html)(Invocation invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)()
→ void


Call all the registered listeners.
inherited

[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener)
→ void


Remove a previously registered closure from the list of closures that are
notified when the object changes.
inherited

[setState](../view_model_base_view_model/BaseModel/setState.html)([ViewState](../enums_enums/ViewState.html) viewState)
→ void


inherited

[toString](https://api.flutter.dev/flutter/foundation/Listenable/toString.html)()
→ String


A string representation of this object.
inherited



## Operators

[operator ==](https://api.flutter.dev/flutter/foundation/Listenable/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



## Static Properties

[isOnline](../view_model_connectivity_view_model/AppConnectivity/isOnline.html)
↔ bool

flag to handle online status.
getter/setter pair



## Static Methods

[showSnackbar](../view_model_connectivity_view_model/AppConnectivity/showSnackbar.html)({required bool isOnline})
→ void


Triggers the snackbar UI to show online status.



 


1. [talawa](../index.html)
2. [connectivity\_view\_model](../view_model_connectivity_view_model/view_model_connectivity_view_model-library.html)
3. AppConnectivity class

##### connectivity\_view\_model library





talawa
1.0.0+1






