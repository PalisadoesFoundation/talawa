




User class - user\_info library - Dart API







menu

1. [talawa](../index.html)
2. [models/user/user\_info.dart](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_user_user_info/)
3. User class

User


dark\_mode

light\_mode




# User class


This class creates a User model and returns a user instance.


## Constructors

[User](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_user_user_info/User/User.html)({[List](https://api.flutter.dev/flutter/dart-core/List-class.html)? adminFor, [List](https://api.flutter.dev/flutter/dart-core/List-class.html)? createdOrganizations, [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? email, [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? firstName, [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? id, [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? image, [List](https://api.flutter.dev/flutter/dart-core/List-class.html)? joinedOrganizations, [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? lastName, [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? authToken, [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? refreshToken, [List](https://api.flutter.dev/flutter/dart-core/List-class.html)? membershipRequests})


[User.fromJson](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_user_user_info/User/User.fromJson.html)([Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> json1, {[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) fromOrg = false})

factory



## Properties

[adminFor](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_user_user_info/User/adminFor.html)
↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)?

HiveField for all organisations user is admin of.
getter/setter pair

[authToken](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_user_user_info/User/authToken.html)
↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?

HiveField for authToken.
getter/setter pair

[createdOrganizations](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_user_user_info/User/createdOrganizations.html)
↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)?

HiveField for all organisations created by user.
getter/setter pair

[email](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_user_user_info/User/email.html)
↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?

HiveField for user's Email.
getter/setter pair

[firstName](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_user_user_info/User/firstName.html)
↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?

HiveField for user's first name.
getter/setter pair

[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)
→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)

The hash code for this object.
no setterinherited

[id](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_user_user_info/User/id.html)
↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?

HiveField for userID.
getter/setter pair

[image](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_user_user_info/User/image.html)
↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?

HiveField for user's avatar.
getter/setter pair

[joinedOrganizations](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_user_user_info/User/joinedOrganizations.html)
↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)?

/// HiveField for all organisations joined by user.
getter/setter pair

[lastName](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_user_user_info/User/lastName.html)
↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?

HiveField for user's last name.
getter/setter pair

[membershipRequests](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_user_user_info/User/membershipRequests.html)
↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)?

HiveField for all organisations user has sent membership request.
getter/setter pair

[refreshToken](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_user_user_info/User/refreshToken.html)
↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?

HiveField for refreshToken.
getter/setter pair

[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)
→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)

A representation of the runtime type of the object.
no setterinherited



## Methods

[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[print](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_user_user_info/User/print.html)()
→ void


Method to print the User details.

[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)()
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


A string representation of this object.
inherited

[update](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_user_user_info/User/update.html)([User](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_user_user_info/User-class.html) details)
→ void


Method to update the user details.

[updateAdminFor](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_user_user_info/User/updateAdminFor.html)([List](https://api.flutter.dev/flutter/dart-core/List-class.html) orgList)
→ void


Method to update adminFor List.

[updateCreatedOrg](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_user_user_info/User/updateCreatedOrg.html)([List](https://api.flutter.dev/flutter/dart-core/List-class.html) orgList)
→ void


Method to updated createdOrganisation list.

[updateJoinedOrg](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_user_user_info/User/updateJoinedOrg.html)([List](https://api.flutter.dev/flutter/dart-core/List-class.html) orgList)
→ void


Method to updated joinedOrganisation list.

[updateMemberRequestOrg](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_user_user_info/User/updateMemberRequestOrg.html)([List](https://api.flutter.dev/flutter/dart-core/List-class.html) orgList)
→ void


Method to update membershipRequests List.



## Operators

[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other)
→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [user\_info](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_user_user_info/)
3. User class

##### user\_info library





talawa
1.0.0+1






