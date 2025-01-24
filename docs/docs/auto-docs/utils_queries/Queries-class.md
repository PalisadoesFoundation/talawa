




Queries class - queries library - Dart API







menu

1. [talawa](../index.html)
2. [utils/queries.dart](../utils_queries/utils_queries-library.html)
3. Queries class

Queries


dark\_mode

light\_mode




# Queries class


This class returns some queries for the application.


## Constructors

[Queries](../utils_queries/Queries/Queries.html)()




## Properties

[fetchJoinInOrg](../utils_queries/Queries/fetchJoinInOrg.html)
→ String

getter for joined org.
no setter

[fetchJoinInOrgByName](../utils_queries/Queries/fetchJoinInOrgByName.html)
→ String

getter for fetchJoinInOrgByName.
no setter

[fetchUserInfo](../utils_queries/Queries/fetchUserInfo.html)
↔ String

mutation in string form, to be passed on to graphql client..
getter/setter pair

[hashCode](../utils_queries/Queries/hashCode.html)
→ int

The hash code for this object.
no setterinherited

[runtimeType](../utils_queries/Queries/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited



## Methods

[createDonation](../utils_queries/Queries/createDonation.html)(String userId, String orgId, String nameOfOrg, String nameOfUser, String payPalId, double amount)
→ String


`createDonation` creates a new donation transaction by taking the userId ,orgId ,nameOfOrg ,nameOfUser as parameters.

[fetchOrgById](../utils_queries/Queries/fetchOrgById.html)(String orgId)
→ String


fetching org details with the help of id.

[fetchOrgDetailsById](../utils_queries/Queries/fetchOrgDetailsById.html)(String orgId)
→ String


query to fetch org details.

[getPluginsList](../utils_queries/Queries/getPluginsList.html)()
→ String


`getPluginList` queries all properties of pluginList from the server.

[joinOrgById](../utils_queries/Queries/joinOrgById.html)(String orgId)
→ String


make mutation string for joiining org by ord.id.

[loginUser](../utils_queries/Queries/loginUser.html)(String email, String password)
→ String


mutation to login the user.

[logout](../utils_queries/Queries/logout.html)()
→ String


logout muiation.

[newUserLanguage](../utils_queries/Queries/newUserLanguage.html)(String userId)
→ String


query for new user language .

[noSuchMethod](../utils_queries/Queries/noSuchMethod.html)(Invocation invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[refreshToken](../utils_queries/Queries/refreshToken.html)(String refreshToken)
→ String


mutation for refresh token.

[registerUser](../utils_queries/Queries/registerUser.html)(String firstName, String lastName, String email, String password, String? selectedOrganization)
→ String


Mutation to register a user.

[sendMembershipRequest](../utils_queries/Queries/sendMembershipRequest.html)(String orgId)
→ String


mutation to send the member request.

[toString](../utils_queries/Queries/toString.html)()
→ String


A string representation of this object.
inherited

[updateLanguage](../utils_queries/Queries/updateLanguage.html)(String languageCode)
→ String


lang update mutation.

[updateUserProfile](../utils_queries/Queries/updateUserProfile.html)()
→ String


to update user profile.

[userLanguage](../utils_queries/Queries/userLanguage.html)()
→ String


query to fetch user lang.

[venueListQuery](../utils_queries/Queries/venueListQuery.html)()
→ String


Query to get the list of Venues in an organisation.



## Operators

[operator ==](../utils_queries/Queries/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [queries](../utils_queries/utils_queries-library.html)
3. Queries class

##### queries library





talawa
1.0.0+1






