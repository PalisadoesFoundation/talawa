
<div>

# SetUrlViewModel class

</div>


SetUrlViewModel class helps to interact with model to serve data.

and react to user\'s input for Set Url Section. Methods include:

-   `checkURLandNavigate`
-   `scanQR`
-   `initialise`
-   `checkURLandNavigate`
-   `checkURLandShowPopUp`
-   `scanQR`
-   `_onQRViewCreated`




Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.md)
    -   SetUrlViewModel



## Constructors

[SetUrlViewModel](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/SetUrlViewModel.md)

:   



## Properties

[[formKey](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/formKey.md)] [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[FormState](https://api.flutter.dev/flutter/widgets/FormState-class.html)]\>]]
:   formKey.
    ::: features
    final
    :::

[[greeting](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/greeting.md)] [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]]\>]]
:   qrController.
    ::: features
    getter/setter pair
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

[[orgId](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/orgId.md)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   organizationID.
    ::: features
    getter/setter pair
    :::

[[qrKey](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/qrKey.md)] [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[State](https://api.flutter.dev/flutter/widgets/State-class.html)[\<[[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)]\>]]\>]]
:   qrKey.
    ::: features
    final
    :::

[[result](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/result.md)] [↔ [Barcode](https://pub.dev/documentation/qr_code_scanner_plus/2.0.9+1/qr_code_scanner_plus/Barcode-class.html)]
:   qrText.
    ::: features
    getter/setter pair
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

[[url](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/url.md)] [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]
:   url.
    ::: features
    getter/setter pair
    :::

[[urlFocus](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/urlFocus.md)] [↔ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)]
:   urlFocus.
    ::: features
    getter/setter pair
    :::

[[validate](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/validate.md)] [↔ [AutovalidateMode](https://api.flutter.dev/flutter/widgets/AutovalidateMode.html)]
:   qrValidator.
    ::: features
    getter/setter pair
    :::



## Methods

[[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)] listener]) → void ]
:   Register a closure to be called when the object changes.
    ::: features
    inherited
    :::

[[checkURLandNavigate](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/checkURLandNavigate.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] navigateTo, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] argument]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   This function check the URL and navigate to the respective URL.

[[checkURLandShowPopUp](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/checkURLandShowPopUp.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] argument]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   This function check the URL and navigate to the respective URL.

[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html) [→ void ]
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.md)
    will throw after the object is disposed).
    ::: features
    inherited
    :::

[[initialise](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/initialise.md)][({[[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] inviteUrl = \'\']}) → void ]
:   This function initialises the variables.

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

[[scanQR](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/scanQR.md)][([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)] context]) → void ]
:   This function create a widget which is used to scan the QR-code.

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



## Constants

[[imageUrlKey](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/imageUrlKey-constant.md)] [→ const [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   imageUrlKey.

[[urlKey](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/urlKey-constant.md)] [→ const [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   urlKey.







1.  [talawa](../index.md)
2.  [set_url_view_model](../view_model_pre_auth_view_models_set_url_view_model/)
3.  SetUrlViewModel class

##### set_url_view_model library







