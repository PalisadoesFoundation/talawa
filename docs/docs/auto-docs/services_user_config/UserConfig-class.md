<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [services/user_config.dart](../services_user_config/)
3.  UserConfig class

<div class="self-name">

UserConfig

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="services_user_config/services_user_config-library-sidebar.html"
below-sidebar="services_user_config/UserConfig-class-sidebar.html">

<div>

# <span class="kind-class">UserConfig</span> class

</div>

<div class="section desc markdown">

Provides different services in the context of the User.

Services include:

- `userLoggedIn` : helps to make user logged in to the application.
- `updateUserJoinedOrg` : helps to update the user joined organization.
- `updateUserCreatedOrg` : helps to update the user created
  organization.
- `updateUserMemberRequestOrg` : helps to update the User membership
  request for the organization.
- `updateUserAdminOrg` : helps to update the Admin of the Organization.
- `updateAccessToken` : helps to update the access token of an user.
- `updateUser` : helps to update the user.

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[UserConfig](../services_user_config/UserConfig/UserConfig.md)</span><span class="signature"></span>  

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[currentOrg](../services_user_config/UserConfig/currentOrg.md)</span> <span class="signature">↔ [OrgInfo](../models_organization_org_info/OrgInfo-class.md)</span>  
Retrieves the current organization information.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[currentOrgInfoController](../services_user_config/UserConfig/currentOrgInfoController.md)</span> <span class="signature">→ [StreamController](https://api.flutter.dev/flutter/dart-async/StreamController-class.html)<span class="signature">\<<span class="type-parameter">[OrgInfo](../models_organization_org_info/OrgInfo-class.md)</span>\></span></span>  
Retrieves the stream controller for current organization information.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[currentOrgInfoStream](../services_user_config/UserConfig/currentOrgInfoStream.md)</span> <span class="signature">→ [Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)<span class="signature">\<<span class="type-parameter">[OrgInfo](../models_organization_org_info/OrgInfo-class.md)</span>\></span></span>  
Retrieves the stream of current organization information.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[currentOrgName](../services_user_config/UserConfig/currentOrgName.md)</span> <span class="signature">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>  
Retrieves the name of the current organization.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[currentUser](../services_user_config/UserConfig/currentUser.md)</span> <span class="signature">↔ [User](../models_user_user_info/User-class.md)</span>  
Retrieves the current user.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[loggedIn](../services_user_config/UserConfig/loggedIn.md)</span> <span class="signature">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
Checks if a user is logged in.

<div class="features">

<span class="feature">no setter</span>

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

<span class="name">[initialiseStream](../services_user_config/UserConfig/initialiseStream.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
initialise.

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[performLogout](../services_user_config/UserConfig/performLogout.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">[QueryResult](https://pub.dev/documentation/graphql/5.2.1/graphql/QueryResult-class.html)<span class="signature">\<<span class="type-parameter">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?</span>\></span></span>\></span></span> </span>  
Performs client-side logout

<span class="name">[saveCurrentOrgInHive](../services_user_config/UserConfig/saveCurrentOrgInHive.md)</span><span class="signature">(<span id="saveCurrentOrgInHive-param-saveOrgAsCurrent" class="parameter"><span class="type-annotation">[OrgInfo](../models_organization_org_info/OrgInfo-class.md)</span> <span class="parameter-name">saveOrgAsCurrent</span></span>) <span class="returntype parameter">→ void</span> </span>  
save current organization details in hive.

<span class="name">[saveUserInHive](../services_user_config/UserConfig/saveUserInHive.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
save user in hive.

<span class="name">[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
A string representation of this object.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[updateAccessToken](../services_user_config/UserConfig/updateAccessToken.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Updates the access token of the user.

<span class="name">[updateUser](../services_user_config/UserConfig/updateUser.md)</span><span class="signature">(<span id="updateUser-param-updatedUserDetails" class="parameter"><span class="type-annotation">[User](../models_user_user_info/User-class.md)</span> <span class="parameter-name">updatedUserDetails</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>\></span></span> </span>  
Updates the user details.

<span class="name">[updateUserAdminOrg](../services_user_config/UserConfig/updateUserAdminOrg.md)</span><span class="signature">(<span id="updateUserAdminOrg-param-orgDetails" class="parameter"><span class="type-annotation">[List](https://api.flutter.dev/flutter/dart-core/List-class.md)<span class="signature">\<<span class="type-parameter">[OrgInfo](../models_organization_org_info/OrgInfo-class.md)</span>\></span></span> <span class="parameter-name">orgDetails</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Updates the organization admin.

<span class="name">[updateUserCreatedOrg](../services_user_config/UserConfig/updateUserCreatedOrg.md)</span><span class="signature">(<span id="updateUserCreatedOrg-param-orgDetails" class="parameter"><span class="type-annotation">[List](https://api.flutter.dev/flutter/dart-core/List-class.md)<span class="signature">\<<span class="type-parameter">[OrgInfo](../models_organization_org_info/OrgInfo-class.md)</span>\></span></span> <span class="parameter-name">orgDetails</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Updates the user created organization.

<span class="name">[updateUserJoinedOrg](../services_user_config/UserConfig/updateUserJoinedOrg.md)</span><span class="signature">(<span id="updateUserJoinedOrg-param-orgDetails" class="parameter"><span class="type-annotation">[OrgInfo](../models_organization_org_info/OrgInfo-class.md)</span> <span class="parameter-name">orgDetails</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Updates the user joined organization.

<span class="name">[updateUserMemberRequestOrg](../services_user_config/UserConfig/updateUserMemberRequestOrg.md)</span><span class="signature">(<span id="updateUserMemberRequestOrg-param-orgDetails" class="parameter"><span class="type-annotation">[List](https://api.flutter.dev/flutter/dart-core/List-class.md)<span class="signature">\<<span class="type-parameter">[OrgInfo](../models_organization_org_info/OrgInfo-class.md)</span>\></span></span> <span class="parameter-name">orgDetails</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Updates the user request to join the organization.

<span class="name">[userLoggedIn](../services_user_config/UserConfig/userLoggedIn.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>\></span></span> </span>  
This function is used to log in the user.

<span class="name">[userLogOut](../services_user_config/UserConfig/userLogOut.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Logs out the current user.

</div>

<div id="operators" class="section summary offset-anchor inherited">

## Operators

<span class="name">[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)</span><span class="signature">(<span id="==-param-other" class="parameter"><span class="type-annotation">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)</span> <span class="parameter-name">other</span></span>) <span class="returntype parameter">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span> </span>  
The equality operator.

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../index.md)
2.  [user_config](../services_user_config/)
3.  UserConfig class

##### user_config library

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
