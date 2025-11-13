<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [services/graphql_config.dart](../services_graphql_config/services_graphql_config-library.md)
3.  GraphqlConfig class

<div class="self-name">

GraphqlConfig

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="services_graphql_config/services_graphql_config-library-sidebar.html"
below-sidebar="services_graphql_config/GraphqlConfig-class-sidebar.html">

<div>

# <span class="kind-class">GraphqlConfig</span> class

</div>

<div class="section desc markdown">

GraphQL is a query language for APIs and a runtime for fulfilling those
queries with your existing data. Talawa uses graphQL for the integrating
with the API's. You can go through talawa-api,
[here](https://github.com/PalisadoesFoundation/talawa-api).
GraphqlConfig class provides service to configure graph ql API with
talawa mobile-app.

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[GraphqlConfig](../services_graphql_config/GraphqlConfig/GraphqlConfig.md)</span><span class="signature"></span>  

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[displayImgRoute](../services_graphql_config/GraphqlConfig/displayImgRoute.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[httpLink](../services_graphql_config/GraphqlConfig/httpLink.md)</span> <span class="signature">↔ [HttpLink](https://pub.dev/documentation/gql_http_link/1.1.0/gql_http_link/HttpLink-class.html)</span>  
<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)</span> <span class="signature">→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)</span>  
A representation of the runtime type of the object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[webSocketLink](../services_graphql_config/GraphqlConfig/webSocketLink.md)</span> <span class="signature">↔ [WebSocketLink](https://pub.dev/documentation/graphql/5.2.1/graphql/WebSocketLink-class.html)?</span>  
<div class="features">

<span class="feature">getter/setter pair</span>

</div>

</div>

<div id="instance-methods" class="section summary offset-anchor">

## Methods

<span class="name">[authClient](../services_graphql_config/GraphqlConfig/authClient.md)</span><span class="signature"> <span class="returntype parameter">→ [GraphQLClient](https://pub.dev/documentation/graphql/5.2.1/graphql/GraphQLClient-class.html)</span> </span>  

<span class="name">[clientToQuery](../services_graphql_config/GraphqlConfig/clientToQuery.md)</span><span class="signature"> <span class="returntype parameter">→ [GraphQLClient](https://pub.dev/documentation/graphql/5.2.1/graphql/GraphQLClient-class.html)</span> </span>  

<span class="name">[getInitialPayload](../services_graphql_config/GraphqlConfig/getInitialPayload.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>, <span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>\></span></span>\></span></span> </span>  
Get the initial payload for WebSocket connection

<span class="name">[getOrgUrl](../services_graphql_config/GraphqlConfig/getOrgUrl.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
This function is used to get the organization URL.

<span class="name">[getToken](../services_graphql_config/GraphqlConfig/getToken.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)</span> </span>  
This function is used to get user the access token.

<span class="name">[initializeForTesting](../services_graphql_config/GraphqlConfig/initializeForTesting.md)</span><span class="signature">(<span id="initializeForTesting-param-apiUrl" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">apiUrl</span></span>) <span class="returntype parameter">→ void</span> </span>  
This function is used to initialize the GraphQL client for testing.

<span class="name">[isSubscriptionRequest](../services_graphql_config/GraphqlConfig/isSubscriptionRequest.md)</span><span class="signature">(<span id="isSubscriptionRequest-param-request" class="parameter"><span class="type-annotation">[Request](https://pub.dev/documentation/gql_exec/1.1.1-alpha+1699813812660/execution/Request-class.md)</span> <span class="parameter-name">request</span></span>) <span class="returntype parameter">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span> </span>  
Check if a request is a subscription

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[test](../services_graphql_config/GraphqlConfig/test.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  

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

<div id="static-properties" class="section summary offset-anchor">

## Static Properties

<span class="name">[orgURI](../services_graphql_config/GraphqlConfig/orgURI.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[token](../services_graphql_config/GraphqlConfig/token.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
<div class="features">

<span class="feature">getter/setter pair</span>

</div>

</div>

<div id="constants" class="section summary offset-anchor">

## Constants

<span class="name">[imageUrlKey](../services_graphql_config/GraphqlConfig/imageUrlKey-constant.md)</span> <span class="signature">→ const [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>  

<span class="name">[urlKey](../services_graphql_config/GraphqlConfig/urlKey-constant.md)</span> <span class="signature">→ const [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>  

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../index.md)
2.  [graphql_config](../services_graphql_config/services_graphql_config-library.md)
3.  GraphqlConfig class

##### graphql_config library

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
