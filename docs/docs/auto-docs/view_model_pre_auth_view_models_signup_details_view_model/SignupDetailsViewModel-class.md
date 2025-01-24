




SignupDetailsViewModel class - signup\_details\_view\_model library - Dart API







menu

1. [talawa](../index.html)
2. [view\_model/pre\_auth\_view\_models/signup\_details\_view\_model.dart](../view_model_pre_auth_view_models_signup_details_view_model/view_model_pre_auth_view_models_signup_details_view_model-library.html)
3. SignupDetailsViewModel class

SignupDetailsViewModel


dark\_mode

light\_mode




# SignupDetailsViewModel class


SignupDetailsViewModel class helps to interact with model to serve data and react to user's input for Sign Up Details section.

Methods include:

* `signUp`

Inheritance

* Object
* [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
* [BaseModel](../view_model_base_view_model/BaseModel-class.html)
* SignupDetailsViewModel



## Constructors

[SignupDetailsViewModel](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/SignupDetailsViewModel.html)()




## Properties

[confirmFocus](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/confirmFocus.html)
↔ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)

FocusNode to manage focus for the confirmation password input field.
getter/setter pair

[confirmPassword](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/confirmPassword.html)
↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)

TextEditingController for handling confirmation password input field.
getter/setter pair

[email](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/email.html)
↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)

TextEditingController for handling email input field.
getter/setter pair

[firstName](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/firstName.html)
↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)

TextEditingController for handling first name input field.
getter/setter pair

[formKey](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/formKey.html)
→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<[FormState](https://api.flutter.dev/flutter/widgets/FormState-class.html)>

GlobalKey to identify and manage the state of a form widget.
final

[greeting](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/greeting.html)
↔ List<Map<String, dynamic>>

List of maps to store greeting information, where each greeting is represented by a map with String keys and dynamic values.
getter/setter pair

[hashCode](https://api.flutter.dev/flutter/foundation/Listenable/hashCode.html)
→ int

The hash code for this object.
no setterinherited

[hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html)
→ bool

Whether any listeners are currently registered.
no setterinherited

[hidePassword](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/hidePassword.html)
↔ bool

Boolean to toggle password visibility (true for hidden, false for visible).
getter/setter pair

[isBusy](../view_model_base_view_model/BaseModel/isBusy.html)
→ bool

no setterinherited

[lastName](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/lastName.html)
↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)

TextEditingController for handling last name input field.
getter/setter pair

[password](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/password.html)
↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)

TextEditingController for handling password input field.
getter/setter pair

[runtimeType](https://api.flutter.dev/flutter/foundation/Listenable/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited

[secureStorage](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/secureStorage.html)
↔ [FlutterSecureStorage](https://pub.dev/documentation/flutter_secure_storage/9.2.2/flutter_secure_storage/FlutterSecureStorage-class.html)

Secure local storage instance.
getter/setter pair

[selectedOrganization](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/selectedOrganization.html)
↔ [OrgInfo](../models_organization_org_info/OrgInfo-class.html)

Represents information about the selected organization.
getter/setter pair

[state](../view_model_base_view_model/BaseModel/state.html)
→ [ViewState](../enums_enums/ViewState.html)

no setterinherited

[validate](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/validate.html)
↔ [AutovalidateMode](https://api.flutter.dev/flutter/widgets/AutovalidateMode.html)

AutovalidateMode to determine when to perform automatic validation of form fields.
getter/setter pair



## Methods

[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener)
→ void


Register a closure to be called when the object changes.
inherited

[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html)()
→ void


Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html) will throw after the object is disposed).
inherited

[initialise](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/initialise.html)([OrgInfo](../models_organization_org_info/OrgInfo-class.html) org)
→ void


Initializes the greeting message for a selected organization.

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

[signUp](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/signUp.html)()
→ Future<void>


Initiates the sign-up process.

[storingCredentialsInSecureStorage](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/storingCredentialsInSecureStorage.html)()
→ Future<void>


Storing credentials in secure storage.

[toString](https://api.flutter.dev/flutter/foundation/Listenable/toString.html)()
→ String


A string representation of this object.
inherited



## Operators

[operator ==](https://api.flutter.dev/flutter/foundation/Listenable/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [signup\_details\_view\_model](../view_model_pre_auth_view_models_signup_details_view_model/view_model_pre_auth_view_models_signup_details_view_model-library.html)
3. SignupDetailsViewModel class

##### signup\_details\_view\_model library





talawa
1.0.0+1






