::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [models/organization/org_info.dart](../../models_organization_org_info/)
3.  [OrgInfoAdapter](../../models_organization_org_info/OrgInfoAdapter-class.html)
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
::: {#dartdoc-main-content .main-content above-sidebar="models_organization_org_info/OrgInfoAdapter-class-sidebar.html" below-sidebar=""}
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
2.  [[[OrgInfo](../../models_organization_org_info/OrgInfo-class.html)]{.type-annotation}
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
void write(BinaryWriter writer, OrgInfo obj) {
  writer
    ..writeByte(9)
    ..writeByte(0)
    ..write(obj.image)
    ..writeByte(1)
    ..write(obj.id)
    ..writeByte(2)
    ..write(obj.name)
    ..writeByte(3)
    ..write(obj.admins)
    ..writeByte(4)
    ..write(obj.members)
    ..writeByte(5)
    ..write(obj.description)
    ..writeByte(6)
    ..write(obj.userRegistrationRequired)
    ..writeByte(7)
    ..write(obj.creatorInfo)
    ..writeByte(8)
    ..write(obj.address);
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [org_info](../../models_organization_org_info/)
3.  [OrgInfoAdapter](../../models_organization_org_info/OrgInfoAdapter-class.html)
4.  write method

##### OrgInfoAdapter class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
