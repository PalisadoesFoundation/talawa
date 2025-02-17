::::::: {#dartdoc-main-content .main-content above-sidebar="models_organization_org_info_address/Address-class-sidebar.html" below-sidebar=""}
<div>

# [Address.fromJson]{.kind-constructor} constructor

</div>

::: {.section .multi-line-signature}
[Address.fromJson]{.name}(

1.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter},
    [dynamic]{.type-parameter}\>]{.signature}]{.type-annotation}
    [json]{.parameter-name}]{#fromJson-param-json .parameter}

)
:::

::: {.section .desc .markdown}
Factory method to construct an Address from a JSON object.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
factory Address.fromJson(Map<String, dynamic> json) {
  return Address(
    city: json['city'] as String?,
    countryCode: json['countryCode'] as String?,
    dependentLocality: json['dependentLocality'] as String?,
    line1: json['line1'] as String?,
    line2: json['line2'] as String?,
    postalCode: json['postalCode'] as String?,
    sortingCode: json['sortingCode'] as String?,
    state: json['state'] as String?,
  );
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [org_info_address](../../models_organization_org_info_address/)
3.  [Address](../../models_organization_org_info_address/Address-class.html)
4.  Address.fromJson factory constructor

##### Address class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
