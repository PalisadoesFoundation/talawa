::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [models/organization/org_info.dart](../../models_organization_org_info/)
3.  [OrgInfo](../../models_organization_org_info/OrgInfo-class.html)
4.  fromJsonToList method

::: self-name
fromJsonToList
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="models_organization_org_info/OrgInfo-class-sidebar.html" below-sidebar=""}
<div>

# [fromJsonToList]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../../models_organization_org_info/OrgInfo-class.html)]{.type-parameter}\>]{.signature}]{.returntype}
[fromJsonToList]{.name}(

1.  [[dynamic]{.type-annotation}
    [json]{.parameter-name}]{#fromJsonToList-param-json .parameter}

)
:::

::: {.section .desc .markdown}
The conventional function to parse json, check flutter docs to know
more.

**params**:

-   `json`: Passing the json to be parsed.

**returns**:

-   `List<OrgInfo>`: returning the OrgInfo object containing the json
    data
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
List<OrgInfo> fromJsonToList(dynamic json) {
  final List<OrgInfo> orgList = [];

  if (json is List) {
    for (final dynamic outerElement in json) {
      if (outerElement is List) {
        for (final dynamic innerElement in outerElement) {
          if (innerElement is Map<String, dynamic>) {
            final OrgInfo org = OrgInfo.fromJson(innerElement);
            orgList.add(org);
          }
        }
      } else if (outerElement is Map<String, dynamic>) {
        final OrgInfo org = OrgInfo.fromJson(outerElement);
        orgList.add(org);
      }
    }
  }

  return orgList;
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
4.  fromJsonToList method

##### OrgInfo class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
