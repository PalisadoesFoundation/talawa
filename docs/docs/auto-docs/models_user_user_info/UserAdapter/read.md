::::::::: {#dartdoc-main-content .main-content above-sidebar="models_user_user_info/UserAdapter-class-sidebar.html" below-sidebar=""}
<div>

# [read]{.kind-method} method

</div>

::::: {.section .multi-line-signature}
<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[User](../../models_user_user_info/User-class.html)]{.returntype}
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
User read(BinaryReader reader) {
  final numOfFields = reader.readByte();
  final fields = <int, dynamic>{
    for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
  };
  return User(
    adminFor: (fields[9] as List?)?.cast<OrgInfo>(),
    createdOrganizations: (fields[8] as List?)?.cast<OrgInfo>(),
    email: fields[5] as String?,
    firstName: fields[3] as String?,
    id: fields[2] as String?,
    image: fields[6] as String?,
    joinedOrganizations: (fields[7] as List?)?.cast<OrgInfo>(),
    lastName: fields[4] as String?,
    authToken: fields[0] as String?,
    refreshToken: fields[1] as String?,
    membershipRequests: (fields[10] as List?)?.cast<OrgInfo>(),
  );
}
```
:::
:::::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [user_info](../../models_user_user_info/)
3.  [UserAdapter](../../models_user_user_info/UserAdapter-class.html)
4.  read method

##### UserAdapter class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
