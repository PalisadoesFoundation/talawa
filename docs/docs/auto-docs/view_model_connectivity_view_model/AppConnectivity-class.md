::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../index.html)
2.  [view_model/connectivity_view_model.dart](../view_model_connectivity_view_model/)
3.  AppConnectivity class

::: self-name
AppConnectivity
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_connectivity_view_model/view_model_connectivity_view_model-library-sidebar.html" below-sidebar="view_model_connectivity_view_model/AppConnectivity-class-sidebar.html"}
<div>

# [AppConnectivity]{.kind-class} class

</div>

::: {.section .desc .markdown}
This class provides services related to network connectivity monitoring
and handling.

It leverages the `connectivity` package to track the device\'s internet
connection status. It offers methods to:

-   Initialize the AppConnectivity:
    [initialise](../view_model_connectivity_view_model/AppConnectivity/initialise.html)
-   Subscribe to connectivity changes:
    [enableSubscription](../view_model_connectivity_view_model/AppConnectivity/enableSubscription.html)
-   Handle online and offline states:
    [handleOnline](../view_model_connectivity_view_model/AppConnectivity/handleOnline.html),
    [handleOffline](../view_model_connectivity_view_model/AppConnectivity/handleOffline.html)
-   Handle the device\'s overall connectivity status:
    [handleConnection](../view_model_connectivity_view_model/AppConnectivity/handleConnection.html)
-   Triggers the snackbar UI to show online status.:
    [showSnackbar](../view_model_connectivity_view_model/AppConnectivity/showSnackbar.html)
:::

::: section

Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.html)
    -   AppConnectivity
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[AppConnectivity](../view_model_connectivity_view_model/AppConnectivity/AppConnectivity.html)]{.name}[()]{.signature}

:   
:::

::: {#instance-properties .section .summary .offset-anchor}
## Properties

[[connectivityStream](../view_model_connectivity_view_model/AppConnectivity/connectivityStream.html)]{.name} [↔ [Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[ConnectivityResult](https://pub.dev/documentation/connectivity_plus_platform_interface/2.0.1/connectivity_plus_platform_interface/ConnectivityResult.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.signature}
:   Stream from
    [ConnectivityService](../services_third_party_service_connectivity_service/ConnectivityService-class.html).
    ::: features
    [late]{.feature}[final]{.feature}
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)]{.name} [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.signature}
:   The hash code for this object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html)]{.name} [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}
:   Whether any listeners are currently registered.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[isBusy](../view_model_base_view_model/BaseModel/isBusy.html)]{.name} [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}

:   ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)]{.name} [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]{.signature}
:   A representation of the runtime type of the object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[state](../view_model_base_view_model/BaseModel/state.html)]{.name} [→ [ViewState](../enums_enums/ViewState.html)]{.signature}

:   ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::
:::

::: {#instance-methods .section .summary .offset-anchor}
## Methods

[[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)]{.name}[([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)]{.type-annotation} [listener]{.parameter-name}]{#addListener-param-listener .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Register a closure to be called when the object changes.
    ::: features
    [inherited]{.feature}
    :::

[[dispose](../view_model_connectivity_view_model/AppConnectivity/dispose.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)
    will throw after the object is disposed).
    ::: features
    [override]{.feature}
    :::

[[enableSubscription](../view_model_connectivity_view_model/AppConnectivity/enableSubscription.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Subscribes to
    [connectivityStream](../view_model_connectivity_view_model/AppConnectivity/connectivityStream.html)
    of
    [ConnectivityService](../services_third_party_service_connectivity_service/ConnectivityService-class.html).

[[handleConnection](../view_model_connectivity_view_model/AppConnectivity/handleConnection.html)]{.name}[([[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[ConnectivityResult](https://pub.dev/documentation/connectivity_plus_platform_interface/2.0.1/connectivity_plus_platform_interface/ConnectivityResult.html)]{.type-parameter}\>]{.signature}]{.type-annotation} [result]{.parameter-name}]{#handleConnection-param-result .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   This function handles the device\'s connectivity status based on the
    provided
    [List\<ConnectivityResult\>](https://api.flutter.dev/flutter/dart-core/List-class.html).

[[handleOffline](../view_model_connectivity_view_model/AppConnectivity/handleOffline.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   This function handles the actions to be taken when the device is
    offline.

[[handleOnline](../view_model_connectivity_view_model/AppConnectivity/handleOnline.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   This function handles the actions to be taken when the device is
    online.

[[initialise](../view_model_connectivity_view_model/AppConnectivity/initialise.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Initializes the
    [AppConnectivity](../view_model_connectivity_view_model/AppConnectivity-class.html).

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)]{.name}[([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)]{.type-annotation} [invocation]{.parameter-name}]{#noSuchMethod-param-invocation .parameter}) [→ dynamic]{.returntype .parameter} ]{.signature}
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    [inherited]{.feature}
    :::

[[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Call all the registered listeners.
    ::: features
    [inherited]{.feature}
    :::

[[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)]{.name}[([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)]{.type-annotation} [listener]{.parameter-name}]{#removeListener-param-listener .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Remove a previously registered closure from the list of closures
    that are notified when the object changes.
    ::: features
    [inherited]{.feature}
    :::

[[setState](../view_model_base_view_model/BaseModel/setState.html)]{.name}[([[[ViewState](../enums_enums/ViewState.html)]{.type-annotation} [viewState]{.parameter-name}]{#setState-param-viewState .parameter}) [→ void]{.returntype .parameter} ]{.signature}

:   ::: features
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

::: {#static-properties .section .summary .offset-anchor}
## Static Properties

[[isOnline](../view_model_connectivity_view_model/AppConnectivity/isOnline.html)]{.name} [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}
:   flag to handle online status.
    ::: features
    [getter/setter pair]{.feature}
    :::
:::

::: {#static-methods .section .summary .offset-anchor}
## Static Methods

[[showSnackbar](../view_model_connectivity_view_model/AppConnectivity/showSnackbar.html)]{.name}[({[required [[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-annotation} [isOnline]{.parameter-name}]{#showSnackbar-param-isOnline .parameter}}) [→ void]{.returntype .parameter} ]{.signature}
:   Triggers the snackbar UI to show online status.
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [connectivity_view_model](../view_model_connectivity_view_model/)
3.  AppConnectivity class

##### connectivity_view_model library

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
