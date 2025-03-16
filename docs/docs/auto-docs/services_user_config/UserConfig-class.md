
<div>

# UserConfig class

</div>


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



## Constructors

[UserConfig](../services_user_config/UserConfig/UserConfig.md)

:   



## Properties

[[currentOrg](../services_user_config/UserConfig/currentOrg.md)] [↔ [OrgInfo](../models_organization_org_info/OrgInfo-class.md)]
:   Retrieves the current organization information.
    ::: features
    getter/setter pair
    :::

[[currentOrgInfoController](../services_user_config/UserConfig/currentOrgInfoController.md)] [→ [StreamController](https://api.flutter.dev/flutter/dart-async/StreamController-class.html)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.md)]\>]]
:   Retrieves the stream controller for current organization
    information.
    ::: features
    no setter
    :::

[[currentOrgInfoStream](../services_user_config/UserConfig/currentOrgInfoStream.md)] [→ [Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.md)]\>]]
:   Retrieves the stream of current organization information.
    ::: features
    no setter
    :::

[[currentOrgName](../services_user_config/UserConfig/currentOrgName.md)] [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   Retrieves the name of the current organization.
    ::: features
    no setter
    :::

[[currentUser](../services_user_config/UserConfig/currentUser.md)] [↔ [User](../models_user_user_info/User-class.md)]
:   Retrieves the current user.
    ::: features
    getter/setter pair
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[loggedIn](../services_user_config/UserConfig/loggedIn.md)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   Checks if a user is logged in.
    ::: features
    no setter
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::



## Methods

[initialiseStream](../services_user_config/UserConfig/initialiseStream.md) [→ void ]
:   initialise.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[[saveCurrentOrgInHive](../services_user_config/UserConfig/saveCurrentOrgInHive.md)][([[[OrgInfo](../models_organization_org_info/OrgInfo-class.md)] saveOrgAsCurrent]) → void ]
:   save current organization details in hive.

[saveUserInHive](../services_user_config/UserConfig/saveUserInHive.md) [→ void ]
:   save user in hive.

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][ [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::

[[updateAccessToken](../services_user_config/UserConfig/updateAccessToken.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Updates the access token of the user.

[[updateUser](../services_user_config/UserConfig/updateUser.md)][([[[User](../models_user_user_info/User-class.md)] updatedUserDetails]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]\>]] ]
:   Updates the user details.

[[updateUserAdminOrg](../services_user_config/UserConfig/updateUserAdminOrg.md)][([[[List](https://api.flutter.dev/flutter/dart-core/List-class.md)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.md)]\>]] orgDetails]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Updates the organization admin.

[[updateUserCreatedOrg](../services_user_config/UserConfig/updateUserCreatedOrg.md)][([[[List](https://api.flutter.dev/flutter/dart-core/List-class.md)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.md)]\>]] orgDetails]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Updates the user created organization.

[[updateUserJoinedOrg](../services_user_config/UserConfig/updateUserJoinedOrg.md)][([[[List](https://api.flutter.dev/flutter/dart-core/List-class.md)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.md)]\>]] orgDetails]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Updates the user joined organization.

[[updateUserMemberRequestOrg](../services_user_config/UserConfig/updateUserMemberRequestOrg.md)][([[[List](https://api.flutter.dev/flutter/dart-core/List-class.md)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.md)]\>]] orgDetails]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Updates the user request to join the organization.

[[userLoggedIn](../services_user_config/UserConfig/userLoggedIn.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]\>]] ]
:   This function is used to log in the user.

[[userLogOut](../services_user_config/UserConfig/userLogOut.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Logs out the current user.



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.md)
2.  [user_config](../services_user_config/)
3.  UserConfig class

##### user_config library







