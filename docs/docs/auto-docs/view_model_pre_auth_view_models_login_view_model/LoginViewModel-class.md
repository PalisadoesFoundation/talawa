
<div>

# LoginViewModel class

</div>


LoginViewModel class helps to interact with model to serve data.

Reacts to user\'s input in Login View.

Methods include:

-   `login`




Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.md)
    -   LoginViewModel



## Constructors

[LoginViewModel](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/LoginViewModel.md)

:   



## Properties

[[email](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/email.md)] [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]
:   TextEditingController for handling email input field.
    ::: features
    getter/setter pair
    :::

[[emailFocus](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/emailFocus.md)] [↔ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)]
:   FocusNode to manage focus for the email input field.
    ::: features
    getter/setter pair
    :::

[[formKey](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/formKey.md)] [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[FormState](https://api.flutter.dev/flutter/widgets/FormState-class.html)]\>]]
:   GlobalKey to identify and manage the state of a form widget.
    ::: features
    final
    :::

[[greeting](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/greeting.md)] [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]]\>]]
:   List of maps to store greetings..
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

[[hidePassword](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/hidePassword.md)] [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   Toggles password visibility (true for hidden, false for visible).
    ::: features
    getter/setter pair
    :::

[[isBusy](../view_model_base_view_model/BaseModel/isBusy.md)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]

:   ::: features
    no setterinherited
    :::

[[password](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/password.md)] [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]
:   TextEditingController for handling password input field.
    ::: features
    getter/setter pair
    :::

[[passwordFocus](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/passwordFocus.md)] [↔ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)]
:   FocusNode to manage focus for the password input field.
    ::: features
    getter/setter pair
    :::

[[prevUserEmail](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/prevUserEmail.md)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   This field store previous user Email.
    ::: features
    getter/setter pair
    :::

[[prevUserPassword](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/prevUserPassword.md)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   This field store previous user Password.
    ::: features
    getter/setter pair
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::

[[secureStorage](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/secureStorage.md)] [↔ [FlutterSecureStorage](https://pub.dev/documentation/flutter_secure_storage/9.2.4/flutter_secure_storage/FlutterSecureStorage-class.html)]
:   Secure local storage instance.
    ::: features
    getter/setter pair
    :::

[[state](../view_model_base_view_model/BaseModel/state.md)] [→ [ViewState](../enums_enums/ViewState.md)]

:   ::: features
    no setterinherited
    :::

[[validate](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/validate.md)] [↔ [AutovalidateMode](https://api.flutter.dev/flutter/widgets/AutovalidateMode.html)]
:   Determines when to perform automatic validation of form fields.
    ::: features
    getter/setter pair
    :::



## Methods

[[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)] listener]) → void ]
:   Register a closure to be called when the object changes.
    ::: features
    inherited
    :::

[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html) [→ void ]
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.md)
    will throw after the object is disposed).
    ::: features
    inherited
    :::

[[fetchPrevUser](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/fetchPrevUser.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Fetch the previous user credentials.

[initialize](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/initialize.md) [→ void ]
:   Initializes the greeting message.

[[login](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/login.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Performs the login operation.

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

[[storingCredentialsInSecureStorage](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/storingCredentialsInSecureStorage.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Storing credentials in secure storage.

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][ [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
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
2.  [login_view_model](../view_model_pre_auth_view_models_login_view_model/)
3.  LoginViewModel class

##### login_view_model library







