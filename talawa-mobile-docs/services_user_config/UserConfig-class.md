


# UserConfig class









<p>UserConfig class provides different services in the context of the User.</p>
<p>Services include:</p>
<ul>
<li><code>userLoggedIn</code> : helps to make user logged in to the application.</li>
<li><code>updateUserJoinedOrg</code> : helps to update the user joined organization.</li>
<li><code>updateUserCreatedOrg</code> : helps to update the user created organization.</li>
<li><code>updateUserMemberRequestOrg</code> : helps to update the User membership request for the organization.</li>
<li><code>updateUserAdminOrg</code> : helps to update the Admin of the Organization.</li>
<li><code>updateAccessToken</code> : helps to update the access token of an user.</li>
<li><code>updateUser</code> : helps to update the user.</li>
</ul>




## Constructors

[UserConfig](../services_user_config/UserConfig/UserConfig.md) ()

   


## Properties

##### [currentOrg](../services_user_config/UserConfig/currentOrg.md) &#8596; [OrgInfo](../models_organization_org_info/OrgInfo-class.md)



  
_<span class="feature">read / write</span>_



##### [currentOrgInfoController](../services_user_config/UserConfig/currentOrgInfoController.md) &#8594; [StreamController](https://api.flutter.dev/flutter/dart-async/StreamController-class.html)&lt;[OrgInfo](../models_organization_org_info/OrgInfo-class.md)>



  
_<span class="feature">read-only</span>_



##### [currentOrgInfoStream](../services_user_config/UserConfig/currentOrgInfoStream.md) &#8594; [Stream](https://api.flutter.dev/flutter/dart-async/Stream-class.html)&lt;[OrgInfo](../models_organization_org_info/OrgInfo-class.md)>



  
_<span class="feature">read-only</span>_



##### [currentOrgName](../services_user_config/UserConfig/currentOrgName.md) &#8594; [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



  
_<span class="feature">read-only</span>_



##### [currentUser](../services_user_config/UserConfig/currentUser.md) &#8596; [User](../models_user_user_info/User-class.md)



  
_<span class="feature">read / write</span>_



##### [hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html) &#8594; [int](https://api.flutter.dev/flutter/dart-core/int-class.html)



The hash code for this object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html) &#8594; [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)



A representation of the runtime type of the object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_





## Methods

##### [initialiseStream](../services_user_config/UserConfig/initialiseStream.md)() void



  




##### [noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation) dynamic



Invoked when a non-existent method or property is accessed.  
_<span class="feature">inherited</span>_



##### [saveCurrentOrgInHive](../services_user_config/UserConfig/saveCurrentOrgInHive.md)([OrgInfo](../models_organization_org_info/OrgInfo-class.md) saveOrgAsCurrent) void



  




##### [saveUserInHive](../services_user_config/UserConfig/saveUserInHive.md)() void



  




##### [toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)() [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



A string representation of this object.  
_<span class="feature">inherited</span>_



##### [updateAccessToken](../services_user_config/UserConfig/updateAccessToken.md)({required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) accessToken, required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) refreshToken}) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)



This function is used to updated the access token of the user.  




##### [updateUser](../services_user_config/UserConfig/updateUser.md)([User](../models_user_user_info/User-class.md) updatedUserDetails) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)>



This function is used to update the user details.  




##### [updateUserAdminOrg](../services_user_config/UserConfig/updateUserAdminOrg.md)([List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[OrgInfo](../models_organization_org_info/OrgInfo-class.md)> orgDetails) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)



This function is used to update the organization admin.  




##### [updateUserCreatedOrg](../services_user_config/UserConfig/updateUserCreatedOrg.md)([List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[OrgInfo](../models_organization_org_info/OrgInfo-class.md)> orgDetails) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)



This function is used to update the user created organization.  




##### [updateUserJoinedOrg](../services_user_config/UserConfig/updateUserJoinedOrg.md)([List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[OrgInfo](../models_organization_org_info/OrgInfo-class.md)> orgDetails) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)



This function is used to update the user joined organization.  




##### [updateUserMemberRequestOrg](../services_user_config/UserConfig/updateUserMemberRequestOrg.md)([List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[OrgInfo](../models_organization_org_info/OrgInfo-class.md)> orgDetails) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)



This function is used to update the user request to join the organization.  




##### [userLoggedIn](../services_user_config/UserConfig/userLoggedIn.md)() [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)>



This function is used to log in the user.  






## Operators

##### [operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



The equality operator.  
_<span class="feature">inherited</span>_















