
<div>

# DataBaseMutationFunctions class

</div>


DataBaseMutationFunctions class provides different services that are
under the context of graphQL mutations and queries.

Services include:

-   `encounteredExceptionOrError`
-   `gqlAuthQuery`
-   `gqlAuthMutation`
-   `gqlNonAuthMutation`
-   `gqlNonAuthQuery`
-   `refreshAccessToken`
-   `fetchOrgById`



## Constructors

[DataBaseMutationFunctions](../services_database_mutation_functions/DataBaseMutationFunctions/DataBaseMutationFunctions.md)

:   



## Properties

[[clientAuth](../services_database_mutation_functions/DataBaseMutationFunctions/clientAuth.md)] [↔ [GraphQLClient](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/GraphQLClient-class.html)]
:   Client Auth for handling authenticated request.
    ::: features
    getter/setter pair
    :::

[[clientNonAuth](../services_database_mutation_functions/DataBaseMutationFunctions/clientNonAuth.md)] [↔ [GraphQLClient](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/GraphQLClient-class.html)]
:   Client Auth for handling non-authenticated request.
    ::: features
    getter/setter pair
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[noData](../services_database_mutation_functions/DataBaseMutationFunctions/noData.md)] [↔ [QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]]
:   when result has no data and null.
    ::: features
    getter/setter pair
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::



## Methods

[[fetchOrgById](../services_database_mutation_functions/DataBaseMutationFunctions/fetchOrgById.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] id]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)] ]
:   This function fetch the organization using the `id` passed.

[[gqlAuthMutation](../services_database_mutation_functions/DataBaseMutationFunctions/gqlAuthMutation.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] mutation, {][[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]?] variables]}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]]\>]] ]
:   This function is used to run the graph-ql mutation for authenticated
    user.

[[gqlAuthQuery](../services_database_mutation_functions/DataBaseMutationFunctions/gqlAuthQuery.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] query, {][[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]?] variables]}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]]\>]] ]
:   This function is used to run the graph-ql query for authentication.

[[gqlNonAuthMutation](../services_database_mutation_functions/DataBaseMutationFunctions/gqlNonAuthMutation.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] mutation, {][[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]?] variables, ][[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] reCall = true]}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]]\>]] ]
:   This function is used to run the graph-ql mutation to authenticate
    the non signed-in user.

[[gqlNonAuthQuery](../services_database_mutation_functions/DataBaseMutationFunctions/gqlNonAuthQuery.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] query, {][[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]?] variables]}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]]\>]] ]
:   This function is used to run the graph-ql query for the non
    signed-in user.

[init](../services_database_mutation_functions/DataBaseMutationFunctions/init.md) [→ void ]
:   Initialization function.

[initClientNonAuth](../services_database_mutation_functions/DataBaseMutationFunctions/initClientNonAuth.md) [→ void ]
:   Initializes
    [clientNonAuth](../services_database_mutation_functions/DataBaseMutationFunctions/clientNonAuth.md)
    function.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[[refreshAccessToken](../services_database_mutation_functions/DataBaseMutationFunctions/refreshAccessToken.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] refreshToken]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]\>]] ]
:   This function is used to refresh the Authenication token to access
    the application.

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.md)
2.  [database_mutation_functions](../services_database_mutation_functions/)
3.  DataBaseMutationFunctions class

##### database_mutation_functions library







