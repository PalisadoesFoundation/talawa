<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [models/user/user_info.dart](../models_user_user_info/)
3.  User class

<div class="self-name">

User

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="models_user_user_info/models_user_user_info-library-sidebar.html"
below-sidebar="models_user_user_info/User-class-sidebar.html">

<div>

# <span class="kind-class">User</span> class

</div>

<div class="section desc markdown">

This class creates a User model and returns a user instance.

</div>

<div class="section">

Inheritance  
- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [HiveObject](https://pub.dev/documentation/hive/2.2.3/hive/HiveObject-class.html)
- User

Annotations  
- @[HiveType](https://pub.dev/documentation/hive/2.2.3/hive/HiveType-class.html)(typeId:
  1)

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[User.new](../models_user_user_info/User/User.md)</span><span class="signature"></span>  

<span class="name">[User.fromJson](../models_user_user_info/User/User.fromJson.md)</span><span class="signature">(<span id="fromJson-param-json" class="parameter"><span class="type-annotation">[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>, <span class="type-parameter">dynamic</span>\></span></span> <span class="parameter-name">json</span>, )</span>  
<div class="constructor-modifier features">

factory

</div>

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[adminFor](../models_user_user_info/User/adminFor.md)</span> <span class="signature">↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[OrgInfo](../models_organization_org_info/OrgInfo-class.md)</span>\></span>?</span>  
HiveField for all organisations user is admin of.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[authToken](../models_user_user_info/User/authToken.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
HiveField for authToken.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[box](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/box.html)</span> <span class="signature">→ [BoxBase](https://pub.dev/documentation/hive/2.2.3/hive/BoxBase-class.html)?</span>  
Get the box in which this object is stored. Returns `null` if object has
not been added to a box yet.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[createdOrganizations](../models_user_user_info/User/createdOrganizations.md)</span> <span class="signature">↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[OrgInfo](../models_organization_org_info/OrgInfo-class.md)</span>\></span>?</span>  
HiveField for all organisations created by user.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[email](../models_user_user_info/User/email.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
HiveField for user's Email.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[firstName](../models_user_user_info/User/firstName.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
HiveField for user's first name.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[hashCode](../models_user_user_info/User/hashCode.md)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">override</span>

</div>

<span class="name">[id](../models_user_user_info/User/id.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
HiveField for userID.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[image](../models_user_user_info/User/image.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
HiveField for user's avatar.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[isInBox](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/isInBox.html)</span> <span class="signature">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
Returns whether this object is currently stored in a box.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[joinedOrganizations](../models_user_user_info/User/joinedOrganizations.md)</span> <span class="signature">↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[OrgInfo](../models_organization_org_info/OrgInfo-class.md)</span>\></span>?</span>  
/// HiveField for all organisations joined by user.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[key](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/key.html)</span> <span class="signature">→ dynamic</span>  
Get the key associated with this object. Returns `null` if object has
not been added to a box yet.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[lastName](../models_user_user_info/User/lastName.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
HiveField for user's last name.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[membershipRequests](../models_user_user_info/User/membershipRequests.md)</span> <span class="signature">↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[OrgInfo](../models_organization_org_info/OrgInfo-class.md)</span>\></span>?</span>  
HiveField for all organisations user has sent membership request.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[name](../models_user_user_info/User/name.md)</span> <span class="signature">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
Computed property to get the full name of the user.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[refreshToken](../models_user_user_info/User/refreshToken.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
HiveField for refreshToken.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)</span> <span class="signature">→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)</span>  
A representation of the runtime type of the object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

</div>

<div id="instance-methods" class="section summary offset-anchor">

## Methods

<span class="name">[delete](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/delete.html)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Deletes this object from the box it is stored in.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[print](../models_user_user_info/User/print.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Method to print the User details.

<span class="name">[save](https://pub.dev/documentation/hive/2.2.3/hive/HiveObjectMixin/save.html)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Persists this object.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
A string representation of this object.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[update](../models_user_user_info/User/update.md)</span><span class="signature">(<span id="update-param-details" class="parameter"><span class="type-annotation">[User](../models_user_user_info/User-class.md)</span> <span class="parameter-name">details</span></span>) <span class="returntype parameter">→ void</span> </span>  
Method to update the user details.

<span class="name">[updateAdminFor](../models_user_user_info/User/updateAdminFor.md)</span><span class="signature">(<span id="updateAdminFor-param-orgList" class="parameter"><span class="type-annotation">[List](https://api.flutter.dev/flutter/dart-core/List-class.md)<span class="signature">\<<span class="type-parameter">[OrgInfo](../models_organization_org_info/OrgInfo-class.md)</span>\></span></span> <span class="parameter-name">orgList</span></span>) <span class="returntype parameter">→ void</span> </span>  
Method to update adminFor List.

<span class="name">[updateCreatedOrg](../models_user_user_info/User/updateCreatedOrg.md)</span><span class="signature">(<span id="updateCreatedOrg-param-orgList" class="parameter"><span class="type-annotation">[List](https://api.flutter.dev/flutter/dart-core/List-class.md)<span class="signature">\<<span class="type-parameter">[OrgInfo](../models_organization_org_info/OrgInfo-class.md)</span>\></span></span> <span class="parameter-name">orgList</span></span>) <span class="returntype parameter">→ void</span> </span>  
Method to updated createdOrganisation list.

<span class="name">[updateJoinedOrg](../models_user_user_info/User/updateJoinedOrg.md)</span><span class="signature">(<span id="updateJoinedOrg-param-org" class="parameter"><span class="type-annotation">[OrgInfo](../models_organization_org_info/OrgInfo-class.md)</span> <span class="parameter-name">org</span></span>) <span class="returntype parameter">→ void</span> </span>  
Method to updated joinedOrganisation list.

<span class="name">[updateMemberRequestOrg](../models_user_user_info/User/updateMemberRequestOrg.md)</span><span class="signature">(<span id="updateMemberRequestOrg-param-orgList" class="parameter"><span class="type-annotation">[List](https://api.flutter.dev/flutter/dart-core/List-class.md)<span class="signature">\<<span class="type-parameter">[OrgInfo](../models_organization_org_info/OrgInfo-class.md)</span>\></span></span> <span class="parameter-name">orgList</span></span>) <span class="returntype parameter">→ void</span> </span>  
Method to update membershipRequests List.

</div>

<div id="operators" class="section summary offset-anchor">

## Operators

<span class="name">[operator ==](../models_user_user_info/User/operator_equals.md)</span><span class="signature">(<span id="==-param-other" class="parameter"><span class="type-annotation">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)</span> <span class="parameter-name">other</span></span>) <span class="returntype parameter">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span> </span>  
The equality operator.

<div class="features">

<span class="feature">override</span>

</div>

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../index.md)
2.  [user_info](../models_user_user_info/)
3.  User class

##### user_info library

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
