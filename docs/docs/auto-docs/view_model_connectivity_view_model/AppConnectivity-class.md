
<div>

# AppConnectivity class

</div>


This class provides services related to network connectivity monitoring
and handling.

It leverages the `connectivity` package to track the device\'s internet
connection status. It offers methods to:

-   Initialize the AppConnectivity:
    [initialise](../view_model_connectivity_view_model/AppConnectivity/initialise.md)
-   Subscribe to connectivity changes:
    [enableSubscription](../view_model_connectivity_view_model/AppConnectivity/enableSubscription.md)
-   Handle online and offline states:
    [handleOnline](../view_model_connectivity_view_model/AppConnectivity/handleOnline.md),
    [handleOffline](../view_model_connectivity_view_model/AppConnectivity/handleOffline.md)
-   Handle the device\'s overall connectivity status:
    [handleConnection](../view_model_connectivity_view_model/AppConnectivity/handleConnection.md)
-   Triggers the snackbar UI to show online status.:
    [showSnackbar](../view_model_connectivity_view_model/AppConnectivity/showSnackbar.md)




Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.md)
    -   AppConnectivity



## Constructors

[AppConnectivity](../view_model_connectivity_view_model/AppConnectivity/AppConnectivity.md)

:   



## Properties

[[connectivityStream](../view_model_connectivity_view_model/AppConnectivity/connectivityStream.md)] [↔ [Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[ConnectivityResult](https://pub.dev/documentation/connectivity_plus_platform_interface/2.0.1/connectivity_plus_platform_interface/ConnectivityResult.html)]\>]]\>]]
:   Stream from
    [ConnectivityService](../services_third_party_service_connectivity_service/ConnectivityService-class.md).
    ::: features
    latefinal
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   Whether any listeners are currently registered.
    ::: features
    no setterinherited
    :::

[[isBusy](../view_model_base_view_model/BaseModel/isBusy.md)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]

:   ::: features
    no setterinherited
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::

[[state](../view_model_base_view_model/BaseModel/state.md)] [→ [ViewState](../enums_enums/ViewState.md)]

:   ::: features
    no setterinherited
    :::



## Methods

[[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)] listener]) → void ]
:   Register a closure to be called when the object changes.
    ::: features
    inherited
    :::

[dispose](../view_model_connectivity_view_model/AppConnectivity/dispose.md) [→ void ]
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.md)
    will throw after the object is disposed).
    ::: features
    override
    :::

[enableSubscription](../view_model_connectivity_view_model/AppConnectivity/enableSubscription.md) [→ void ]
:   Subscribes to
    [connectivityStream](../view_model_connectivity_view_model/AppConnectivity/connectivityStream.md)
    of
    [ConnectivityService](../services_third_party_service_connectivity_service/ConnectivityService-class.md).

[[handleConnection](../view_model_connectivity_view_model/AppConnectivity/handleConnection.md)][([[[List](https://api.flutter.dev/flutter/dart-core/List-class.md)[\<[[ConnectivityResult](https://pub.dev/documentation/connectivity_plus_platform_interface/2.0.1/connectivity_plus_platform_interface/ConnectivityResult.html)]\>]] result]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   This function handles the device\'s connectivity status based on the
    provided
    [List\<ConnectivityResult\>](https://api.flutter.dev/flutter/dart-core/List-class.html).

[[handleOffline](../view_model_connectivity_view_model/AppConnectivity/handleOffline.md)][() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   This function handles the actions to be taken when the device is
    offline.

[[handleOnline](../view_model_connectivity_view_model/AppConnectivity/handleOnline.md)][() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   This function handles the actions to be taken when the device is
    online.

[[initialise](../view_model_connectivity_view_model/AppConnectivity/initialise.md)][() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Initializes the
    [AppConnectivity](../view_model_connectivity_view_model/AppConnectivity-class.md).

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html) [→ void ]
:   Call all the registered listeners.
    ::: features
    inherited
    :::

[[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)] listener]) → void ]
:   Remove a previously registered closure from the list of closures
    that are notified when the object changes.
    ::: features
    inherited
    :::

[[setState](../view_model_base_view_model/BaseModel/setState.md)][([[[ViewState](../enums_enums/ViewState.md)] viewState]) → void ]

:   ::: features
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



## Static Properties

[[isOnline](../view_model_connectivity_view_model/AppConnectivity/isOnline.md)] [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   flag to handle online status.
    ::: features
    getter/setter pair
    :::



## Static Methods

[[showSnackbar](../view_model_connectivity_view_model/AppConnectivity/showSnackbar.md)][({[required [[bool](https://api.flutter.dev/flutter/dart-core/bool-class.md)] isOnline]}) → void ]
:   Triggers the snackbar UI to show online status.







1.  [talawa](../index.md)
2.  [connectivity_view_model](../view_model_connectivity_view_model/)
3.  AppConnectivity class

##### connectivity_view_model library







