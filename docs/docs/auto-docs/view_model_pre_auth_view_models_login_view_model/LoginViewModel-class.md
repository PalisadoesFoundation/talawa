




LoginViewModel class - login\_view\_model library - Dart API







menu

1. [talawa](../index.html)
2. [view\_model/pre\_auth\_view\_models/login\_view\_model.dart](../view_model_pre_auth_view_models_login_view_model/view_model_pre_auth_view_models_login_view_model-library.html)
3. LoginViewModel class

LoginViewModel


dark\_mode

light\_mode




# LoginViewModel class


LoginViewModel class helps to interact with model to serve data.

Reacts to user's input in Login View.

Methods include:

* `login`

Inheritance

* Object
* [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
* [BaseModel](../view_model_base_view_model/BaseModel-class.html)
* LoginViewModel



## Constructors

[LoginViewModel](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/LoginViewModel.html)()




## Properties

[email](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/email.html)
↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)

TextEditingController for handling email input field.
getter/setter pair

[emailFocus](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/emailFocus.html)
↔ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)

FocusNode to manage focus for the email input field.
getter/setter pair

[formKey](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/formKey.html)
→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<[FormState](https://api.flutter.dev/flutter/widgets/FormState-class.html)>

GlobalKey to identify and manage the state of a form widget.
final

[greeting](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/greeting.html)
↔ List<Map<String, dynamic>>

List of maps to store greetings..
getter/setter pair

[hashCode](https://api.flutter.dev/flutter/foundation/Listenable/hashCode.html)
→ int

The hash code for this object.
no setterinherited

[hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html)
→ bool

Whether any listeners are currently registered.
no setterinherited

[hidePassword](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/hidePassword.html)
↔ bool

Toggles password visibility (true for hidden, false for visible).
getter/setter pair

[isBusy](../view_model_base_view_model/BaseModel/isBusy.html)
→ bool

no setterinherited

[password](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/password.html)
↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)

TextEditingController for handling password input field.
getter/setter pair

[passwordFocus](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/passwordFocus.html)
↔ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)

FocusNode to manage focus for the password input field.
getter/setter pair

[prevUserEmail](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/prevUserEmail.html)
↔ String?

This field store previous user Email.
getter/setter pair

[prevUserPassword](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/prevUserPassword.html)
↔ String?

This field store previous user Password.
getter/setter pair

[runtimeType](https://api.flutter.dev/flutter/foundation/Listenable/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited

[secureStorage](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/secureStorage.html)
↔ [FlutterSecureStorage](https://pub.dev/documentation/flutter_secure_storage/9.2.2/flutter_secure_storage/FlutterSecureStorage-class.html)

Secure local storage instance.
getter/setter pair

[state](../view_model_base_view_model/BaseModel/state.html)
→ [ViewState](../enums_enums/ViewState.html)

no setterinherited

[validate](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/validate.html)
↔ [AutovalidateMode](https://api.flutter.dev/flutter/widgets/AutovalidateMode.html)

Determines when to perform automatic validation of form fields.
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

[fetchPrevUser](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/fetchPrevUser.html)()
→ Future<void>


Fetch the previous user credentials.

[initialize](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/initialize.html)()
→ void


Initializes the greeting message.

[login](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/login.html)()
→ Future<void>


Performs the login operation.

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

[storingCredentialsInSecureStorage](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/storingCredentialsInSecureStorage.html)()
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
2. [login\_view\_model](../view_model_pre_auth_view_models_login_view_model/view_model_pre_auth_view_models_login_view_model-library.html)
3. LoginViewModel class

##### login\_view\_model library





talawa
1.0.0+1






