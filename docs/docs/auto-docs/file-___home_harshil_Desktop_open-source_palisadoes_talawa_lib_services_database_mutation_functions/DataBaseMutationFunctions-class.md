




DataBaseMutationFunctions class - database\_mutation\_functions library - Dart API







menu

1. [talawa](../index.html)
2. [services/database\_mutation\_functions.dart](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_database_mutation_functions/)
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

[DataBaseMutationFunctions](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_database_mutation_functions/DataBaseMutationFunctions/DataBaseMutationFunctions.html)()




## Properties

[clientAuth](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_database_mutation_functions/DataBaseMutationFunctions/clientAuth.html)
↔ dynamic

Client Auth for handling authenticated request.
getter/setter pair

[clientNonAuth](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_database_mutation_functions/DataBaseMutationFunctions/clientNonAuth.html)
↔ dynamic

Client Auth for handling non-authenticated request.
getter/setter pair

[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)
→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)

The hash code for this object.
no setterinherited

[noData](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_database_mutation_functions/DataBaseMutationFunctions/noData.html)
↔ dynamic

when result has no data and null.
getter/setter pair

[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)
→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)

A representation of the runtime type of the object.
no setterinherited



## Methods

[fetchOrgById](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_database_mutation_functions/DataBaseMutationFunctions/fetchOrgById.html)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) id)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)


This function fetch the organization using the `id` passed.

[gqlAuthMutation](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_database_mutation_functions/DataBaseMutationFunctions/gqlAuthMutation.html)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) mutation, {[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic>? variables})
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)


This function is used to run the graph-ql mutation for authenticated user.

[gqlAuthQuery](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_database_mutation_functions/DataBaseMutationFunctions/gqlAuthQuery.html)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) query, {[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic>? variables})
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)


This function is used to run the graph-ql query for authentication.

[gqlNonAuthMutation](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_database_mutation_functions/DataBaseMutationFunctions/gqlNonAuthMutation.html)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) mutation, {[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic>? variables, [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) reCall = true})
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)


This function is used to run the graph-ql mutation to authenticate the non signed-in user.

[gqlNonAuthQuery](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_database_mutation_functions/DataBaseMutationFunctions/gqlNonAuthQuery.html)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) query, {[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic>? variables})
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)


This function is used to run the graph-ql query for the non signed-in user.

[init](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_database_mutation_functions/DataBaseMutationFunctions/init.html)()
→ void


Initialization function.

[initClientNonAuth](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_database_mutation_functions/DataBaseMutationFunctions/initClientNonAuth.html)()
→ void


Initializes [clientNonAuth](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_database_mutation_functions/DataBaseMutationFunctions/clientNonAuth.html) function.

[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[refreshAccessToken](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_database_mutation_functions/DataBaseMutationFunctions/refreshAccessToken.html)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) refreshToken)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)>


This function is used to refresh the Authenication token to access the application.

[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)()
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


A string representation of this object.
inherited



## Operators

[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other)
→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [database\_mutation\_functions](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_database_mutation_functions/)
3. DataBaseMutationFunctions class

##### database\_mutation\_functions library





talawa
1.0.0+1






