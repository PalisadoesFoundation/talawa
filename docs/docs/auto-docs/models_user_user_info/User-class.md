:::::::::: {#dartdoc-main-content .main-content above-sidebar="models_user_user_info/models_user_user_info-library-sidebar.html" below-sidebar="models_user_user_info/User-class-sidebar.html"}
<div>

# [User]{.kind-class} class

</div>

::: {.section .desc .markdown}
This class creates a User model and returns a user instance.
:::

::: section

Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [HiveObject](https://pub.dev/documentation/hive/2.2.3/hive/HiveObject-class.html)
    -   User

Annotations

:   -   @[HiveType](https://pub.dev/documentation/hive/2.2.3/hive/HiveType-class.html)(typeId:
        1)
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[User](../models_user_user_info/User/User.html)]{.name}[({[[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)]{.type-parameter}\>]{.signature}?]{.type-annotation} [adminFor]{.parameter-name}, ]{#-param-adminFor .parameter}[[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)]{.type-parameter}\>]{.signature}?]{.type-annotation} [createdOrganizations]{.parameter-name}, ]{#-param-createdOrganizations .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation} [email]{.parameter-name}, ]{#-param-email .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation} [firstName]{.parameter-name}, ]{#-param-firstName .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation} [id]{.parameter-name}, ]{#-param-id .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation} [image]{.parameter-name}, ]{#-param-image .parameter}[[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)]{.type-parameter}\>]{.signature}?]{.type-annotation} [joinedOrganizations]{.parameter-name}, ]{#-param-joinedOrganizations .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation} [lastName]{.parameter-name}, ]{#-param-lastName .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation} [authToken]{.parameter-name}, ]{#-param-authToken .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation} [refreshToken]{.parameter-name}, ]{#-param-refreshToken .parameter}[[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)]{.type-parameter}\>]{.signature}?]{.type-annotation} [membershipRequests]{.parameter-name}]{#-param-membershipRequests .parameter}})]{.signature}

:   

[[User.fromJson](../models_user_user_info/User/User.fromJson.html)]{.name}[([[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}, [dynamic]{.type-parameter}\>]{.signature}]{.type-annotation} [json]{.parameter-name}, {]{#fromJson-param-json .parameter}[[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-annotation} [fromOrg]{.parameter-name} = [false]{.default-value}]{#fromJson-param-fromOrg .parameter}})]{.signature}

:   ::: {.constructor-modifier .features}
    factory
    :::
:::

::: {#instance-properties .section .summary .offset-anchor}
## Properties

[[adminFor](../models_user_user_info/User/adminFor.html)]{.name} [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)]{.type-parameter}\>]{.signature}?]{.signature}
:   HiveField for all organisations user is admin of.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[authToken](../models_user_user_info/User/authToken.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.signature}
:   HiveField for authToken.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[box](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/box.html)]{.name} [→ [BoxBase](https://pub.dev/documentation/hive/2.2.3/hive/BoxBase-class.html)?]{.signature}
:   Get the box in which this object is stored. Returns `null` if object
    has not been added to a box yet.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[createdOrganizations](../models_user_user_info/User/createdOrganizations.html)]{.name} [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)]{.type-parameter}\>]{.signature}?]{.signature}
:   HiveField for all organisations created by user.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[email](../models_user_user_info/User/email.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.signature}
:   HiveField for user\'s Email.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[firstName](../models_user_user_info/User/firstName.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.signature}
:   HiveField for user\'s first name.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)]{.name} [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.signature}
:   The hash code for this object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[id](../models_user_user_info/User/id.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.signature}
:   HiveField for userID.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[image](../models_user_user_info/User/image.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.signature}
:   HiveField for user\'s avatar.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[isInBox](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/isInBox.html)]{.name} [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}
:   Returns whether this object is currently stored in a box.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[joinedOrganizations](../models_user_user_info/User/joinedOrganizations.html)]{.name} [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)]{.type-parameter}\>]{.signature}?]{.signature}
:   /// HiveField for all organisations joined by user.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[key](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/key.html)]{.name} [→ dynamic]{.signature}
:   Get the key associated with this object. Returns `null` if object
    has not been added to a box yet.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[lastName](../models_user_user_info/User/lastName.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.signature}
:   HiveField for user\'s last name.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[membershipRequests](../models_user_user_info/User/membershipRequests.html)]{.name} [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)]{.type-parameter}\>]{.signature}?]{.signature}
:   HiveField for all organisations user has sent membership request.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[refreshToken](../models_user_user_info/User/refreshToken.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.signature}
:   HiveField for refreshToken.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)]{.name} [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]{.signature}
:   A representation of the runtime type of the object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::
:::

::: {#instance-methods .section .summary .offset-anchor}
## Methods

[[delete](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/delete.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Deletes this object from the box it is stored in.
    ::: features
    [inherited]{.feature}
    :::

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)]{.name}[([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)]{.type-annotation} [invocation]{.parameter-name}]{#noSuchMethod-param-invocation .parameter}) [→ dynamic]{.returntype .parameter} ]{.signature}
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    [inherited]{.feature}
    :::

[[print](../models_user_user_info/User/print.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Method to print the User details.

[[save](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/save.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Persists this object.
    ::: features
    [inherited]{.feature}
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   A string representation of this object.
    ::: features
    [inherited]{.feature}
    :::

[[update](../models_user_user_info/User/update.html)]{.name}[([[[User](../models_user_user_info/User-class.html)]{.type-annotation} [details]{.parameter-name}]{#update-param-details .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Method to update the user details.

[[updateAdminFor](../models_user_user_info/User/updateAdminFor.html)]{.name}[([[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)]{.type-parameter}\>]{.signature}]{.type-annotation} [orgList]{.parameter-name}]{#updateAdminFor-param-orgList .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Method to update adminFor List.

[[updateCreatedOrg](../models_user_user_info/User/updateCreatedOrg.html)]{.name}[([[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)]{.type-parameter}\>]{.signature}]{.type-annotation} [orgList]{.parameter-name}]{#updateCreatedOrg-param-orgList .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Method to updated createdOrganisation list.

[[updateJoinedOrg](../models_user_user_info/User/updateJoinedOrg.html)]{.name}[([[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)]{.type-parameter}\>]{.signature}]{.type-annotation} [orgList]{.parameter-name}]{#updateJoinedOrg-param-orgList .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Method to updated joinedOrganisation list.

[[updateMemberRequestOrg](../models_user_user_info/User/updateMemberRequestOrg.html)]{.name}[([[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)]{.type-parameter}\>]{.signature}]{.type-annotation} [orgList]{.parameter-name}]{#updateMemberRequestOrg-param-orgList .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Method to update membershipRequests List.
:::

::: {#operators .section .summary .offset-anchor .inherited}
## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)]{.name}[([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)]{.type-annotation} [other]{.parameter-name}]{#==-param-other .parameter}) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.returntype .parameter} ]{.signature}
:   The equality operator.
    ::: features
    [inherited]{.feature}
    :::
:::
::::::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [user_info](../models_user_user_info/)
3.  User class

##### user_info library

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
