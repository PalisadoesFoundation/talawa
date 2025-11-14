<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [database_mutation_functions](../services_database_mutation_functions/services_database_mutation_functions-library.md)
3.  DataBaseMutationFunctions class

<div class="self-name">

DataBaseMutationFunctions

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="services_database_mutation_functions/services_database_mutation_functions-library-sidebar.html"
below-sidebar="services_database_mutation_functions/DataBaseMutationFunctions-class-sidebar.html">

<div>

# <span class="kind-class">DataBaseMutationFunctions</span> class

</div>

<div class="section desc markdown">

DataBaseMutationFunctions class provides different services that are
under the context of graphQL mutations and queries.

Services include:

- `encounteredExceptionOrError`
- `gqlAuthQuery`
- `gqlAuthMutation`
- `gqlNonAuthMutation`
- `gqlNonAuthQuery`
- `refreshAccessToken`
- `fetchOrgById`

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[DataBaseMutationFunctions](../services_database_mutation_functions/DataBaseMutationFunctions/DataBaseMutationFunctions.md)</span><span class="signature"></span>  

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[clientAuth](../services_database_mutation_functions/DataBaseMutationFunctions/clientAuth.md)</span> <span class="signature">↔ [GraphQLClient](https://pub.dev/documentation/graphql/5.2.1/graphql/GraphQLClient-class.html)</span>  
Client Auth for handling authenticated request.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[clientNonAuth](../services_database_mutation_functions/DataBaseMutationFunctions/clientNonAuth.md)</span> <span class="signature">↔ [GraphQLClient](https://pub.dev/documentation/graphql/5.2.1/graphql/GraphQLClient-class.html)</span>  
Client Auth for handling non-authenticated request.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[noData](../services_database_mutation_functions/DataBaseMutationFunctions/noData.md)</span> <span class="signature">↔ [QueryResult](https://pub.dev/documentation/graphql/5.2.1/graphql/QueryResult-class.html)<span class="signature">\<<span class="type-parameter">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?</span>\></span></span>  
when result has no data and null.

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

<span class="name">[clearGraphQLCache](../services_database_mutation_functions/DataBaseMutationFunctions/clearGraphQLCache.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
This function clears the GraphQL cache to ensure fresh data fetch.

<span class="name">[fetchOrgById](../services_database_mutation_functions/DataBaseMutationFunctions/fetchOrgById.md)</span><span class="signature">(<span id="fetchOrgById-param-id" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">id</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)</span> </span>  
This function fetch the organization using the `id` passed.

<span class="name">[gqlAuthMutation](../services_database_mutation_functions/DataBaseMutationFunctions/gqlAuthMutation.md)</span><span class="signature">(<span id="gqlAuthMutation-param-mutation" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">mutation</span>, </span><span id="gqlAuthMutation-param-variables" class="parameter"></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[QueryResult](https://pub.dev/documentation/graphql/5.2.1/graphql/QueryResult-class.html)<span class="signature">\<<span class="type-parameter">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?</span>\></span></span>\></span></span> </span>  
This function is used to run the graph-ql mutation for authenticated
user.

<span class="name">[gqlAuthQuery](../services_database_mutation_functions/DataBaseMutationFunctions/gqlAuthQuery.md)</span><span class="signature">(<span id="gqlAuthQuery-param-query" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">query</span>, </span><span id="gqlAuthQuery-param-variables" class="parameter"></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[QueryResult](https://pub.dev/documentation/graphql/5.2.1/graphql/QueryResult-class.html)<span class="signature">\<<span class="type-parameter">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?</span>\></span></span>\></span></span> </span>  
This function is used to run the graph-ql query for authentication.

<span class="name">[gqlAuthSubscription](../services_database_mutation_functions/DataBaseMutationFunctions/gqlAuthSubscription.md)</span><span class="signature">(<span id="gqlAuthSubscription-param-subscription" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">subscription</span>, </span><span id="gqlAuthSubscription-param-variables" class="parameter"></span>) <span class="returntype parameter">→ [Stream](https://api.flutter.dev/flutter/dart-async/Stream-class.html)<span class="signature">\<<span class="type-parameter">[QueryResult](https://pub.dev/documentation/graphql/5.2.1/graphql/QueryResult-class.html)<span class="signature">\<<span class="type-parameter">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?</span>\></span></span>\></span></span> </span>  
This function is used to run the graph-ql subscription for authenticated
user.

<span class="name">[gqlNonAuthMutation](../services_database_mutation_functions/DataBaseMutationFunctions/gqlNonAuthMutation.md)</span><span class="signature">(<span id="gqlNonAuthMutation-param-mutation" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">mutation</span>, </span><span id="gqlNonAuthMutation-param-variables" class="parameter"></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[QueryResult](https://pub.dev/documentation/graphql/5.2.1/graphql/QueryResult-class.html)<span class="signature">\<<span class="type-parameter">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?</span>\></span></span>\></span></span> </span>  
This function is used to run the graph-ql mutation to authenticate the
non signed-in user.

<span class="name">[gqlNonAuthQuery](../services_database_mutation_functions/DataBaseMutationFunctions/gqlNonAuthQuery.md)</span><span class="signature">(<span id="gqlNonAuthQuery-param-query" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">query</span>, </span><span id="gqlNonAuthQuery-param-variables" class="parameter"></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[QueryResult](https://pub.dev/documentation/graphql/5.2.1/graphql/QueryResult-class.html)<span class="signature">\<<span class="type-parameter">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?</span>\></span></span>\></span></span> </span>  
This function is used to run the graph-ql query for the non signed-in
user.

<span class="name">[init](../services_database_mutation_functions/DataBaseMutationFunctions/init.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Initialization function.

<span class="name">[initClientNonAuth](../services_database_mutation_functions/DataBaseMutationFunctions/initClientNonAuth.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Initializes
[clientNonAuth](../services_database_mutation_functions/DataBaseMutationFunctions/clientNonAuth.md)
function.

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[refreshAccessToken](../services_database_mutation_functions/DataBaseMutationFunctions/refreshAccessToken.md)</span><span class="signature">(<span id="refreshAccessToken-param-refreshToken" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">refreshToken</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>\></span></span> </span>  
This function is used to refresh the Authenication token to access the
application.

<span class="name">[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
A string representation of this object.

<div class="features">

<span class="feature">inherited</span>

</div>

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
2.  [database_mutation_functions](../services_database_mutation_functions/services_database_mutation_functions-library.md)
3.  DataBaseMutationFunctions class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
