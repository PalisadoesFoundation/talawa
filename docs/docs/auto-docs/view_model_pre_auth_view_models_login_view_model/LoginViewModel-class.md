:::::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_pre_auth_view_models_login_view_model/view_model_pre_auth_view_models_login_view_model-library-sidebar.html" below-sidebar="view_model_pre_auth_view_models_login_view_model/LoginViewModel-class-sidebar.html"}
<div>

# [LoginViewModel]{.kind-class} class

</div>

::: {.section .desc .markdown}
LoginViewModel class helps to interact with model to serve data.

Reacts to user\'s input in Login View.

Methods include:

-   `login`
:::

::: section

Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.html)
    -   LoginViewModel
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[LoginViewModel](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/LoginViewModel.html)]{.name}[()]{.signature}

:   
:::

::: {#instance-properties .section .summary .offset-anchor}
## Properties

[[email](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/email.html)]{.name} [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]{.signature}
:   TextEditingController for handling email input field.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[emailFocus](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/emailFocus.html)]{.name} [↔ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)]{.signature}
:   FocusNode to manage focus for the email input field.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[formKey](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/formKey.html)]{.name} [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[FormState](https://api.flutter.dev/flutter/widgets/FormState-class.html)]{.type-parameter}\>]{.signature}]{.signature}
:   GlobalKey to identify and manage the state of a form widget.
    ::: features
    [final]{.feature}
    :::

[[greeting](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/greeting.html)]{.name} [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}, [dynamic]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.signature}
:   List of maps to store greetings..
    ::: features
    [getter/setter pair]{.feature}
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

[[hidePassword](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/hidePassword.html)]{.name} [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}
:   Toggles password visibility (true for hidden, false for visible).
    ::: features
    [getter/setter pair]{.feature}
    :::

[[isBusy](../view_model_base_view_model/BaseModel/isBusy.html)]{.name} [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}

:   ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[password](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/password.html)]{.name} [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]{.signature}
:   TextEditingController for handling password input field.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[passwordFocus](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/passwordFocus.html)]{.name} [↔ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)]{.signature}
:   FocusNode to manage focus for the password input field.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[prevUserEmail](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/prevUserEmail.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.signature}
:   This field store previous user Email.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[prevUserPassword](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/prevUserPassword.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.signature}
:   This field store previous user Password.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)]{.name} [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]{.signature}
:   A representation of the runtime type of the object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[secureStorage](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/secureStorage.html)]{.name} [↔ [FlutterSecureStorage](https://pub.dev/documentation/flutter_secure_storage/9.2.4/flutter_secure_storage/FlutterSecureStorage-class.html)]{.signature}
:   Secure local storage instance.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[state](../view_model_base_view_model/BaseModel/state.html)]{.name} [→ [ViewState](../enums_enums/ViewState.html)]{.signature}

:   ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[validate](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/validate.html)]{.name} [↔ [AutovalidateMode](https://api.flutter.dev/flutter/widgets/AutovalidateMode.html)]{.signature}
:   Determines when to perform automatic validation of form fields.
    ::: features
    [getter/setter pair]{.feature}
    :::
:::

::: {#instance-methods .section .summary .offset-anchor}
## Methods

[[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)]{.name}[([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)]{.type-annotation} [listener]{.parameter-name}]{#addListener-param-listener .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Register a closure to be called when the object changes.
    ::: features
    [inherited]{.feature}
    :::

[[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)
    will throw after the object is disposed).
    ::: features
    [inherited]{.feature}
    :::

[[fetchPrevUser](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/fetchPrevUser.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Fetch the previous user credentials.

[[initialize](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/initialize.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Initializes the greeting message.

[[login](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/login.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Performs the login operation.

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

[[storingCredentialsInSecureStorage](../view_model_pre_auth_view_models_login_view_model/LoginViewModel/storingCredentialsInSecureStorage.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Storing credentials in secure storage.

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
::::::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [login_view_model](../view_model_pre_auth_view_models_login_view_model/)
3.  LoginViewModel class

##### login_view_model library

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
