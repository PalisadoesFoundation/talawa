:::::::::: {#dartdoc-main-content .main-content above-sidebar="services_hive_manager/services_hive_manager-library-sidebar.html" below-sidebar="services_hive_manager/HiveManager-class-sidebar.html"}
<div>

# [HiveManager]{.kind-class} class

</div>

::: {.section .desc .markdown}
A manager class responsible for initializing and tearing down Hive, a
local database for Flutter.

The `HiveManager` class provides methods to initialize Hive with
necessary adapters and open boxes for various models used throughout the
application. It also provides a method to close all opened Hive boxes
when they are no longer needed.
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[HiveManager](../services_hive_manager/HiveManager/HiveManager.html)]{.name}[()]{.signature}

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

::: {#instance-methods .section .summary .offset-anchor .inherited}
## Methods

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

::: {#static-methods .section .summary .offset-anchor}
## Static Methods

[[closeBox](../services_hive_manager/HiveManager/closeBox.html)]{.name}[\<[T]{.type-parameter}\>]{.signature}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [boxName]{.parameter-name}]{#closeBox-param-boxName .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Closes the `boxName` named box.

[[initializeHive](../services_hive_manager/HiveManager/initializeHive.html)]{.name}[({[required [[Directory](https://api.flutter.dev/flutter/dart-io/Directory-class.html)]{.type-annotation} [dir]{.parameter-name}]{#initializeHive-param-dir .parameter}}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Initializes Hive with the specified directory.

[[openBox](../services_hive_manager/HiveManager/openBox.html)]{.name}[\<[T]{.type-parameter}\>]{.signature}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [boxName]{.parameter-name}]{#openBox-param-boxName .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Opens the `boxName` named box.

[[registerAdapter](../services_hive_manager/HiveManager/registerAdapter.html)]{.name}[\<[T]{.type-parameter}\>]{.signature}[([[[TypeAdapter](https://pub.dev/documentation/hive/2.2.3/hive/TypeAdapter-class.html)[\<[T]{.type-parameter}\>]{.signature}]{.type-annotation} [adapter]{.parameter-name}]{#registerAdapter-param-adapter .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Registers the `adapter` named adapter.

[[registerAdapters](../services_hive_manager/HiveManager/registerAdapters.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Registers the necessary Hive adapters for the models used in the
    application.

[[teardownHive](../services_hive_manager/HiveManager/teardownHive.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Closes all opened Hive boxes and the Hive instance itself.
:::
::::::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [hive_manager](../services_hive_manager/)
3.  HiveManager class

##### hive_manager library

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
