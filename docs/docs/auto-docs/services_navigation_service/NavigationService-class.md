::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../index.html)
2.  [services/navigation_service.dart](../services_navigation_service/)
3.  NavigationService class

::: self-name
NavigationService
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_navigation_service/services_navigation_service-library-sidebar.html" below-sidebar="services_navigation_service/NavigationService-class-sidebar.html"}
<div>

# [NavigationService]{.kind-class} class

</div>

::: {.section .desc .markdown}
NavigationService class provides different functions as service in the
context of navigation.

Services include:

-   `pushScreen`
-   `popAndPushScreen`
-   `pushReplacementScreen`
-   `removeAllAndPush`
-   `showSnackBar`
-   `pushDialog`
-   `showTalawaErrorWidget`
-   `showTalawaErrorDialog`
-   `pop`
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[NavigationService](../services_navigation_service/NavigationService/NavigationService.html)]{.name}[()]{.signature}

:   
:::

::: {#instance-properties .section .summary .offset-anchor}
## Properties

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)]{.name} [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.signature}
:   The hash code for this object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[navigatorKey](../services_navigation_service/NavigationService/navigatorKey.html)]{.name} [↔ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[NavigatorState](https://api.flutter.dev/flutter/widgets/NavigatorState-class.html)]{.type-parameter}\>]{.signature}]{.signature}
:   Key for Navigator State.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)]{.name} [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]{.signature}
:   A representation of the runtime type of the object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::
:::

::: {#instance-methods .section .summary .offset-anchor}
## Methods

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)]{.name}[([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)]{.type-annotation} [invocation]{.parameter-name}]{#noSuchMethod-param-invocation .parameter}) [→ dynamic]{.returntype .parameter} ]{.signature}
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    [inherited]{.feature}
    :::

[[pop](../services_navigation_service/NavigationService/pop.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   This function pops the current state.

[[popAndPushScreen](../services_navigation_service/NavigationService/popAndPushScreen.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [routeName]{.parameter-name}, {]{#popAndPushScreen-param-routeName .parameter}[[dynamic]{.type-annotation} [arguments]{.parameter-name}]{#popAndPushScreen-param-arguments .parameter}}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)]{.returntype .parameter} ]{.signature}
:   This function pop the initial route and push the new route to the
    navigator.

[[printNavigatorState](../services_navigation_service/NavigationService/printNavigatorState.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   This function prints current navigation state.

[[pushDialog](../services_navigation_service/NavigationService/pushDialog.html)]{.name}[([[[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]{.type-annotation} [dialog]{.parameter-name}]{#pushDialog-param-dialog .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   This function remove all the routes till the particular route and
    add new route.

[[pushReplacementScreen](../services_navigation_service/NavigationService/pushReplacementScreen.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [routeName]{.parameter-name}, {]{#pushReplacementScreen-param-routeName .parameter}[[dynamic]{.type-annotation} [arguments]{.parameter-name}]{#pushReplacementScreen-param-arguments .parameter}}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)]{.returntype .parameter} ]{.signature}
:   This function push the route and replace the screen.

[[pushScreen](../services_navigation_service/NavigationService/pushScreen.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [routeName]{.parameter-name}, {]{#pushScreen-param-routeName .parameter}[[dynamic]{.type-annotation} [arguments]{.parameter-name}]{#pushScreen-param-arguments .parameter}}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)]{.returntype .parameter} ]{.signature}
:   Pushes a Screen.

[[removeAllAndPush](../services_navigation_service/NavigationService/removeAllAndPush.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [routeName]{.parameter-name}, ]{#removeAllAndPush-param-routeName .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [tillRoute]{.parameter-name}, {]{#removeAllAndPush-param-tillRoute .parameter}[[dynamic]{.type-annotation} [arguments]{.parameter-name}]{#removeAllAndPush-param-arguments .parameter}}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)]{.returntype .parameter} ]{.signature}
:   This function remove all the routes till the particular route and
    add new route.

[[showCustomToast](../services_navigation_service/NavigationService/showCustomToast.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [msg]{.parameter-name}]{#showCustomToast-param-msg .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Shows an Custom Toast.

[[showSnackBar](../services_navigation_service/NavigationService/showSnackBar.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [message]{.parameter-name}, {]{#showSnackBar-param-message .parameter}[[[Duration](https://api.flutter.dev/flutter/dart-core/Duration-class.html)]{.type-annotation} [duration]{.parameter-name} = [const Duration(seconds: 2)]{.default-value}]{#showSnackBar-param-duration .parameter}}) [→ void]{.returntype .parameter} ]{.signature}
:   This is used for the quick alert of `duration: 2 seconds` with text
    message(passed).

[[showTalawaErrorDialog](../services_navigation_service/NavigationService/showTalawaErrorDialog.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [errorMessage]{.parameter-name}, ]{#showTalawaErrorDialog-param-errorMessage .parameter}[[[MessageType](../enums_enums/MessageType.html)]{.type-annotation} [messageType]{.parameter-name}]{#showTalawaErrorDialog-param-messageType .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Shows an Error Dialog Box.

[[showTalawaErrorSnackBar](../services_navigation_service/NavigationService/showTalawaErrorSnackBar.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [errorMessage]{.parameter-name}, ]{#showTalawaErrorSnackBar-param-errorMessage .parameter}[[[MessageType](../enums_enums/MessageType.html)]{.type-annotation} [messageType]{.parameter-name}]{#showTalawaErrorSnackBar-param-messageType .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   This is used for the quick error of `duration: 2 seconds`.

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
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [navigation_service](../services_navigation_service/)
3.  NavigationService class

##### navigation_service library

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
