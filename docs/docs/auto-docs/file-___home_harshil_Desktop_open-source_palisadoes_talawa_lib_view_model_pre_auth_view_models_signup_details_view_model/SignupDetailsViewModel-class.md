




SignupDetailsViewModel class - signup\_details\_view\_model library - Dart API







menu

1. [talawa](../index.html)
2. [view\_model/pre\_auth\_view\_models/signup\_details\_view\_model.dart](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_signup_details_view_model/)
3. SignupDetailsViewModel class

SignupDetailsViewModel


dark\_mode

light\_mode




# SignupDetailsViewModel class


SignupDetailsViewModel class helps to interact with model to serve data and react to user's input for Sign Up Details section.

Methods include:

* `signUp`

## Constructors

[SignupDetailsViewModel](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/SignupDetailsViewModel.html)()




## Properties

[confirmFocus](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/confirmFocus.html)
↔ dynamic

FocusNode to manage focus for the confirmation password input field.
getter/setter pair

[confirmPassword](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/confirmPassword.html)
↔ dynamic

TextEditingController for handling confirmation password input field.
getter/setter pair

[email](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/email.html)
↔ dynamic

TextEditingController for handling email input field.
getter/setter pair

[firstName](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/firstName.html)
↔ dynamic

TextEditingController for handling first name input field.
getter/setter pair

[formKey](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/formKey.html)
→ dynamic

GlobalKey to identify and manage the state of a form widget.
final

[greeting](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/greeting.html)
↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic>>

List of maps to store greeting information, where each greeting is represented by a map with String keys and dynamic values.
getter/setter pair

[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)
→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)

The hash code for this object.
no setterinherited

[hidePassword](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/hidePassword.html)
↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)

Boolean to toggle password visibility (true for hidden, false for visible).
getter/setter pair

[lastName](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/lastName.html)
↔ dynamic

TextEditingController for handling last name input field.
getter/setter pair

[password](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/password.html)
↔ dynamic

TextEditingController for handling password input field.
getter/setter pair

[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)
→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)

A representation of the runtime type of the object.
no setterinherited

[secureStorage](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/secureStorage.html)
↔ dynamic

Secure local storage instance.
getter/setter pair

[selectedOrganization](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/selectedOrganization.html)
↔ dynamic

Represents information about the selected organization.
getter/setter pair

[validate](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/validate.html)
↔ dynamic

AutovalidateMode to determine when to perform automatic validation of form fields.
getter/setter pair



## Methods

[initialise](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/initialise.html)(dynamic org)
→ void


Initializes the greeting message for a selected organization.

[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[signUp](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/signUp.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Initiates the sign-up process.

[storingCredentialsInSecureStorage](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel/storingCredentialsInSecureStorage.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Storing credentials in secure storage.

[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)()
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


A string representation of this object.
inherited



## Operators

[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other)
→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [signup\_details\_view\_model](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_signup_details_view_model/)
3. SignupDetailsViewModel class

##### signup\_details\_view\_model library





talawa
1.0.0+1






