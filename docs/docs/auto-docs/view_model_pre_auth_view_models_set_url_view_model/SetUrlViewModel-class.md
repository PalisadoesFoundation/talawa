::::::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_pre_auth_view_models_set_url_view_model/view_model_pre_auth_view_models_set_url_view_model-library-sidebar.html" below-sidebar="view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel-class-sidebar.html"}
<div>

# [SetUrlViewModel]{.kind-class} class

</div>

::: {.section .desc .markdown}
SetUrlViewModel class helps to interact with model to serve data.

and react to user\'s input for Set Url Section. Methods include:

-   `checkURLandNavigate`
-   `scanQR`
-   `initialise`
-   `checkURLandNavigate`
-   `checkURLandShowPopUp`
-   `scanQR`
-   `_onQRViewCreated`
:::

::: section

Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.html)
    -   SetUrlViewModel
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[SetUrlViewModel](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/SetUrlViewModel.html)]{.name}[()]{.signature}

:   
:::

::: {#instance-properties .section .summary .offset-anchor}
## Properties

[[formKey](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/formKey.html)]{.name} [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[FormState](https://api.flutter.dev/flutter/widgets/FormState-class.html)]{.type-parameter}\>]{.signature}]{.signature}
:   formKey.
    ::: features
    [final]{.feature}
    :::

[[greeting](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/greeting.html)]{.name} [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}, [dynamic]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.signature}
:   qrController.
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

[[isBusy](../view_model_base_view_model/BaseModel/isBusy.html)]{.name} [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}

:   ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[orgId](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/orgId.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.signature}
:   organizationID.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[qrKey](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/qrKey.html)]{.name} [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[State](https://api.flutter.dev/flutter/widgets/State-class.html)[\<[[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.signature}
:   qrKey.
    ::: features
    [final]{.feature}
    :::

[[result](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/result.html)]{.name} [↔ [Barcode](https://pub.dev/documentation/qr_code_scanner_plus/2.0.9+1/qr_code_scanner_plus/Barcode-class.html)]{.signature}
:   qrText.
    ::: features
    [getter/setter pair]{.feature}
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

[[url](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/url.html)]{.name} [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]{.signature}
:   url.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[urlFocus](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/urlFocus.html)]{.name} [↔ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)]{.signature}
:   urlFocus.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[validate](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/validate.html)]{.name} [↔ [AutovalidateMode](https://api.flutter.dev/flutter/widgets/AutovalidateMode.html)]{.signature}
:   qrValidator.
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

[[checkURLandNavigate](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/checkURLandNavigate.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [navigateTo]{.parameter-name}, ]{#checkURLandNavigate-param-navigateTo .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [argument]{.parameter-name}]{#checkURLandNavigate-param-argument .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   This function check the URL and navigate to the respective URL.

[[checkURLandShowPopUp](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/checkURLandShowPopUp.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [argument]{.parameter-name}]{#checkURLandShowPopUp-param-argument .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   This function check the URL and navigate to the respective URL.

[[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)
    will throw after the object is disposed).
    ::: features
    [inherited]{.feature}
    :::

[[initialise](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/initialise.html)]{.name}[({[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [inviteUrl]{.parameter-name} = [\'\']{.default-value}]{#initialise-param-inviteUrl .parameter}}) [→ void]{.returntype .parameter} ]{.signature}
:   This function initialises the variables.

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

[[scanQR](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/scanQR.html)]{.name}[([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.type-annotation} [context]{.parameter-name}]{#scanQR-param-context .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   This function create a widget which is used to scan the QR-code.

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

::: {#constants .section .summary .offset-anchor}
## Constants

[[imageUrlKey](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/imageUrlKey-constant.html)]{.name} [→ const [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.signature}
:   imageUrlKey.

[[urlKey](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/urlKey-constant.html)]{.name} [→ const [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.signature}
:   urlKey.
:::
:::::::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [set_url_view_model](../view_model_pre_auth_view_models_set_url_view_model/)
3.  SetUrlViewModel class

##### set_url_view_model library

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
