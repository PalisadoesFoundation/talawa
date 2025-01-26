::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [models/organization/org_info.dart](../../models_organization_org_info/)
3.  [OrgInfo](../../models_organization_org_info/OrgInfo-class.html)
4.  OrgInfo.fromJson factory constructor

::: self-name
OrgInfo.fromJson
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="models_organization_org_info/OrgInfo-class-sidebar.html" below-sidebar=""}
<div>

# [OrgInfo.fromJson]{.kind-constructor} constructor

</div>

::: {.section .multi-line-signature}
[OrgInfo.fromJson]{.name}(

1.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter},
    [dynamic]{.type-parameter}\>]{.signature}]{.type-annotation}
    [json1]{.parameter-name}, {]{#fromJson-param-json1 .parameter}
2.  [[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-annotation}
    [memberRequest]{.parameter-name} = [false]{.default-value},
    ]{#fromJson-param-memberRequest .parameter}

})
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
factory OrgInfo.fromJson(
  Map<String, dynamic> json1, {
  bool memberRequest = false,
}) {
  Map<String, dynamic> json;
  if (memberRequest) {
    json = json1['organization'] as Map<String, dynamic>;
  } else {
    json = json1;
  }
  return OrgInfo(
    id: json['_id'] != null ? json['_id'] as String : null,
    image: json['image'] != null ? json['image'] as String? : null,
    name: json['name'] != null ? json['name'] as String? : null,
    description:
        json['description'] != null ? json['description'] as String? : null,
    userRegistrationRequired: json['userRegistrationRequired'] != null
        ? json['userRegistrationRequired'] as bool?
        : null,
    creatorInfo: json['creator'] != null
        ? User.fromJson(
            json['creator'] as Map<String, dynamic>,
            fromOrg: true,
          )
        : null,
    members: json['members'] != null
        ? (json['members'] as List<dynamic>?)
            ?.map(
              (e) => User.fromJson(e as Map<String, dynamic>, fromOrg: true),
            )
            .toList()
        : null,
    admins: json['admins'] != null
        ? (json['admins'] as List<dynamic>?)
            ?.map(
              (e) => User.fromJson(e as Map<String, dynamic>, fromOrg: true),
            )
            .toList()
        : null,
    address: json['address'] != null
        ? Address.fromJson(json['address'] as Map<String, dynamic>)
        : null,
  );
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [org_info](../../models_organization_org_info/)
3.  [OrgInfo](../../models_organization_org_info/OrgInfo-class.html)
4.  OrgInfo.fromJson factory constructor

##### OrgInfo class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
