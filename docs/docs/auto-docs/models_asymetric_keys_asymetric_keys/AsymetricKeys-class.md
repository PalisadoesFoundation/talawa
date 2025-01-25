::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../index.html)
2.  [models/asymetric_keys/asymetric_keys.dart](../models_asymetric_keys_asymetric_keys/)
3.  AsymetricKeys class

::: self-name
AsymetricKeys
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="models_asymetric_keys_asymetric_keys/models_asymetric_keys_asymetric_keys-library-sidebar.html" below-sidebar="models_asymetric_keys_asymetric_keys/AsymetricKeys-class-sidebar.html"}
<div>

# [AsymetricKeys]{.kind-class} class

</div>

::: {.section .desc .markdown}
Hive Type for `AssymetricKeys`.
:::

::: section

Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [HiveObject](https://pub.dev/documentation/hive/2.2.3/hive/HiveObject-class.html)
    -   AsymetricKeys

Annotations

:   -   @[HiveType](https://pub.dev/documentation/hive/2.2.3/hive/HiveType-class.html)(typeId:
        7)
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[AsymetricKeys](../models_asymetric_keys_asymetric_keys/AsymetricKeys/AsymetricKeys.html)]{.name}[({[required [[AsymmetricKeyPair](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/AsymmetricKeyPair-class.html)[\<[[PublicKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/PublicKey-class.html)]{.type-parameter}, [[PrivateKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/PrivateKey-class.html)]{.type-parameter}\>]{.signature}]{.type-annotation} [keyPair]{.parameter-name}]{#-param-keyPair .parameter}})]{.signature}

:   
:::

::: {#instance-properties .section .summary .offset-anchor}
## Properties

[[box](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/box.html)]{.name} [→ [BoxBase](https://pub.dev/documentation/hive/2.2.3/hive/BoxBase-class.html)?]{.signature}
:   Get the box in which this object is stored. Returns `null` if object
    has not been added to a box yet.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)]{.name} [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.signature}
:   The hash code for this object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
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

[[keyPair](../models_asymetric_keys_asymetric_keys/AsymetricKeys/keyPair.html)]{.name} [→ [AsymmetricKeyPair](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/AsymmetricKeyPair-class.html)[\<[[PublicKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/PublicKey-class.html)]{.type-parameter}, [[PrivateKey](https://pub.dev/documentation/pointycastle/3.9.1/pointycastle/PrivateKey-class.html)]{.type-parameter}\>]{.signature}]{.signature}
:   The key pair to work with.
    ::: features
    [final]{.feature}
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)]{.name} [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]{.signature}
:   A representation of the runtime type of the object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::
:::

::: {#instance-methods .section .summary .offset-anchor .inherited}
## Methods

[[delete](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/delete.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Deletes this object from the box it is stored in.
    ::: features
    [inherited]{.feature}
    :::

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
2.  [asymetric_keys](../models_asymetric_keys_asymetric_keys/)
3.  AsymetricKeys class

##### asymetric_keys library

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
