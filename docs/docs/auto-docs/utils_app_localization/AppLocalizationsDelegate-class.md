::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../index.html)
2.  [utils/app_localization.dart](../utils_app_localization/)
3.  AppLocalizationsDelegate class

::: self-name
AppLocalizationsDelegate
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="utils_app_localization/utils_app_localization-library-sidebar.html" below-sidebar="utils_app_localization/AppLocalizationsDelegate-class-sidebar.html"}
<div>

# [AppLocalizationsDelegate]{.kind-class} class

</div>

::: section

Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [LocalizationsDelegate](https://api.flutter.dev/flutter/widgets/LocalizationsDelegate-class.html)[\<[[AppLocalizations](../utils_app_localization/AppLocalizations-class.html)]{.type-parameter}\>]{.signature}
    -   AppLocalizationsDelegate
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[AppLocalizationsDelegate](../utils_app_localization/AppLocalizationsDelegate/AppLocalizationsDelegate.html)]{.name}[({[[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-annotation} [isTest]{.parameter-name} = [false]{.default-value}]{#-param-isTest .parameter}})]{.signature}

:   ::: {.constructor-modifier .features}
    const
    :::
:::

::: {#instance-properties .section .summary .offset-anchor}
## Properties

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)]{.name} [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.signature}
:   The hash code for this object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[isTest](../utils_app_localization/AppLocalizationsDelegate/isTest.html)]{.name} [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}

:   ::: features
    [final]{.feature}
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)]{.name} [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]{.signature}
:   A representation of the runtime type of the object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[type](https://api.flutter.dev/flutter/widgets/LocalizationsDelegate/type.html)]{.name} [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]{.signature}
:   The type of the object returned by the
    [load](https://api.flutter.dev/flutter/widgets/LocalizationsDelegate/load.html)
    method, T by default.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::
:::

::: {#instance-methods .section .summary .offset-anchor}
## Methods

[[isSupported](../utils_app_localization/AppLocalizationsDelegate/isSupported.html)]{.name}[([[[Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.html)]{.type-annotation} [locale]{.parameter-name}]{#isSupported-param-locale .parameter}) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.returntype .parameter} ]{.signature}
:   Whether resources for the given locale can be loaded by this
    delegate.
    ::: features
    [override]{.feature}
    :::

[[load](../utils_app_localization/AppLocalizationsDelegate/load.html)]{.name}[([[[Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.html)]{.type-annotation} [locale]{.parameter-name}]{#load-param-locale .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[AppLocalizations](../utils_app_localization/AppLocalizations-class.html)]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Start loading the resources for `locale`. The returned future
    completes when the resources have finished loading.
    ::: features
    [override]{.feature}
    :::

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)]{.name}[([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)]{.type-annotation} [invocation]{.parameter-name}]{#noSuchMethod-param-invocation .parameter}) [→ dynamic]{.returntype .parameter} ]{.signature}
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    [inherited]{.feature}
    :::

[[shouldReload](../utils_app_localization/AppLocalizationsDelegate/shouldReload.html)]{.name}[([covariant [[AppLocalizationsDelegate](../utils_app_localization/AppLocalizationsDelegate-class.html)]{.type-annotation} [old]{.parameter-name}]{#shouldReload-param-old .parameter}) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.returntype .parameter} ]{.signature}
:   Returns true if the resources for this delegate should be loaded
    again by calling the
    [load](../utils_app_localization/AppLocalizationsDelegate/load.html)
    method.
    ::: features
    [override]{.feature}
    :::

[[toString](https://api.flutter.dev/flutter/widgets/LocalizationsDelegate/toString.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
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
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [app_localization](../utils_app_localization/)
3.  AppLocalizationsDelegate class

##### app_localization library

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
