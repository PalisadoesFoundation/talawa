




LoginViewModel class - login\_view\_model library - Dart API







menu

1. [talawa](../index.html)
2. [view\_model/pre\_auth\_view\_models/login\_view\_model.dart](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_login_view_model/)
3. LoginViewModel class

LoginViewModel


dark\_mode

light\_mode




# LoginViewModel class


LoginViewModel class helps to interact with model to serve data.

Reacts to user's input in Login View.

Methods include:

* `login`

## Constructors

[LoginViewModel](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_login_view_model/LoginViewModel/LoginViewModel.html)()




## Properties

[email](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_login_view_model/LoginViewModel/email.html)
↔ dynamic

TextEditingController for handling email input field.
getter/setter pair

[emailFocus](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_login_view_model/LoginViewModel/emailFocus.html)
↔ dynamic

FocusNode to manage focus for the email input field.
getter/setter pair

[formKey](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_login_view_model/LoginViewModel/formKey.html)
→ dynamic

GlobalKey to identify and manage the state of a form widget.
final

[greeting](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_login_view_model/LoginViewModel/greeting.html)
↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic>>

List of maps to store greetings..
getter/setter pair

[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)
→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)

The hash code for this object.
no setterinherited

[hidePassword](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_login_view_model/LoginViewModel/hidePassword.html)
↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)

Toggles password visibility (true for hidden, false for visible).
getter/setter pair

[password](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_login_view_model/LoginViewModel/password.html)
↔ dynamic

TextEditingController for handling password input field.
getter/setter pair

[passwordFocus](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_login_view_model/LoginViewModel/passwordFocus.html)
↔ dynamic

FocusNode to manage focus for the password input field.
getter/setter pair

[prevUserEmail](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_login_view_model/LoginViewModel/prevUserEmail.html)
↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?

This field store previous user Email.
getter/setter pair

[prevUserPassword](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_login_view_model/LoginViewModel/prevUserPassword.html)
↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?

This field store previous user Password.
getter/setter pair

[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)
→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)

A representation of the runtime type of the object.
no setterinherited

[secureStorage](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_login_view_model/LoginViewModel/secureStorage.html)
↔ dynamic

Secure local storage instance.
getter/setter pair

[validate](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_login_view_model/LoginViewModel/validate.html)
↔ dynamic

Determines when to perform automatic validation of form fields.
getter/setter pair



## Methods

[fetchPrevUser](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_login_view_model/LoginViewModel/fetchPrevUser.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Fetch the previous user credentials.

[initialize](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_login_view_model/LoginViewModel/initialize.html)()
→ void


Initializes the greeting message.

[login](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_login_view_model/LoginViewModel/login.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Performs the login operation.

[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[storingCredentialsInSecureStorage](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_login_view_model/LoginViewModel/storingCredentialsInSecureStorage.html)()
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
2. [login\_view\_model](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_login_view_model/)
3. LoginViewModel class

##### login\_view\_model library





talawa
1.0.0+1






