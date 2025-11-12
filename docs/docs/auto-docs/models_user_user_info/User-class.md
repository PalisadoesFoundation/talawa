



menu

1.  [talawa](../index.md)
2.  [models/user/user_info.dart](../models_user_user_info/)
3.  User class


User


 dark_mode   light_mode 




<div>

# User class

</div>


This class creates a User model and returns a user instance.




Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [HiveObject](https://pub.dev/documentation/hive/2.2.3/hive/HiveObject-class.html)
    -   User

Annotations

:   -   @[HiveType](https://pub.dev/documentation/hive/2.2.3/hive/HiveType/HiveType.html)(typeId:
        1)



## Constructors

[[User](../models_user_user_info/User/User.md)][]

:   

[[User.fromJson](../models_user_user_info/User/User.fromJson.md)][([[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]] json, )]

:   ::: 
    factory
    :::



## Properties

[[adminFor](../models_user_user_info/User/adminFor.md)] [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.md)]\>]?]
:   HiveField for all organisations user is admin of.
    ::: features
    getter/setter pair
    :::

[[authToken](../models_user_user_info/User/authToken.md)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
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

[[createdOrganizations](../models_user_user_info/User/createdOrganizations.md)] [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.md)]\>]?]
:   HiveField for all organisations created by user.
    ::: features
    getter/setter pair
    :::

[[email](../models_user_user_info/User/email.md)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   HiveField for user\'s Email.
    ::: features
    getter/setter pair
    :::

[[firstName](../models_user_user_info/User/firstName.md)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   HiveField for user\'s first name.
    ::: features
    getter/setter pair
    :::

[[hashCode](../models_user_user_info/User/hashCode.md)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setteroverride
    :::

[[id](../models_user_user_info/User/id.md)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   HiveField for userID.
    ::: features
    getter/setter pair
    :::

[[image](../models_user_user_info/User/image.md)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   HiveField for user\'s avatar.
    ::: features
    getter/setter pair
    :::

[[isInBox](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/isInBox.html)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   Returns whether this object is currently stored in a box.
    ::: features
    no setterinherited
    :::

[[joinedOrganizations](../models_user_user_info/User/joinedOrganizations.md)] [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.md)]\>]?]
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

[[lastName](../models_user_user_info/User/lastName.md)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   HiveField for user\'s last name.
    ::: features
    getter/setter pair
    :::

[[membershipRequests](../models_user_user_info/User/membershipRequests.md)] [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.md)]\>]?]
:   HiveField for all organisations user has sent membership request.
    ::: features
    getter/setter pair
    :::

[[name](../models_user_user_info/User/name.md)] [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   Computed property to get the full name of the user.
    ::: features
    no setter
    :::

[[refreshToken](../models_user_user_info/User/refreshToken.md)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
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

[[delete](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/delete.html)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Deletes this object from the box it is stored in.
    ::: features
    inherited
    :::

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[print](../models_user_user_info/User/print.md) [→ void ]
:   Method to print the User details.

[[save](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/save.html)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Persists this object.
    ::: features
    inherited
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][ [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::

[[update](../models_user_user_info/User/update.md)][([[[User](../models_user_user_info/User-class.md)] details]) → void ]
:   Method to update the user details.

[[updateAdminFor](../models_user_user_info/User/updateAdminFor.md)][([[[List](https://api.flutter.dev/flutter/dart-core/List-class.md)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.md)]\>]] orgList]) → void ]
:   Method to update adminFor List.

[[updateCreatedOrg](../models_user_user_info/User/updateCreatedOrg.md)][([[[List](https://api.flutter.dev/flutter/dart-core/List-class.md)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.md)]\>]] orgList]) → void ]
:   Method to updated createdOrganisation list.

[[updateJoinedOrg](../models_user_user_info/User/updateJoinedOrg.md)][([[[OrgInfo](../models_organization_org_info/OrgInfo-class.md)] org]) → void ]
:   Method to updated joinedOrganisation list.

[[updateMemberRequestOrg](../models_user_user_info/User/updateMemberRequestOrg.md)][([[[List](https://api.flutter.dev/flutter/dart-core/List-class.md)[\<[[OrgInfo](../models_organization_org_info/OrgInfo-class.md)]\>]] orgList]) → void ]
:   Method to update membershipRequests List.



## Operators

[[operator ==](../models_user_user_info/User/operator_equals.md)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    override
    :::







1.  [talawa](../index.md)
2.  [user_info](../models_user_user_info/)
3.  User class

##### user_info library









 talawa 1.0.0+1 
