



menu

1.  [talawa](../index.md)
2.  [view_model/pre_auth_view_models/signup_details_view_model.dart](../view_model_pre_auth_view_models_signup_details_view_model/)
3.  SignupDetailsViewModel class


SignupDetailsViewModel


 dark_mode   light_mode 




<div>

# SignupDetailsViewModel class

</div>


SignupDetailsViewModel class helps to interact with model to serve data
and react to user\'s input for Sign Up Details section.

Methods include:

-   `signUp`




Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.md)
    -   SignupDetailsViewModel



## Constructors

[SignupDetailsViewModel](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/SignupDetailsViewModel.md)

:   



## Properties

[[confirmFocus](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/confirmFocus.md)] [↔ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)]
:   FocusNode to manage focus for the confirmation password input field.
    ::: features
    getter/setter pair
    :::

[[confirmPassword](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/confirmPassword.md)] [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]
:   TextEditingController for handling confirmation password input
    field.
    ::: features
    getter/setter pair
    :::

[[email](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/email.md)] [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]
:   TextEditingController for handling email input field.
    ::: features
    getter/setter pair
    :::

[[firstName](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/firstName.md)] [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]
:   TextEditingController for handling first name input field.
    ::: features
    getter/setter pair
    :::

[[formKey](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/formKey.md)] [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[FormState](https://api.flutter.dev/flutter/widgets/FormState-class.html)]\>]]
:   GlobalKey to identify and manage the state of a form widget.
    ::: features
    final
    :::

[[greeting](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/greeting.md)] [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]]\>]]
:   List of maps to store greeting information, where each greeting is
    represented by a map with String keys and dynamic values.
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

[[hidePassword](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/hidePassword.md)] [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   Boolean to toggle password visibility (true for hidden, false for
    visible).
    ::: features
    getter/setter pair
    :::

[[isBusy](../view_model_base_view_model/BaseModel/isBusy.md)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]

:   ::: features
    no setterinherited
    :::

[[lastName](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/lastName.md)] [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]
:   TextEditingController for handling last name input field.
    ::: features
    getter/setter pair
    :::

[[password](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/password.md)] [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]
:   TextEditingController for handling password input field.
    ::: features
    getter/setter pair
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::

[[secureStorage](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/secureStorage.md)] [↔ [FlutterSecureStorage](https://pub.dev/documentation/flutter_secure_storage/9.2.4/flutter_secure_storage/FlutterSecureStorage-class.html)]
:   Secure local storage instance.
    ::: features
    getter/setter pair
    :::

[[selectedOrganization](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/selectedOrganization.md)] [↔ [OrgInfo](../models_organization_org_info/OrgInfo-class.md)]
:   Represents information about the selected organization.
    ::: features
    getter/setter pair
    :::

[[state](../view_model_base_view_model/BaseModel/state.md)] [→ [ViewState](../enums_enums/ViewState.md)]

:   ::: features
    no setterinherited
    :::

[[validate](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/validate.md)] [↔ [AutovalidateMode](https://api.flutter.dev/flutter/widgets/AutovalidateMode.html)]
:   AutovalidateMode to determine when to perform automatic validation
    of form fields.
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

[[initialise](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/initialise.md)][([[[OrgInfo](../models_organization_org_info/OrgInfo-class.md)] org]) → void ]
:   Initializes the greeting message for a selected organization.

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

[[signUp](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/signUp.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Initiates the sign-up process.

[[storingCredentialsInSecureStorage](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/storingCredentialsInSecureStorage.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
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
2.  [signup_details_view_model](../view_model_pre_auth_view_models_signup_details_view_model/)
3.  SignupDetailsViewModel class

##### signup_details_view_model library









 talawa 1.0.0+1 
