
<div>

# Queries class

</div>


This class returns some queries for the application.



## Constructors

[Queries](../utils_queries/Queries/Queries.html)

:   



## Properties

[[fetchJoinInOrg](../utils_queries/Queries/fetchJoinInOrg.html)] [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   getter for joined org.
    ::: features
    no setter
    :::

[[fetchJoinInOrgByName](../utils_queries/Queries/fetchJoinInOrgByName.html)] [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   getter for fetchJoinInOrgByName.
    ::: features
    no setter
    :::

[[fetchUserInfo](../utils_queries/Queries/fetchUserInfo.html)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   mutation in string form, to be passed on to graphql client..
    ::: features
    getter/setter pair
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::



## Methods

[[createDonation](../utils_queries/Queries/createDonation.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] userId, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] orgId, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] nameOfOrg, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] nameOfUser, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] payPalId, ][[[double](https://api.flutter.dev/flutter/dart-core/double-class.html)] amount]) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   `createDonation` creates a new donation transaction by taking the
    userId ,orgId ,nameOfOrg ,nameOfUser as parameters.

[[fetchOrgById](../utils_queries/Queries/fetchOrgById.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] orgId]) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   fetching org details with the help of id.

[[fetchOrgDetailsById](../utils_queries/Queries/fetchOrgDetailsById.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] orgId]) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   query to fetch org details.

[[getPluginsList](../utils_queries/Queries/getPluginsList.html)][() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   `getPluginList` queries all properties of pluginList from the
    server.

[[joinOrgById](../utils_queries/Queries/joinOrgById.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] orgId]) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   make mutation string for joiining org by ord.id.

[[loginUser](../utils_queries/Queries/loginUser.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] email, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] password]) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   mutation to login the user.

[[logout](../utils_queries/Queries/logout.html)][() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   logout muiation.

[[newUserLanguage](../utils_queries/Queries/newUserLanguage.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] userId]) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   query for new user language .

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[[refreshToken](../utils_queries/Queries/refreshToken.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] refreshToken]) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   mutation for refresh token.

[[registerUser](../utils_queries/Queries/registerUser.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] firstName, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] lastName, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] email, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] password, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?] selectedOrganization]) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   Mutation to register a user.

[[sendMembershipRequest](../utils_queries/Queries/sendMembershipRequest.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] orgId]) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   mutation to send the member request.

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::

[[updateLanguage](../utils_queries/Queries/updateLanguage.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] languageCode]) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   lang update mutation.

[[updateUserProfile](../utils_queries/Queries/updateUserProfile.html)][() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   to update user profile.

[[userLanguage](../utils_queries/Queries/userLanguage.html)][() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   query to fetch user lang.

[[venueListQuery](../utils_queries/Queries/venueListQuery.html)][() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   Query to get the list of Venues in an organisation.



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.html)
2.  [queries](../utils_queries/)
3.  Queries class

##### queries library







