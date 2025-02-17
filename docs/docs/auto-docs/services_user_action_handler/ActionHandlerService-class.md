::::::::: {#dartdoc-main-content .main-content above-sidebar="services_user_action_handler/services_user_action_handler-library-sidebar.html" below-sidebar="services_user_action_handler/ActionHandlerService-class-sidebar.html"}
<div>

# [ActionHandlerService]{.kind-class} class

</div>

::: {.section .desc .markdown}
A service class to handle different types of actions, including API
calls.

with proper error handling and UI updates based on the action type.
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[ActionHandlerService](../services_user_action_handler/ActionHandlerService/ActionHandlerService.html)]{.name}[()]{.signature}

:   
:::

::: {#instance-properties .section .summary .offset-anchor .inherited}
## Properties

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)]{.name} [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.signature}
:   The hash code for this object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)]{.name} [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]{.signature}
:   A representation of the runtime type of the object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::
:::

::: {#instance-methods .section .summary .offset-anchor}
## Methods

[[executeApiCall](../services_user_action_handler/ActionHandlerService/executeApiCall.html)]{.name}[({[required [[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]{.type-parameter}\>]{.signature}?]{.type-parameter}\>]{.signature}]{.type-annotation} [action]{.parameter-name}(), ]{#executeApiCall-param-action .parameter}[[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.type-annotation} [onValidResult]{.parameter-name}([[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]{.type-parameter}\>]{.signature}]{.type-annotation}]{#param- .parameter})?, ]{#executeApiCall-param-onValidResult .parameter}[[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.type-annotation} [onActionException]{.parameter-name}([[[Exception](https://api.flutter.dev/flutter/dart-core/Exception-class.html)]{.type-annotation} [e]{.parameter-name}]{#param-e .parameter})?, ]{#executeApiCall-param-onActionException .parameter}[[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.type-annotation} [onActionFinally]{.parameter-name}()?]{#executeApiCall-param-onActionFinally .parameter}}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Method to execute an API action.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)]{.name}[([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)]{.type-annotation} [invocation]{.parameter-name}]{#noSuchMethod-param-invocation .parameter}) [→ dynamic]{.returntype .parameter} ]{.signature}
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    [inherited]{.feature}
    :::

[[performAction](../services_user_action_handler/ActionHandlerService/performAction.html)]{.name}[({[required [[ActionType](../enums_enums/ActionType.html)]{.type-annotation} [actionType]{.parameter-name}, ]{#performAction-param-actionType .parameter}[required [[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]{.type-parameter}\>]{.signature}?]{.type-parameter}\>]{.signature}]{.type-annotation} [action]{.parameter-name}(), ]{#performAction-param-action .parameter}[[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.type-annotation} [onValidResult]{.parameter-name}([[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]{.type-parameter}\>]{.signature}]{.type-annotation} [result]{.parameter-name}]{#param-result .parameter})?, ]{#performAction-param-onValidResult .parameter}[[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.type-annotation} [onActionException]{.parameter-name}([[[Exception](https://api.flutter.dev/flutter/dart-core/Exception-class.html)]{.type-annotation} [e]{.parameter-name}]{#param-e .parameter})?, ]{#performAction-param-onActionException .parameter}[[void]{.type-annotation} [updateUI]{.parameter-name}()?, ]{#performAction-param-updateUI .parameter}[[void]{.type-annotation} [apiCallSuccessUpdateUI]{.parameter-name}()?, ]{#performAction-param-apiCallSuccessUpdateUI .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation} [criticalActionFailureMessage]{.parameter-name} = [TalawaErrors.userActionNotSaved]{.default-value}, ]{#performAction-param-criticalActionFailureMessage .parameter}[[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.type-annotation} [onActionFinally]{.parameter-name}()?]{#performAction-param-onActionFinally .parameter}}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Processes a user action based on its type, with error handling and
    UI update.

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
:::::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [user_action_handler](../services_user_action_handler/)
3.  ActionHandlerService class

##### user_action_handler library

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
