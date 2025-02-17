
<div>

# User class

</div>


This class creates a User model and returns a user instance.




Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [HiveObject](https://pub.dev/documentation/hive/2.2.3/hive/HiveObject-class.html)
    -   User

Annotations

:   -   @[HiveType](https://pub.dev/documentation/hive/2.2.3/hive/HiveType-class.html)(typeId:
        1)



## Constructors

[[User](../models_user_user_info/User/User.html)][({[[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)]\>]?] adminFor, ][[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)]\>]?] createdOrganizations, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?] email, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?] firstName, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?] id, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?] image, ][[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)]\>]?] joinedOrganizations, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?] lastName, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?] authToken, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?] refreshToken, ][[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)]\>]?] membershipRequests]})]

:   

[[User.fromJson](../models_user_user_info/User/User.fromJson.html)][([[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]] json, {][[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] fromOrg = false]})]

:   ::: 
    factory
    :::



## Properties

[[adminFor](../models_user_user_info/User/adminFor.html)] [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)]\>]?]
:   HiveField for all organisations user is admin of.
    ::: features
    getter/setter pair
    :::

[[authToken](../models_user_user_info/User/authToken.html)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   HiveField for authToken.
    ::: features
    getter/setter pair
    :::

[[box](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/box.html)] [→ [BoxBase](https://pub.dev/documentation/hive/2.2.3/hive/BoxBase-class.html)?]
:   Get the box in which this object is stored. Returns `null` if object
    has not been added to a box yet.
    ::: features
    no setterinherited
    :::

[[createdOrganizations](../models_user_user_info/User/createdOrganizations.html)] [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)]\>]?]
:   HiveField for all organisations created by user.
    ::: features
    getter/setter pair
    :::

[[email](../models_user_user_info/User/email.html)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   HiveField for user\'s Email.
    ::: features
    getter/setter pair
    :::

[[firstName](../models_user_user_info/User/firstName.html)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   HiveField for user\'s first name.
    ::: features
    getter/setter pair
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[id](../models_user_user_info/User/id.html)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   HiveField for userID.
    ::: features
    getter/setter pair
    :::

[[image](../models_user_user_info/User/image.html)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   HiveField for user\'s avatar.
    ::: features
    getter/setter pair
    :::

[[isInBox](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/isInBox.html)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   Returns whether this object is currently stored in a box.
    ::: features
    no setterinherited
    :::

[[joinedOrganizations](../models_user_user_info/User/joinedOrganizations.html)] [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)]\>]?]
:   /// HiveField for all organisations joined by user.
    ::: features
    getter/setter pair
    :::

[[key](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/key.html)] → dynamic
:   Get the key associated with this object. Returns `null` if object
    has not been added to a box yet.
    ::: features
    no setterinherited
    :::

[[lastName](../models_user_user_info/User/lastName.html)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   HiveField for user\'s last name.
    ::: features
    getter/setter pair
    :::

[[membershipRequests](../models_user_user_info/User/membershipRequests.html)] [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)]\>]?]
:   HiveField for all organisations user has sent membership request.
    ::: features
    getter/setter pair
    :::

[[refreshToken](../models_user_user_info/User/refreshToken.html)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   HiveField for refreshToken.
    ::: features
    getter/setter pair
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::



## Methods

[[delete](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/delete.html)][() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Deletes this object from the box it is stored in.
    ::: features
    inherited
    :::

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[print](../models_user_user_info/User/print.html) [→ void ]
:   Method to print the User details.

[[save](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/save.html)][() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Persists this object.
    ::: features
    inherited
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::

[[update](../models_user_user_info/User/update.html)][([[[User](../models_user_user_info/User-class.html)] details]) → void ]
:   Method to update the user details.

[[updateAdminFor](../models_user_user_info/User/updateAdminFor.html)][([[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)]\>]] orgList]) → void ]
:   Method to update adminFor List.

[[updateCreatedOrg](../models_user_user_info/User/updateCreatedOrg.html)][([[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)]\>]] orgList]) → void ]
:   Method to updated createdOrganisation list.

[[updateJoinedOrg](../models_user_user_info/User/updateJoinedOrg.html)][([[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)]\>]] orgList]) → void ]
:   Method to updated joinedOrganisation list.

[[updateMemberRequestOrg](../models_user_user_info/User/updateMemberRequestOrg.html)][([[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)]\>]] orgList]) → void ]
:   Method to update membershipRequests List.



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.html)
2.  [user_info](../models_user_user_info/)
3.  User class

##### user_info library







