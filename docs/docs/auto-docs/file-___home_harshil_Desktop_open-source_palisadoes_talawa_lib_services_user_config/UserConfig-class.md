




UserConfig class - user\_config library - Dart API







menu

1. [talawa](../index.html)
2. [services/user\_config.dart](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/)
3. UserConfig class

UserConfig


dark\_mode

light\_mode




# UserConfig class


Provides different services in the context of the User.

Services include:

* `userLoggedIn` : helps to make user logged in to the application.
* `updateUserJoinedOrg` : helps to update the user joined organization.
* `updateUserCreatedOrg` : helps to update the user created organization.
* `updateUserMemberRequestOrg` : helps to update the User membership
  request for the organization.
* `updateUserAdminOrg` : helps to update the Admin of the Organization.
* `updateAccessToken` : helps to update the access token of an user.
* `updateUser` : helps to update the user.

## Constructors

[UserConfig](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/UserConfig/UserConfig.html)()




## Properties

[currentOrg](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/UserConfig/currentOrg.html)
↔ dynamic

Retrieves the current organization information.
getter/setter pair

[currentOrgInfoController](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/UserConfig/currentOrgInfoController.html)
→ [StreamController](https://api.flutter.dev/flutter/dart-async/StreamController-class.html)

Retrieves the stream controller for current organization information.
no setter

[currentOrgInfoStream](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/UserConfig/currentOrgInfoStream.html)
→ [Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)

Retrieves the stream of current organization information.
no setter

[currentOrgName](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/UserConfig/currentOrgName.html)
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)

Retrieves the name of the current organization.
no setter

[currentUser](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/UserConfig/currentUser.html)
↔ dynamic

Retrieves the current user.
getter/setter pair

[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)
→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)

The hash code for this object.
no setterinherited

[loggedIn](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/UserConfig/loggedIn.html)
→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)

Checks if a user is logged in.
no setter

[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)
→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)

A representation of the runtime type of the object.
no setterinherited



## Methods

[initialiseStream](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/UserConfig/initialiseStream.html)()
→ void


initialise.

[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[saveCurrentOrgInHive](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/UserConfig/saveCurrentOrgInHive.html)(dynamic saveOrgAsCurrent)
→ void


save current organization details in hive.

[saveUserInHive](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/UserConfig/saveUserInHive.html)()
→ void


save user in hive.

[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)()
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


A string representation of this object.
inherited

[updateAccessToken](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/UserConfig/updateAccessToken.html)({required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) accessToken, required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) refreshToken})
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Updates the access token of the user.

[updateUser](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/UserConfig/updateUser.html)(dynamic updatedUserDetails)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)>


Updates the user details.

[updateUserAdminOrg](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/UserConfig/updateUserAdminOrg.html)([List](https://api.flutter.dev/flutter/dart-core/List-class.html) orgDetails)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Updates the organization admin.

[updateUserCreatedOrg](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/UserConfig/updateUserCreatedOrg.html)([List](https://api.flutter.dev/flutter/dart-core/List-class.html) orgDetails)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Updates the user created organization.

[updateUserJoinedOrg](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/UserConfig/updateUserJoinedOrg.html)([List](https://api.flutter.dev/flutter/dart-core/List-class.html) orgDetails)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Updates the user joined organization.

[updateUserMemberRequestOrg](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/UserConfig/updateUserMemberRequestOrg.html)([List](https://api.flutter.dev/flutter/dart-core/List-class.html) orgDetails)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Updates the user request to join the organization.

[userLoggedIn](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/UserConfig/userLoggedIn.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)>


This function is used to log in the user.

[userLogOut](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/UserConfig/userLogOut.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Logs out the current user.



## Operators

[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other)
→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [user\_config](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/)
3. UserConfig class

##### user\_config library





talawa
1.0.0+1






