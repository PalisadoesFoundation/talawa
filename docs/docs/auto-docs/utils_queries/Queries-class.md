::::::::: {#dartdoc-main-content .main-content above-sidebar="utils_queries/utils_queries-library-sidebar.html" below-sidebar="utils_queries/Queries-class-sidebar.html"}
<div>

# [Queries]{.kind-class} class

</div>

::: {.section .desc .markdown}
This class returns some queries for the application.
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[Queries](../utils_queries/Queries/Queries.html)]{.name}[()]{.signature}

:   
:::

::: {#instance-properties .section .summary .offset-anchor}
## Properties

[[fetchJoinInOrg](../utils_queries/Queries/fetchJoinInOrg.html)]{.name} [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.signature}
:   getter for joined org.
    ::: features
    [no setter]{.feature}
    :::

[[fetchJoinInOrgByName](../utils_queries/Queries/fetchJoinInOrgByName.html)]{.name} [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.signature}
:   getter for fetchJoinInOrgByName.
    ::: features
    [no setter]{.feature}
    :::

[[fetchUserInfo](../utils_queries/Queries/fetchUserInfo.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.signature}
:   mutation in string form, to be passed on to graphql client..
    ::: features
    [getter/setter pair]{.feature}
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)]{.name} [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.signature}
:   The hash code for this object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)]{.name} [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]{.signature}
:   A representation of the runtime type of the object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::
:::

::: {#instance-methods .section .summary .offset-anchor}
## Methods

[[createDonation](../utils_queries/Queries/createDonation.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [userId]{.parameter-name}, ]{#createDonation-param-userId .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [orgId]{.parameter-name}, ]{#createDonation-param-orgId .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [nameOfOrg]{.parameter-name}, ]{#createDonation-param-nameOfOrg .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [nameOfUser]{.parameter-name}, ]{#createDonation-param-nameOfUser .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [payPalId]{.parameter-name}, ]{#createDonation-param-payPalId .parameter}[[[double](https://api.flutter.dev/flutter/dart-core/double-class.html)]{.type-annotation} [amount]{.parameter-name}]{#createDonation-param-amount .parameter}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   `createDonation` creates a new donation transaction by taking the
    userId ,orgId ,nameOfOrg ,nameOfUser as parameters.

[[fetchOrgById](../utils_queries/Queries/fetchOrgById.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [orgId]{.parameter-name}]{#fetchOrgById-param-orgId .parameter}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   fetching org details with the help of id.

[[fetchOrgDetailsById](../utils_queries/Queries/fetchOrgDetailsById.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [orgId]{.parameter-name}]{#fetchOrgDetailsById-param-orgId .parameter}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   query to fetch org details.

[[getPluginsList](../utils_queries/Queries/getPluginsList.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   `getPluginList` queries all properties of pluginList from the
    server.

[[joinOrgById](../utils_queries/Queries/joinOrgById.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [orgId]{.parameter-name}]{#joinOrgById-param-orgId .parameter}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   make mutation string for joiining org by ord.id.

[[loginUser](../utils_queries/Queries/loginUser.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [email]{.parameter-name}, ]{#loginUser-param-email .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [password]{.parameter-name}]{#loginUser-param-password .parameter}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   mutation to login the user.

[[logout](../utils_queries/Queries/logout.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   logout muiation.

[[newUserLanguage](../utils_queries/Queries/newUserLanguage.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [userId]{.parameter-name}]{#newUserLanguage-param-userId .parameter}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   query for new user language .

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)]{.name}[([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)]{.type-annotation} [invocation]{.parameter-name}]{#noSuchMethod-param-invocation .parameter}) [→ dynamic]{.returntype .parameter} ]{.signature}
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    [inherited]{.feature}
    :::

[[refreshToken](../utils_queries/Queries/refreshToken.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [refreshToken]{.parameter-name}]{#refreshToken-param-refreshToken .parameter}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   mutation for refresh token.

[[registerUser](../utils_queries/Queries/registerUser.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [firstName]{.parameter-name}, ]{#registerUser-param-firstName .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [lastName]{.parameter-name}, ]{#registerUser-param-lastName .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [email]{.parameter-name}, ]{#registerUser-param-email .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [password]{.parameter-name}, ]{#registerUser-param-password .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation} [selectedOrganization]{.parameter-name}]{#registerUser-param-selectedOrganization .parameter}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   Mutation to register a user.

[[sendMembershipRequest](../utils_queries/Queries/sendMembershipRequest.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [orgId]{.parameter-name}]{#sendMembershipRequest-param-orgId .parameter}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   mutation to send the member request.

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   A string representation of this object.
    ::: features
    [inherited]{.feature}
    :::

[[updateLanguage](../utils_queries/Queries/updateLanguage.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [languageCode]{.parameter-name}]{#updateLanguage-param-languageCode .parameter}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   lang update mutation.

[[updateUserProfile](../utils_queries/Queries/updateUserProfile.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   to update user profile.

[[userLanguage](../utils_queries/Queries/userLanguage.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   query to fetch user lang.

[[venueListQuery](../utils_queries/Queries/venueListQuery.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   Query to get the list of Venues in an organisation.
:::

::: {#operators .section .summary .offset-anchor .inherited}
## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)]{.name}[([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)]{.type-annotation} [other]{.parameter-name}]{#==-param-other .parameter}) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.returntype .parameter} ]{.signature}
:   The equality operator.
    ::: features
    [inherited]{.feature}
    :::
:::
:::::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [queries](../utils_queries/)
3.  Queries class

##### queries library

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
