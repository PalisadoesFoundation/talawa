




AppConnectivity class - connectivity\_view\_model library - Dart API







menu

1. [talawa](../index.html)
2. [view\_model/connectivity\_view\_model.dart](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_connectivity_view_model/)
3. AppConnectivity class

AppConnectivity


dark\_mode

light\_mode




# AppConnectivity class


This class provides services related to network connectivity monitoring and handling.

It leverages the `connectivity` package to track the device's internet connection status.
It offers methods to:

* Initialize the AppConnectivity: [initialise](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_connectivity_view_model/AppConnectivity/initialise.html)
* Subscribe to connectivity changes: [enableSubscription](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_connectivity_view_model/AppConnectivity/enableSubscription.html)
* Handle online and offline states: [handleOnline](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_connectivity_view_model/AppConnectivity/handleOnline.html), [handleOffline](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_connectivity_view_model/AppConnectivity/handleOffline.html)
* Handle the device's overall connectivity status: [handleConnection](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_connectivity_view_model/AppConnectivity/handleConnection.html)
* Triggers the snackbar UI to show online status.: [showSnackbar](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_connectivity_view_model/AppConnectivity/showSnackbar.html)

## Constructors

[AppConnectivity](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_connectivity_view_model/AppConnectivity/AppConnectivity.html)()




## Properties

[connectivityStream](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_connectivity_view_model/AppConnectivity/connectivityStream.html)
↔ [Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)<[List](https://api.flutter.dev/flutter/dart-core/List-class.html)>

Stream from [ConnectivityService](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_third_party_service_connectivity_service/ConnectivityService-class.html).
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

[dispose](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_connectivity_view_model/AppConnectivity/dispose.html)()
→ void



[enableSubscription](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_connectivity_view_model/AppConnectivity/enableSubscription.html)()
→ void


Subscribes to [connectivityStream](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_connectivity_view_model/AppConnectivity/connectivityStream.html) of [ConnectivityService](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_third_party_service_connectivity_service/ConnectivityService-class.html).

[handleConnection](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_connectivity_view_model/AppConnectivity/handleConnection.html)([List](https://api.flutter.dev/flutter/dart-core/List-class.html) result)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


This function handles the device's connectivity status based on the provided [List<ConnectivityResult>](https://api.flutter.dev/flutter/dart-core/List-class.html).

[handleOffline](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_connectivity_view_model/AppConnectivity/handleOffline.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


This function handles the actions to be taken when the device is offline.

[handleOnline](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_connectivity_view_model/AppConnectivity/handleOnline.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


This function handles the actions to be taken when the device is online.

[initialise](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_connectivity_view_model/AppConnectivity/initialise.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Initializes the [AppConnectivity](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_connectivity_view_model/AppConnectivity-class.html).

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



## Static Properties

[isOnline](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_connectivity_view_model/AppConnectivity/isOnline.html)
↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)

flag to handle online status.
getter/setter pair



## Static Methods

[showSnackbar](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_connectivity_view_model/AppConnectivity/showSnackbar.html)({required [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) isOnline})
→ void


Triggers the snackbar UI to show online status.



 


1. [talawa](../index.html)
2. [connectivity\_view\_model](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_connectivity_view_model/)
3. AppConnectivity class

##### connectivity\_view\_model library





talawa
1.0.0+1






