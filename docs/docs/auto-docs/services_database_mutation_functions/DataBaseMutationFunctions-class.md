


# DataBaseMutationFunctions class









<p>DataBaseMutationFunctions class provides different services that are under the context of graphQL mutations and queries.</p>
<p>Services include:</p>
<ul>
<li><code>encounteredExceptionOrError</code></li>
<li><code>gqlAuthQuery</code></li>
<li><code>gqlAuthMutation</code></li>
<li><code>gqlNonAuthMutation</code></li>
<li><code>gqlNonAuthQuery</code></li>
<li><code>refreshAccessToken</code></li>
<li><code>fetchOrgById</code></li>
</ul>




## Constructors

[DataBaseMutationFunctions](../services_database_mutation_functions/DataBaseMutationFunctions/DataBaseMutationFunctions.md) ()

   


## Properties

##### [clientAuth](../services_database_mutation_functions/DataBaseMutationFunctions/clientAuth.md) &#8596; [GraphQLClient](https://pub.dev/documentation/graphql/5.2.0-beta.4/graphql/GraphQLClient-class.html)



Client Auth for handling authenticated request.  
_<span class="feature">read / write</span>_



##### [clientNonAuth](../services_database_mutation_functions/DataBaseMutationFunctions/clientNonAuth.md) &#8596; [GraphQLClient](https://pub.dev/documentation/graphql/5.2.0-beta.4/graphql/GraphQLClient-class.html)



Client Auth for handling non-authenticated request.  
_<span class="feature">read / write</span>_



##### [emailAccountPresent](../services_database_mutation_functions/DataBaseMutationFunctions/emailAccountPresent.md) &#8596; [GraphQLError](https://pub.dev/documentation/gql_exec/1.0.1-alpha+1690479830973/execution/GraphQLError-class.html)



Graphql error for handling.  
_<span class="feature">read / write</span>_



##### [hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html) &#8594; [int](https://api.flutter.dev/flutter/dart-core/int-class.html)



The hash code for this object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [memberRequestExist](../services_database_mutation_functions/DataBaseMutationFunctions/memberRequestExist.md) &#8596; [GraphQLError](https://pub.dev/documentation/gql_exec/1.0.1-alpha+1690479830973/execution/GraphQLError-class.html)



Graphql error for handling.  
_<span class="feature">read / write</span>_



##### [notifFeatureNotInstalled](../services_database_mutation_functions/DataBaseMutationFunctions/notifFeatureNotInstalled.md) &#8596; [GraphQLError](https://pub.dev/documentation/gql_exec/1.0.1-alpha+1690479830973/execution/GraphQLError-class.html)



Graphql error for handling.  
_<span class="feature">read / write</span>_



##### [organizationNotFound](../services_database_mutation_functions/DataBaseMutationFunctions/organizationNotFound.md) &#8596; [GraphQLError](https://pub.dev/documentation/gql_exec/1.0.1-alpha+1690479830973/execution/GraphQLError-class.html)



Graphql error for handling.  
_<span class="feature">read / write</span>_



##### [refreshAccessTokenExpiredException](../services_database_mutation_functions/DataBaseMutationFunctions/refreshAccessTokenExpiredException.md) &#8596; [GraphQLError](https://pub.dev/documentation/gql_exec/1.0.1-alpha+1690479830973/execution/GraphQLError-class.html)



Graphql error for handling.  
_<span class="feature">read / write</span>_



##### [runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html) &#8594; [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)



A representation of the runtime type of the object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [userNotAuthenticated](../services_database_mutation_functions/DataBaseMutationFunctions/userNotAuthenticated.md) &#8596; [GraphQLError](https://pub.dev/documentation/gql_exec/1.0.1-alpha+1690479830973/execution/GraphQLError-class.html)



Graphql error for handling.  
_<span class="feature">read / write</span>_



##### [userNotFound](../services_database_mutation_functions/DataBaseMutationFunctions/userNotFound.md) &#8596; [GraphQLError](https://pub.dev/documentation/gql_exec/1.0.1-alpha+1690479830973/execution/GraphQLError-class.html)



Graphql error for handling.  
_<span class="feature">read / write</span>_



##### [wrongCredentials](../services_database_mutation_functions/DataBaseMutationFunctions/wrongCredentials.md) &#8596; [GraphQLError](https://pub.dev/documentation/gql_exec/1.0.1-alpha+1690479830973/execution/GraphQLError-class.html)



Graphql error for handling.  
_<span class="feature">read / write</span>_





## Methods

##### [encounteredExceptionOrError](../services_database_mutation_functions/DataBaseMutationFunctions/encounteredExceptionOrError.md)([OperationException](https://pub.dev/documentation/graphql/5.2.0-beta.4/graphql/OperationException-class.html) exception, {[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) showSnackBar = true}) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?



This function is used to check if any exceptions or error encountered. The return type is <code>boolean</code>.  




##### [fetchOrgById](../services_database_mutation_functions/DataBaseMutationFunctions/fetchOrgById.md)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) id) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)



This function fetch the organization using the <code>id</code> passed.  




##### [gqlAuthMutation](../services_database_mutation_functions/DataBaseMutationFunctions/gqlAuthMutation.md)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) mutation, {[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic>? variables}) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)



This function is used to run the graph-ql mutation for authenticated user.  




##### [gqlAuthQuery](../services_database_mutation_functions/DataBaseMutationFunctions/gqlAuthQuery.md)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) query, {[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic>? variables}) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)



This function is used to run the graph-ql query for authentication.  




##### [gqlNonAuthMutation](../services_database_mutation_functions/DataBaseMutationFunctions/gqlNonAuthMutation.md)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) mutation, {[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic>? variables, [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) reCall = true}) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)



This function is used to run the graph-ql mutation to authenticate the non signed-in user.  




##### [gqlNonAuthQuery](../services_database_mutation_functions/DataBaseMutationFunctions/gqlNonAuthQuery.md)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) query, {[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic>? variables}) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.4/graphql/QueryResult-class.html)&lt;[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?>?>



This function is used to run the graph-ql query for the non signed-in user.  




##### [init](../services_database_mutation_functions/DataBaseMutationFunctions/init.md)() void



initialization function.  




##### [noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation) dynamic



Invoked when a non-existent method or property is accessed.  
_<span class="feature">inherited</span>_



##### [refreshAccessToken](../services_database_mutation_functions/DataBaseMutationFunctions/refreshAccessToken.md)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) refreshToken) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)>



This function is used to refresh the Authenication token to access the application.  




##### [toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)() [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



A string representation of this object.  
_<span class="feature">inherited</span>_





## Operators

##### [operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



The equality operator.  
_<span class="feature">inherited</span>_















