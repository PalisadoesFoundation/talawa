::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [models/user/user_info.dart](../../models_user_user_info/)
3.  [UserAdapter](../../models_user_user_info/UserAdapter-class.html)
4.  write method

::: self-name
write
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="models_user_user_info/UserAdapter-class-sidebar.html" below-sidebar=""}
<div>

# [write]{.kind-method} method

</div>

::: {.section .multi-line-signature}
<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[void]{.returntype} [write]{.name}(

1.  [[[BinaryWriter](https://pub.dev/documentation/hive/2.2.3/hive/BinaryWriter-class.html)]{.type-annotation}
    [writer]{.parameter-name}, ]{#write-param-writer .parameter}
2.  [[[User](../../models_user_user_info/User-class.html)]{.type-annotation}
    [obj]{.parameter-name}]{#write-param-obj .parameter}

)

::: features
[override]{.feature}
:::
:::

::: {.section .desc .markdown}
Is called when a value has to be encoded.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
@override
void write(BinaryWriter writer, User obj) {
  writer
    ..writeByte(11)
    ..writeByte(0)
    ..write(obj.authToken)
    ..writeByte(1)
    ..write(obj.refreshToken)
    ..writeByte(2)
    ..write(obj.id)
    ..writeByte(3)
    ..write(obj.firstName)
    ..writeByte(4)
    ..write(obj.lastName)
    ..writeByte(5)
    ..write(obj.email)
    ..writeByte(6)
    ..write(obj.image)
    ..writeByte(7)
    ..write(obj.joinedOrganizations)
    ..writeByte(8)
    ..write(obj.createdOrganizations)
    ..writeByte(9)
    ..write(obj.adminFor)
    ..writeByte(10)
    ..write(obj.membershipRequests);
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [user_info](../../models_user_user_info/)
3.  [UserAdapter](../../models_user_user_info/UserAdapter-class.html)
4.  write method

##### UserAdapter class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
