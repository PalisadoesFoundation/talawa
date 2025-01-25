::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../index.html)
2.  [services/caching/offline_action_queue.dart](../services_caching_offline_action_queue/)
3.  OfflineActionQueue class

::: self-name
OfflineActionQueue
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_caching_offline_action_queue/services_caching_offline_action_queue-library-sidebar.html" below-sidebar="services_caching_offline_action_queue/OfflineActionQueue-class-sidebar.html"}
<div>

# [OfflineActionQueue]{.kind-class} class

</div>

::: {.section .desc .markdown}
OfflineActionQueue class manages a queue for offline actions.

This class provides the following functionalities:

-   `initialize` : initializes the queue by registering adapters and
    opening the queue.
-   `registerAdapters` : registers the required Hive adapters.
-   `openQueue` : opens the Hive box for the offline action queue.
-   `addAction` : adds an action to the queue with a TTL.
-   `getActions` : retrieves all valid actions from the queue.
-   `removeAction` : removes a specific action from the queue.
-   `clearActions` : clears all actions from the queue.
-   `removeExpiredActions` : removes expired actions from the queue.
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[OfflineActionQueue](../services_caching_offline_action_queue/OfflineActionQueue/OfflineActionQueue.html)]{.name}[()]{.signature}

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

[[addAction](../services_caching_offline_action_queue/OfflineActionQueue/addAction.html)]{.name}[([[[CachedUserAction](../models_caching_cached_user_action/CachedUserAction-class.html)]{.type-annotation} [action]{.parameter-name}]{#addAction-param-action .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Adds an action to the queue with a TTL.

[[clearActions](../services_caching_offline_action_queue/OfflineActionQueue/clearActions.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Clears all actions from the queue.

[[getActions](../services_caching_offline_action_queue/OfflineActionQueue/getActions.html)]{.name}[() [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[CachedUserAction](../models_caching_cached_user_action/CachedUserAction-class.html)]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Retrieves all valid actions from the queue.

[[initialize](../services_caching_offline_action_queue/OfflineActionQueue/initialize.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Initializes the queue by registering adapters and opening the queue.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)]{.name}[([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)]{.type-annotation} [invocation]{.parameter-name}]{#noSuchMethod-param-invocation .parameter}) [→ dynamic]{.returntype .parameter} ]{.signature}
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    [inherited]{.feature}
    :::

[[openQueue](../services_caching_offline_action_queue/OfflineActionQueue/openQueue.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Opens the Hive box for the offline action queue.

[[removeAction](../services_caching_offline_action_queue/OfflineActionQueue/removeAction.html)]{.name}[([[dynamic]{.type-annotation} [key]{.parameter-name}]{#removeAction-param-key .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Removes a specific action from the queue.

[[removeExpiredActions](../services_caching_offline_action_queue/OfflineActionQueue/removeExpiredActions.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Removes expired actions from the queue.

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

[[boxName](../services_caching_offline_action_queue/OfflineActionQueue/boxName-constant.html)]{.name} [→ const [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.signature}
:   Offline Action Queue box name.
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [offline_action_queue](../services_caching_offline_action_queue/)
3.  OfflineActionQueue class

##### offline_action_queue library

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
