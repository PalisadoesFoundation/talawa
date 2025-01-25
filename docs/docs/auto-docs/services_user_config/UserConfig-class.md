::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../index.html)
2.  [services/user_config.dart](../services_user_config/)
3.  UserConfig class

::: self-name
UserConfig
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_user_config/services_user_config-library-sidebar.html" below-sidebar="services_user_config/UserConfig-class-sidebar.html"}
<div>

# [UserConfig]{.kind-class} class

</div>

::: {.section .desc .markdown}
Provides different services in the context of the User.

Services include:

-   `userLoggedIn` : helps to make user logged in to the application.
-   `updateUserJoinedOrg` : helps to update the user joined
    organization.
-   `updateUserCreatedOrg` : helps to update the user created
    organization.
-   `updateUserMemberRequestOrg` : helps to update the User membership
    request for the organization.
-   `updateUserAdminOrg` : helps to update the Admin of the
    Organization.
-   `updateAccessToken` : helps to update the access token of an user.
-   `updateUser` : helps to update the user.
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[UserConfig](../services_user_config/UserConfig/UserConfig.html)]{.name}[()]{.signature}

:   
:::

::: {#instance-properties .section .summary .offset-anchor}
## Properties

[[currentOrg](../services_user_config/UserConfig/currentOrg.html)]{.name} [↔ [OrgInfo](../models_organization_org_info/OrgInfo-class.html)]{.signature}
:   Retrieves the current organization information.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[currentOrgInfoController](../services_user_config/UserConfig/currentOrgInfoController.html)]{.name} [→ [StreamController](https://api.flutter.dev/flutter/dart-async/StreamController-class.html)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)]{.type-parameter}\>]{.signature}]{.signature}
:   Retrieves the stream controller for current organization
    information.
    ::: features
    [no setter]{.feature}
    :::

[[currentOrgInfoStream](../services_user_config/UserConfig/currentOrgInfoStream.html)]{.name} [→ [Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)]{.type-parameter}\>]{.signature}]{.signature}
:   Retrieves the stream of current organization information.
    ::: features
    [no setter]{.feature}
    :::

[[currentOrgName](../services_user_config/UserConfig/currentOrgName.html)]{.name} [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.signature}
:   Retrieves the name of the current organization.
    ::: features
    [no setter]{.feature}
    :::

[[currentUser](../services_user_config/UserConfig/currentUser.html)]{.name} [↔ [User](../models_user_user_info/User-class.html)]{.signature}
:   Retrieves the current user.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)]{.name} [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.signature}
:   The hash code for this object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[loggedIn](../services_user_config/UserConfig/loggedIn.html)]{.name} [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}
:   Checks if a user is logged in.
    ::: features
    [no setter]{.feature}
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)]{.name} [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]{.signature}
:   A representation of the runtime type of the object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::
:::

::: {#instance-methods .section .summary .offset-anchor}
## Methods

[[initialiseStream](../services_user_config/UserConfig/initialiseStream.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   initialise.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)]{.name}[([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)]{.type-annotation} [invocation]{.parameter-name}]{#noSuchMethod-param-invocation .parameter}) [→ dynamic]{.returntype .parameter} ]{.signature}
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    [inherited]{.feature}
    :::

[[saveCurrentOrgInHive](../services_user_config/UserConfig/saveCurrentOrgInHive.html)]{.name}[([[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)]{.type-annotation} [saveOrgAsCurrent]{.parameter-name}]{#saveCurrentOrgInHive-param-saveOrgAsCurrent .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   save current organization details in hive.

[[saveUserInHive](../services_user_config/UserConfig/saveUserInHive.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   save user in hive.

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   A string representation of this object.
    ::: features
    [inherited]{.feature}
    :::

[[updateAccessToken](../services_user_config/UserConfig/updateAccessToken.html)]{.name}[({[required [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [accessToken]{.parameter-name}, ]{#updateAccessToken-param-accessToken .parameter}[required [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [refreshToken]{.parameter-name}]{#updateAccessToken-param-refreshToken .parameter}}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Updates the access token of the user.

[[updateUser](../services_user_config/UserConfig/updateUser.html)]{.name}[([[[User](../models_user_user_info/User-class.html)]{.type-annotation} [updatedUserDetails]{.parameter-name}]{#updateUser-param-updatedUserDetails .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Updates the user details.

[[updateUserAdminOrg](../services_user_config/UserConfig/updateUserAdminOrg.html)]{.name}[([[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)]{.type-parameter}\>]{.signature}]{.type-annotation} [orgDetails]{.parameter-name}]{#updateUserAdminOrg-param-orgDetails .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Updates the organization admin.

[[updateUserCreatedOrg](../services_user_config/UserConfig/updateUserCreatedOrg.html)]{.name}[([[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)]{.type-parameter}\>]{.signature}]{.type-annotation} [orgDetails]{.parameter-name}]{#updateUserCreatedOrg-param-orgDetails .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Updates the user created organization.

[[updateUserJoinedOrg](../services_user_config/UserConfig/updateUserJoinedOrg.html)]{.name}[([[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)]{.type-parameter}\>]{.signature}]{.type-annotation} [orgDetails]{.parameter-name}]{#updateUserJoinedOrg-param-orgDetails .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Updates the user joined organization.

[[updateUserMemberRequestOrg](../services_user_config/UserConfig/updateUserMemberRequestOrg.html)]{.name}[([[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)]{.type-parameter}\>]{.signature}]{.type-annotation} [orgDetails]{.parameter-name}]{#updateUserMemberRequestOrg-param-orgDetails .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Updates the user request to join the organization.

[[userLoggedIn](../services_user_config/UserConfig/userLoggedIn.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   This function is used to log in the user.

[[userLogOut](../services_user_config/UserConfig/userLogOut.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Logs out the current user.
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
2.  [user_config](../services_user_config/)
3.  UserConfig class

##### user_config library

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
