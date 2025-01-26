::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../index.html)
2.  [services/caching/cache_service.dart](../services_caching_cache_service/)
3.  CacheService class

::: self-name
CacheService
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_caching_cache_service/services_caching_cache_service-library-sidebar.html" below-sidebar="services_caching_cache_service/CacheService-class-sidebar.html"}
<div>

# [CacheService]{.kind-class} class

</div>

::: {.section .desc .markdown}
Service to handle caching routines.
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[CacheService](../services_caching_cache_service/CacheService/CacheService.html)]{.name}[()]{.signature}
:   Initializes the cache service and the offline action queue.
:::

::: {#instance-properties .section .summary .offset-anchor}
## Properties

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)]{.name} [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.signature}
:   The hash code for this object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[offlineActionQueue](../services_caching_cache_service/CacheService/offlineActionQueue.html)]{.name} [↔ [OfflineActionQueue](../services_caching_offline_action_queue/OfflineActionQueue-class.html)]{.signature}
:   Queue for storing user actions to be executed offline.
    ::: features
    [late]{.feature}[final]{.feature}
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)]{.name} [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]{.signature}
:   A representation of the runtime type of the object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::
:::

::: {#instance-methods .section .summary .offset-anchor}
## Methods

[[executeOrCacheOperation](../services_caching_cache_service/CacheService/executeOrCacheOperation.html)]{.name}[({[required [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [operation]{.parameter-name}, ]{#executeOrCacheOperation-param-operation .parameter}[[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}, [dynamic]{.type-parameter}\>]{.signature}?]{.type-annotation} [variables]{.parameter-name}, ]{#executeOrCacheOperation-param-variables .parameter}[required [[CachedOperationType](../enums_enums/CachedOperationType.html)]{.type-annotation} [operationType]{.parameter-name}, ]{#executeOrCacheOperation-param-operationType .parameter}[required [[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.type-annotation} [whenOnline]{.parameter-name}()]{#executeOrCacheOperation-param-whenOnline .parameter}}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Executes a GraphQL operation or caches it for offline execution.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)]{.name}[([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)]{.type-annotation} [invocation]{.parameter-name}]{#noSuchMethod-param-invocation .parameter}) [→ dynamic]{.returntype .parameter} ]{.signature}
:   Invoked when a nonexistent method or property is accessed.
    ::: features
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

::: {#static-properties .section .summary .offset-anchor}
## Static Properties

[[offlineResult](../services_caching_cache_service/CacheService/offlineResult.html)]{.name} [→ [QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]{.type-parameter}\>]{.signature}]{.signature}
:   static graphql result when device is offline.
    ::: features
    [final]{.feature}
    :::
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [cache_service](../services_caching_cache_service/)
3.  CacheService class

##### cache_service library

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
