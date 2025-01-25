::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../index.html)
2.  [models/caching/cached_user_action.dart](../models_caching_cached_user_action/)
3.  CachedUserAction class

::: self-name
CachedUserAction
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="models_caching_cached_user_action/models_caching_cached_user_action-library-sidebar.html" below-sidebar="models_caching_cached_user_action/CachedUserAction-class-sidebar.html"}
<div>

# [CachedUserAction]{.kind-class} class

</div>

::: {.section .desc .markdown}
CachedUserAction class represents a user action that is cached for
offline use.

This class provides the following functionalities:

-   `toJson` : converts a CachedUserAction to a JSON-compatible map.
-   `fromJson` : creates a CachedUserAction from a JSON-compatible map.
-   `execute` : executes the cached user action based on its operation
    type.
:::

::: section

Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [HiveObject](https://pub.dev/documentation/hive/2.2.3/hive/HiveObject-class.html)
    -   CachedUserAction

Annotations

:   -   @[HiveType](https://pub.dev/documentation/hive/2.2.3/hive/HiveType-class.html)(typeId:
        3)
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[CachedUserAction](../models_caching_cached_user_action/CachedUserAction/CachedUserAction.html)]{.name}[({[required [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [id]{.parameter-name}, ]{#-param-id .parameter}[required [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [operation]{.parameter-name}, ]{#-param-operation .parameter}[[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}, [dynamic]{.type-parameter}\>]{.signature}?]{.type-annotation} [variables]{.parameter-name}, ]{#-param-variables .parameter}[required [[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)]{.type-annotation} [timeStamp]{.parameter-name}, ]{#-param-timeStamp .parameter}[required [[CachedUserActionStatus](../enums_enums/CachedUserActionStatus.html)]{.type-annotation} [status]{.parameter-name}, ]{#-param-status .parameter}[[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}, [dynamic]{.type-parameter}\>]{.signature}?]{.type-annotation} [metaData]{.parameter-name}, ]{#-param-metaData .parameter}[required [[CachedOperationType](../enums_enums/CachedOperationType.html)]{.type-annotation} [operationType]{.parameter-name}, ]{#-param-operationType .parameter}[required [[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)]{.type-annotation} [expiry]{.parameter-name}]{#-param-expiry .parameter}})]{.signature}

:   

[[CachedUserAction.fromJson](../models_caching_cached_user_action/CachedUserAction/CachedUserAction.fromJson.html)]{.name}[([[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}, [dynamic]{.type-parameter}\>]{.signature}]{.type-annotation} [json]{.parameter-name}]{#fromJson-param-json .parameter})]{.signature}
:   Creates a CachedUserAction from a JSON-compatible map.
    ::: {.constructor-modifier .features}
    factory
    :::
:::

::: {#instance-properties .section .summary .offset-anchor}
## Properties

[[box](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/box.html)]{.name} [→ [BoxBase](https://pub.dev/documentation/hive/2.2.3/hive/BoxBase-class.html)?]{.signature}
:   Get the box in which this object is stored. Returns `null` if object
    has not been added to a box yet.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[expiry](../models_caching_cached_user_action/CachedUserAction/expiry.html)]{.name} [↔ [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)]{.signature}
:   The expiry date and time for the cached user action.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)]{.name} [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.signature}
:   The hash code for this object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[id](../models_caching_cached_user_action/CachedUserAction/id.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.signature}
:   The unique identifier for the cached user action.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[isInBox](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/isInBox.html)]{.name} [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}
:   Returns whether this object is currently stored in a box.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[key](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/key.html)]{.name} [→ dynamic]{.signature}
:   Get the key associated with this object. Returns `null` if object
    has not been added to a box yet.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[metaData](../models_caching_cached_user_action/CachedUserAction/metaData.html)]{.name} [↔ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}, [dynamic]{.type-parameter}\>]{.signature}?]{.signature}
:   Any additional metadata related to the cached user action.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[operation](../models_caching_cached_user_action/CachedUserAction/operation.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.signature}
:   The operation to be performed for the cached user action.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[operationType](../models_caching_cached_user_action/CachedUserAction/operationType.html)]{.name} [↔ [CachedOperationType](../enums_enums/CachedOperationType.html)]{.signature}
:   The type of operation for the cached user action.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)]{.name} [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]{.signature}
:   A representation of the runtime type of the object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[status](../models_caching_cached_user_action/CachedUserAction/status.html)]{.name} [↔ [CachedUserActionStatus](../enums_enums/CachedUserActionStatus.html)]{.signature}
:   The status of the cached user action.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[timeStamp](../models_caching_cached_user_action/CachedUserAction/timeStamp.html)]{.name} [↔ [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)]{.signature}
:   The timestamp when the action was cached.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[variables](../models_caching_cached_user_action/CachedUserAction/variables.html)]{.name} [↔ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}, [dynamic]{.type-parameter}\>]{.signature}?]{.signature}
:   The variables required for the operation, if any.
    ::: features
    [getter/setter pair]{.feature}
    :::
:::

::: {#instance-methods .section .summary .offset-anchor}
## Methods

[[delete](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/delete.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Deletes this object from the box it is stored in.
    ::: features
    [inherited]{.feature}
    :::

[[execute](../models_caching_cached_user_action/CachedUserAction/execute.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Executes the cached user action based on its operation type.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)]{.name}[([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)]{.type-annotation} [invocation]{.parameter-name}]{#noSuchMethod-param-invocation .parameter}) [→ dynamic]{.returntype .parameter} ]{.signature}
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    [inherited]{.feature}
    :::

[[save](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/save.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Persists this object.
    ::: features
    [inherited]{.feature}
    :::

[[toJson](../models_caching_cached_user_action/CachedUserAction/toJson.html)]{.name}[() [→ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}, [dynamic]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Converts a CachedUserAction to a JSON-compatible map.

[[toString](../models_caching_cached_user_action/CachedUserAction/toString.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   A string representation of this object.
    ::: features
    [override]{.feature}
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
2.  [cached_user_action](../models_caching_cached_user_action/)
3.  CachedUserAction class

##### cached_user_action library

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
