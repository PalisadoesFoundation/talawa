::::::::: {#dartdoc-main-content .main-content above-sidebar="models_asymetric_keys_asymetric_keys/AsymetricKeysAdapter-class-sidebar.html" below-sidebar=""}
<div>

# [read]{.kind-method} method

</div>

::::: {.section .multi-line-signature}
<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[AsymetricKeys](../../models_asymetric_keys_asymetric_keys/AsymetricKeys-class.html)]{.returntype}
[read]{.name}(

1.  [[[BinaryReader](https://pub.dev/documentation/hive/2.2.3/hive/BinaryReader-class.html)]{.type-annotation}
    [reader]{.parameter-name}]{#read-param-reader .parameter}

)

::: features
[override]{.feature}
:::
:::::

::: {.section .desc .markdown}
Is called when a value has to be decoded.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
@override
AsymetricKeys read(BinaryReader reader) {
  final numOfFields = reader.readByte();
  final fields = <int, dynamic>{
    for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
  };
  return AsymetricKeys(
    keyPair: fields[0] as AsymmetricKeyPair<PublicKey, PrivateKey>,
  );
}
```
:::
:::::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [asymetric_keys](../../models_asymetric_keys_asymetric_keys/)
3.  [AsymetricKeysAdapter](../../models_asymetric_keys_asymetric_keys/AsymetricKeysAdapter-class.html)
4.  read method

##### AsymetricKeysAdapter class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
