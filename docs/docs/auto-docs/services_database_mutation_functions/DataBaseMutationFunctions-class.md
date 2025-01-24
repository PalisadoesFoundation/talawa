




DataBaseMutationFunctions class - database\_mutation\_functions library - Dart API







menu

1. [talawa](../index.html)
2. [services/database\_mutation\_functions.dart](../services_database_mutation_functions/services_database_mutation_functions-library.html)
3. DataBaseMutationFunctions class

DataBaseMutationFunctions


dark\_mode

light\_mode




# DataBaseMutationFunctions class


DataBaseMutationFunctions class provides different services that are under the context of graphQL mutations and queries.

Services include:

* `encounteredExceptionOrError`
* `gqlAuthQuery`
* `gqlAuthMutation`
* `gqlNonAuthMutation`
* `gqlNonAuthQuery`
* `refreshAccessToken`
* `fetchOrgById`

## Constructors

[DataBaseMutationFunctions](../services_database_mutation_functions/DataBaseMutationFunctions/DataBaseMutationFunctions.html)()




## Properties

[clientAuth](../services_database_mutation_functions/DataBaseMutationFunctions/clientAuth.html)
↔ [GraphQLClient](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/GraphQLClient-class.html)

Client Auth for handling authenticated request.
getter/setter pair

[clientNonAuth](../services_database_mutation_functions/DataBaseMutationFunctions/clientNonAuth.html)
↔ [GraphQLClient](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/GraphQLClient-class.html)

Client Auth for handling non-authenticated request.
getter/setter pair

[hashCode](../services_database_mutation_functions/DataBaseMutationFunctions/hashCode.html)
→ int

The hash code for this object.
no setterinherited

[noData](../services_database_mutation_functions/DataBaseMutationFunctions/noData.html)
↔ [QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)<Object?>

when result has no data and null.
getter/setter pair

[runtimeType](../services_database_mutation_functions/DataBaseMutationFunctions/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited



## Methods

[fetchOrgById](../services_database_mutation_functions/DataBaseMutationFunctions/fetchOrgById.html)(String id)
→ Future


This function fetch the organization using the `id` passed.

[gqlAuthMutation](../services_database_mutation_functions/DataBaseMutationFunctions/gqlAuthMutation.html)(String mutation, {Map<String, dynamic>? variables})
→ Future<[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)<Object?>>


This function is used to run the graph-ql mutation for authenticated user.

[gqlAuthQuery](../services_database_mutation_functions/DataBaseMutationFunctions/gqlAuthQuery.html)(String query, {Map<String, dynamic>? variables})
→ Future<[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)<Object?>>


This function is used to run the graph-ql query for authentication.

[gqlNonAuthMutation](../services_database_mutation_functions/DataBaseMutationFunctions/gqlNonAuthMutation.html)(String mutation, {Map<String, dynamic>? variables, bool reCall = true})
→ Future<[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)<Object?>>


This function is used to run the graph-ql mutation to authenticate the non signed-in user.

[gqlNonAuthQuery](../services_database_mutation_functions/DataBaseMutationFunctions/gqlNonAuthQuery.html)(String query, {Map<String, dynamic>? variables})
→ Future<[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)<Object?>>


This function is used to run the graph-ql query for the non signed-in user.

[init](../services_database_mutation_functions/DataBaseMutationFunctions/init.html)()
→ void


Initialization function.

[initClientNonAuth](../services_database_mutation_functions/DataBaseMutationFunctions/initClientNonAuth.html)()
→ void


Initializes [clientNonAuth](../services_database_mutation_functions/DataBaseMutationFunctions/clientNonAuth.html) function.

[noSuchMethod](../services_database_mutation_functions/DataBaseMutationFunctions/noSuchMethod.html)(Invocation invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[refreshAccessToken](../services_database_mutation_functions/DataBaseMutationFunctions/refreshAccessToken.html)(String refreshToken)
→ Future<bool>


This function is used to refresh the Authenication token to access the application.

[toString](../services_database_mutation_functions/DataBaseMutationFunctions/toString.html)()
→ String


A string representation of this object.
inherited



## Operators

[operator ==](../services_database_mutation_functions/DataBaseMutationFunctions/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [database\_mutation\_functions](../services_database_mutation_functions/services_database_mutation_functions-library.html)
3. DataBaseMutationFunctions class

##### database\_mutation\_functions library





talawa
1.0.0+1






