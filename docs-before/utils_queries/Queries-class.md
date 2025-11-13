<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [utils/queries.dart](../utils_queries/)
3.  Queries class

<div class="self-name">

Queries

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="utils_queries/utils_queries-library-sidebar.html"
below-sidebar="utils_queries/Queries-class-sidebar.html">

<div>

# <span class="kind-class">Queries</span> class

</div>

<div class="section desc markdown">

This class returns some queries for the application.

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[Queries.new](../utils_queries/Queries/Queries.md)</span><span class="signature"></span>  

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[fetchJoinInOrg](../utils_queries/Queries/fetchJoinInOrg.md)</span> <span class="signature">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>  
getter for joined org.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[fetchJoinInOrgByName](../utils_queries/Queries/fetchJoinInOrgByName.md)</span> <span class="signature">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>  
getter for fetchJoinInOrgByName.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[fetchUserInfo](../utils_queries/Queries/fetchUserInfo.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>  
mutation in string form, to be passed on to graphql client..

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

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

<span class="name">[createDonation](../utils_queries/Queries/createDonation.md)</span><span class="signature">(<span id="createDonation-param-userId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">userId</span>, </span><span id="createDonation-param-orgId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> <span class="parameter-name">orgId</span>, </span><span id="createDonation-param-nameOfOrg" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> <span class="parameter-name">nameOfOrg</span>, </span><span id="createDonation-param-nameOfUser" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> <span class="parameter-name">nameOfUser</span>, </span><span id="createDonation-param-payPalId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> <span class="parameter-name">payPalId</span>, </span><span id="createDonation-param-amount" class="parameter"><span class="type-annotation">[double](https://api.flutter.dev/flutter/dart-core/double-class.html)</span> <span class="parameter-name">amount</span></span>) <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
`createDonation` creates a new donation transaction by taking the userId
,orgId ,nameOfOrg ,nameOfUser as parameters.

<span class="name">[fetchOrgById](../utils_queries/Queries/fetchOrgById.md)</span><span class="signature">(<span id="fetchOrgById-param-orgId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">orgId</span></span>) <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
fetching org details with the help of id.

<span class="name">[fetchOrgDetailsById](../utils_queries/Queries/fetchOrgDetailsById.md)</span><span class="signature">(<span id="fetchOrgDetailsById-param-orgId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">orgId</span></span>) <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
query to fetch org details.

<span class="name">[fetchUsersByOrganizationId](../utils_queries/Queries/fetchUsersByOrganizationId.md)</span><span class="signature">(<span id="fetchUsersByOrganizationId-param-orgId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">orgId</span></span>) <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
Query to fetch users by organization ID using new GraphQL schema.

<span class="name">[joinOrgById](../utils_queries/Queries/joinOrgById.md)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
make mutation string for joiining org by ord.id.

<span class="name">[loginUser](../utils_queries/Queries/loginUser.md)</span><span class="signature">(<span id="loginUser-param-email" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">email</span>, </span><span id="loginUser-param-password" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> <span class="parameter-name">password</span></span>) <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
mutation to login the user.

<span class="name">[logout](../utils_queries/Queries/logout.md)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
logout muiation.

<span class="name">[newUserLanguage](../utils_queries/Queries/newUserLanguage.md)</span><span class="signature">(<span id="newUserLanguage-param-userId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">userId</span></span>) <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
query for new user language .

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[refreshToken](../utils_queries/Queries/refreshToken.md)</span><span class="signature">(<span id="refreshToken-param-refreshToken" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">refreshToken</span></span>) <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
mutation for refresh token.

<span class="name">[registerUser](../utils_queries/Queries/registerUser.md)</span><span class="signature">(<span id="registerUser-param-firstName" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">firstName</span>, </span><span id="registerUser-param-lastName" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> <span class="parameter-name">lastName</span>, </span><span id="registerUser-param-email" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> <span class="parameter-name">email</span>, </span><span id="registerUser-param-password" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> <span class="parameter-name">password</span>, </span><span id="registerUser-param-selectedOrganization" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span> <span class="parameter-name">selectedOrganization</span></span>) <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
Mutation to register a user.

<span class="name">[sendMembershipRequest](../utils_queries/Queries/sendMembershipRequest.md)</span><span class="signature">(<span id="sendMembershipRequest-param-orgId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">orgId</span></span>) <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
mutation to send the member request.

<span class="name">[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
A string representation of this object.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[updateLanguage](../utils_queries/Queries/updateLanguage.md)</span><span class="signature">(<span id="updateLanguage-param-languageCode" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">languageCode</span></span>) <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
lang update mutation.

<span class="name">[updateUserProfile](../utils_queries/Queries/updateUserProfile.md)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
to update user profile.

<span class="name">[userLanguage](../utils_queries/Queries/userLanguage.md)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
query to fetch user lang.

<span class="name">[venueListQuery](../utils_queries/Queries/venueListQuery.md)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
Query to get the list of Venues in an organisation.

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
2.  [queries](../utils_queries/)
3.  Queries class

##### queries library

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
