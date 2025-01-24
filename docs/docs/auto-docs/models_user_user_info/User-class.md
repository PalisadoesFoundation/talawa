




User class - user\_info library - Dart API







menu

1. [talawa](../index.html)
2. [models/user/user\_info.dart](../models_user_user_info/models_user_user_info-library.html)
3. User class

User


dark\_mode

light\_mode




# User class


This class creates a User model and returns a user instance.


Inheritance

* Object
* [HiveObject](https://pub.dev/documentation/hive/2.2.3/hive/HiveObject-class.html)
* User

Annotations

* @[HiveType](https://pub.dev/documentation/hive/2.2.3/hive/HiveType-class.html)(typeId: 1)



## Constructors

[User](../models_user_user_info/User/User.html)({List<[OrgInfo](../models_organization_org_info/OrgInfo-class.html)>? adminFor, List<[OrgInfo](../models_organization_org_info/OrgInfo-class.html)>? createdOrganizations, String? email, String? firstName, String? id, String? image, List<[OrgInfo](../models_organization_org_info/OrgInfo-class.html)>? joinedOrganizations, String? lastName, String? authToken, String? refreshToken, List<[OrgInfo](../models_organization_org_info/OrgInfo-class.html)>? membershipRequests})


[User.fromJson](../models_user_user_info/User/User.fromJson.html)(Map<String, dynamic> json1, {bool fromOrg = false})

factory



## Properties

[adminFor](../models_user_user_info/User/adminFor.html)
↔ List<[OrgInfo](../models_organization_org_info/OrgInfo-class.html)>?

HiveField for all organisations user is admin of.
getter/setter pair

[authToken](../models_user_user_info/User/authToken.html)
↔ String?

HiveField for authToken.
getter/setter pair

[box](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/box.html)
→ [BoxBase](https://pub.dev/documentation/hive/2.2.3/hive/BoxBase-class.html)?

Get the box in which this object is stored. Returns `null` if object has
not been added to a box yet.
no setterinherited

[createdOrganizations](../models_user_user_info/User/createdOrganizations.html)
↔ List<[OrgInfo](../models_organization_org_info/OrgInfo-class.html)>?

HiveField for all organisations created by user.
getter/setter pair

[email](../models_user_user_info/User/email.html)
↔ String?

HiveField for user's Email.
getter/setter pair

[firstName](../models_user_user_info/User/firstName.html)
↔ String?

HiveField for user's first name.
getter/setter pair

[hashCode](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/hashCode.html)
→ int

The hash code for this object.
no setterinherited

[id](../models_user_user_info/User/id.html)
↔ String?

HiveField for userID.
getter/setter pair

[image](../models_user_user_info/User/image.html)
↔ String?

HiveField for user's avatar.
getter/setter pair

[isInBox](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/isInBox.html)
→ bool

Returns whether this object is currently stored in a box.
no setterinherited

[joinedOrganizations](../models_user_user_info/User/joinedOrganizations.html)
↔ List<[OrgInfo](../models_organization_org_info/OrgInfo-class.html)>?

/// HiveField for all organisations joined by user.
getter/setter pair

[key](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/key.html)
→ dynamic

Get the key associated with this object. Returns `null` if object has
not been added to a box yet.
no setterinherited

[lastName](../models_user_user_info/User/lastName.html)
↔ String?

HiveField for user's last name.
getter/setter pair

[membershipRequests](../models_user_user_info/User/membershipRequests.html)
↔ List<[OrgInfo](../models_organization_org_info/OrgInfo-class.html)>?

HiveField for all organisations user has sent membership request.
getter/setter pair

[refreshToken](../models_user_user_info/User/refreshToken.html)
↔ String?

HiveField for refreshToken.
getter/setter pair

[runtimeType](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited



## Methods

[delete](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/delete.html)()
→ Future<void>


Deletes this object from the box it is stored in.
inherited

[noSuchMethod](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/noSuchMethod.html)(Invocation invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[print](../models_user_user_info/User/print.html)()
→ void


Method to print the User details.

[save](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/save.html)()
→ Future<void>


Persists this object.
inherited

[toString](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/toString.html)()
→ String


A string representation of this object.
inherited

[update](../models_user_user_info/User/update.html)([User](../models_user_user_info/User-class.html) details)
→ void


Method to update the user details.

[updateAdminFor](../models_user_user_info/User/updateAdminFor.html)(List<[OrgInfo](../models_organization_org_info/OrgInfo-class.html)> orgList)
→ void


Method to update adminFor List.

[updateCreatedOrg](../models_user_user_info/User/updateCreatedOrg.html)(List<[OrgInfo](../models_organization_org_info/OrgInfo-class.html)> orgList)
→ void


Method to updated createdOrganisation list.

[updateJoinedOrg](../models_user_user_info/User/updateJoinedOrg.html)(List<[OrgInfo](../models_organization_org_info/OrgInfo-class.html)> orgList)
→ void


Method to updated joinedOrganisation list.

[updateMemberRequestOrg](../models_user_user_info/User/updateMemberRequestOrg.html)(List<[OrgInfo](../models_organization_org_info/OrgInfo-class.html)> orgList)
→ void


Method to update membershipRequests List.



## Operators

[operator ==](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [user\_info](../models_user_user_info/models_user_user_info-library.html)
3. User class

##### user\_info library





talawa
1.0.0+1






