::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../index.html)
2.  [models/organization/org_info.dart](../models_organization_org_info/)
3.  OrgInfo class

::: self-name
OrgInfo
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="models_organization_org_info/models_organization_org_info-library-sidebar.html" below-sidebar="models_organization_org_info/OrgInfo-class-sidebar.html"}
<div>

# [OrgInfo]{.kind-class} class

</div>

::: {.section .desc .markdown}
This class creates an organization-information model and returns an
OrgInfo instance.
:::

::: section

Annotations

:   -   @[HiveType](https://pub.dev/documentation/hive/2.2.3/hive/HiveType-class.html)(typeId:
        2)
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[OrgInfo](../models_organization_org_info/OrgInfo/OrgInfo.html)]{.name}[({[[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[User](../models_user_user_info/User-class.html)]{.type-parameter}\>]{.signature}?]{.type-annotation} [admins]{.parameter-name}, ]{#-param-admins .parameter}[[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[User](../models_user_user_info/User-class.html)]{.type-parameter}\>]{.signature}?]{.type-annotation} [members]{.parameter-name}, ]{#-param-members .parameter}[[[User](../models_user_user_info/User-class.html)?]{.type-annotation} [creatorInfo]{.parameter-name}, ]{#-param-creatorInfo .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation} [description]{.parameter-name}, ]{#-param-description .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation} [id]{.parameter-name}, ]{#-param-id .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation} [image]{.parameter-name}, ]{#-param-image .parameter}[[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?]{.type-annotation} [userRegistrationRequired]{.parameter-name}, ]{#-param-userRegistrationRequired .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation} [name]{.parameter-name}, ]{#-param-name .parameter}[[[Address](../models_organization_org_info_address/Address-class.html)?]{.type-annotation} [address]{.parameter-name}]{#-param-address .parameter}})]{.signature}

:   

[[OrgInfo.fromJson](../models_organization_org_info/OrgInfo/OrgInfo.fromJson.html)]{.name}[([[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}, [dynamic]{.type-parameter}\>]{.signature}]{.type-annotation} [json1]{.parameter-name}, {]{#fromJson-param-json1 .parameter}[[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-annotation} [memberRequest]{.parameter-name} = [false]{.default-value}]{#fromJson-param-memberRequest .parameter}})]{.signature}

:   ::: {.constructor-modifier .features}
    factory
    :::
:::

::: {#instance-properties .section .summary .offset-anchor}
## Properties

[[address](../models_organization_org_info/OrgInfo/address.html)]{.name} [↔ [Address](../models_organization_org_info_address/Address-class.html)?]{.signature}
:   Address of the Organisation.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[admins](../models_organization_org_info/OrgInfo/admins.html)]{.name} [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[User](../models_user_user_info/User-class.html)]{.type-parameter}\>]{.signature}?]{.signature}
:   The org admins.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[creatorInfo](../models_organization_org_info/OrgInfo/creatorInfo.html)]{.name} [↔ [User](../models_user_user_info/User-class.html)?]{.signature}
:   The org creatorInfo.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[description](../models_organization_org_info/OrgInfo/description.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.signature}
:   The org descriptions.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)]{.name} [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.signature}
:   The hash code for this object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[id](../models_organization_org_info/OrgInfo/id.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.signature}
:   The org id.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[image](../models_organization_org_info/OrgInfo/image.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.signature}
:   contains the Image url.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[members](../models_organization_org_info/OrgInfo/members.html)]{.name} [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[User](../models_user_user_info/User-class.html)]{.type-parameter}\>]{.signature}?]{.signature}
:   The org name.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[name](../models_organization_org_info/OrgInfo/name.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.signature}
:   The org name.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)]{.name} [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]{.signature}
:   A representation of the runtime type of the object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[userRegistrationRequired](../models_organization_org_info/OrgInfo/userRegistrationRequired.html)]{.name} [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?]{.signature}
:   The org registration is required.
    ::: features
    [getter/setter pair]{.feature}
    :::
:::

::: {#instance-methods .section .summary .offset-anchor}
## Methods

[[fromJsonToList](../models_organization_org_info/OrgInfo/fromJsonToList.html)]{.name}[([[dynamic]{.type-annotation} [json]{.parameter-name}]{#fromJsonToList-param-json .parameter}) [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   The conventional function to parse json, check flutter docs to know
    more.

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
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [org_info](../models_organization_org_info/)
3.  OrgInfo class

##### org_info library

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
