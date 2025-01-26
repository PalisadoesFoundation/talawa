::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../index.html)
2.  [view_model/lang_view_model.dart](../view_model_lang_view_model/)
3.  AppLanguage class

::: self-name
AppLanguage
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_lang_view_model/view_model_lang_view_model-library-sidebar.html" below-sidebar="view_model_lang_view_model/AppLanguage-class-sidebar.html"}
<div>

# [AppLanguage]{.kind-class} class

</div>

::: {.section .desc .markdown}
AppLanguage view model class interact with modal in the context of the
App Language.

The class provides methods that set\'s the language, change the language
in the modal.

Methods include:

-   `fetchLocale`
-   `changeLanguage`
-   `selectLanguagePress`
-   `dbLanguageUpdate`
-   `appLanguageQuery`
-   `userLanguageQuery`
:::

::: section

Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.html)
    -   AppLanguage
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[AppLanguage](../view_model_lang_view_model/AppLanguage/AppLanguage.html)]{.name}[({[[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-annotation} [isTest]{.parameter-name} = [false]{.default-value}]{#-param-isTest .parameter}})]{.signature}

:   
:::

::: {#instance-properties .section .summary .offset-anchor}
## Properties

[[appLocal](../view_model_lang_view_model/AppLanguage/appLocal.html)]{.name} [→ [Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.html)]{.signature}
:   getter for appLocal.
    ::: features
    [no setter]{.feature}
    :::

[[databaseFunctions](../view_model_lang_view_model/AppLanguage/databaseFunctions.html)]{.name} [→ [DataBaseMutationFunctions](../services_database_mutation_functions/DataBaseMutationFunctions-class.html)]{.signature}
:   Functions related to database mutations.
    ::: features
    [final]{.feature}
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

[[isTest](../view_model_lang_view_model/AppLanguage/isTest.html)]{.name} [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}
:   Represents a boolean value indicating whether the current
    environment is a test environment.
    ::: features
    [final]{.feature}
    :::

[[navigationService](../view_model_lang_view_model/AppLanguage/navigationService.html)]{.name} [→ [NavigationService](../services_navigation_service/NavigationService-class.html)]{.signature}
:   A service that provides navigation-related functionalities.
    ::: features
    [final]{.feature}
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

[[appLanguageQuery](../view_model_lang_view_model/AppLanguage/appLanguageQuery.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Queries the app language.

[[changeLanguage](../view_model_lang_view_model/AppLanguage/changeLanguage.html)]{.name}[([[[Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.html)]{.type-annotation} [type]{.parameter-name}]{#changeLanguage-param-type .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   This function change the app default language.

[[dbLanguageUpdate](../view_model_lang_view_model/AppLanguage/dbLanguageUpdate.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   This function updates the Database Language by running the graphQL
    `mutations`.

[[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)
    will throw after the object is disposed).
    ::: features
    [inherited]{.feature}
    :::

[[fetchLocale](../view_model_lang_view_model/AppLanguage/fetchLocale.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   This function fetch the language of the user\'s app.

[[initialize](../view_model_lang_view_model/AppLanguage/initialize.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   initialiser.

[[localeResoultion](../view_model_lang_view_model/AppLanguage/localeResoultion.html)]{.name}[([[[Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.html)?]{.type-annotation} [locale]{.parameter-name}, ]{#localeResoultion-param-locale .parameter}[[[Iterable](https://api.flutter.dev/flutter/dart-core/Iterable-class.html)[\<[[Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.html)]{.type-parameter}\>]{.signature}]{.type-annotation} [supportedLocales]{.parameter-name}]{#localeResoultion-param-supportedLocales .parameter}) [→ [Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.html)]{.returntype .parameter} ]{.signature}
:   This function fetches the appropriate locale for the user\'s app
    based on the provided locale and supported locales.

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

[[selectLanguagePress](../view_model_lang_view_model/AppLanguage/selectLanguagePress.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Navigates the user after choosing lthe anguage.

[[setState](../view_model_base_view_model/BaseModel/setState.html)]{.name}[([[[ViewState](../enums_enums/ViewState.html)]{.type-annotation} [viewState]{.parameter-name}]{#setState-param-viewState .parameter}) [→ void]{.returntype .parameter} ]{.signature}

:   ::: features
    [inherited]{.feature}
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   A string representation of this object.
    ::: features
    [inherited]{.feature}
    :::

[[userLanguageQuery](../view_model_lang_view_model/AppLanguage/userLanguageQuery.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [userId]{.parameter-name}]{#userLanguageQuery-param-userId .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   This function perform graphQL query to check the user\'s language in
    the database.
:::

::: {#operators .section .summary .offset-anchor .inherited}
## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)]{.name}[([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)]{.type-annotation} [other]{.parameter-name}]{#==-param-other .parameter}) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.returntype .parameter} ]{.signature}
:   The equality operator.
    ::: features
    [inherited]{.feature}
    :::
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [lang_view_model](../view_model_lang_view_model/)
3.  AppLanguage class

##### lang_view_model library

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
