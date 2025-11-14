<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [graphql_config](../services_graphql_config/services_graphql_config-library.md)
3.  MockHttpClient class

<div class="self-name">

MockHttpClient

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="services_graphql_config/services_graphql_config-library-sidebar.html"
below-sidebar="services_graphql_config/MockHttpClient-class-sidebar.html">

<div>

# <span class="kind-class">MockHttpClient</span> class

</div>

<div class="section desc markdown">

A mock HTTP client designed for use when testing code that uses
BaseClient.

</div>

<div class="section">

Inheritance  
- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [Mock](https://pub.dev/documentation/mockito/5.4.4/mockito/Mock-class.html)
- MockHttpClient

Implemented types  
- [Client](https://pub.dev/documentation/http/1.5.0/http/Client-class.html)

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[MockHttpClient](../services_graphql_config/MockHttpClient/MockHttpClient.md)</span><span class="signature"></span>  

</div>

<div id="instance-properties"
class="section summary offset-anchor inherited">

## Properties

<span class="name">[hashCode](https://pub.dev/documentation/mockito/5.4.4/mockito/Mock/hashCode.html)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
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

<span class="name">[close](https://pub.dev/documentation/http/1.5.0/http/Client/close.html)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Closes the client and cleans up any resources associated with it.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[delete](https://pub.dev/documentation/http/1.5.0/http/Client/delete.html)</span><span class="signature">(<span id="delete-param-url" class="parameter"><span class="type-annotation">[Uri](https://api.flutter.dev/flutter/dart-core/Uri-class.md)</span> <span class="parameter-name">url</span>, </span><span id="delete-param-headers" class="parameter"></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[Response](https://pub.dev/documentation/http/1.5.0/http/Response-class.html)</span>\></span></span> </span>  
Sends an HTTP DELETE request with the given headers to the given URL.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[get](https://pub.dev/documentation/http/1.5.0/http/Client/get.html)</span><span class="signature">(<span id="get-param-url" class="parameter"><span class="type-annotation">[Uri](https://api.flutter.dev/flutter/dart-core/Uri-class.md)</span> <span class="parameter-name">url</span>, </span><span id="get-param-headers" class="parameter"></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[Response](https://pub.dev/documentation/http/1.5.0/http/Response-class.html)</span>\></span></span> </span>  
Sends an HTTP GET request with the given headers to the given URL.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[head](https://pub.dev/documentation/http/1.5.0/http/Client/head.html)</span><span class="signature">(<span id="head-param-url" class="parameter"><span class="type-annotation">[Uri](https://api.flutter.dev/flutter/dart-core/Uri-class.md)</span> <span class="parameter-name">url</span>, </span><span id="head-param-headers" class="parameter"></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[Response](https://pub.dev/documentation/http/1.5.0/http/Response-class.html)</span>\></span></span> </span>  
Sends an HTTP HEAD request with the given headers to the given URL.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[noSuchMethod](https://pub.dev/documentation/mockito/5.4.4/mockito/Mock/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span>, </span><span id="noSuchMethod-param-returnValue" class="parameter"></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Handles method stubbing, method call verification, and real method
calls.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[patch](https://pub.dev/documentation/http/1.5.0/http/Client/patch.html)</span><span class="signature">(<span id="patch-param-url" class="parameter"><span class="type-annotation">[Uri](https://api.flutter.dev/flutter/dart-core/Uri-class.md)</span> <span class="parameter-name">url</span>, </span><span id="patch-param-headers" class="parameter"></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[Response](https://pub.dev/documentation/http/1.5.0/http/Response-class.html)</span>\></span></span> </span>  
Sends an HTTP PATCH request with the given headers and body to the given
URL.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[post](https://pub.dev/documentation/http/1.5.0/http/Client/post.html)</span><span class="signature">(<span id="post-param-url" class="parameter"><span class="type-annotation">[Uri](https://api.flutter.dev/flutter/dart-core/Uri-class.md)</span> <span class="parameter-name">url</span>, </span><span id="post-param-headers" class="parameter"></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[Response](https://pub.dev/documentation/http/1.5.0/http/Response-class.html)</span>\></span></span> </span>  
Sends an HTTP POST request with the given headers and body to the given
URL.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[put](https://pub.dev/documentation/http/1.5.0/http/Client/put.html)</span><span class="signature">(<span id="put-param-url" class="parameter"><span class="type-annotation">[Uri](https://api.flutter.dev/flutter/dart-core/Uri-class.md)</span> <span class="parameter-name">url</span>, </span><span id="put-param-headers" class="parameter"></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[Response](https://pub.dev/documentation/http/1.5.0/http/Response-class.html)</span>\></span></span> </span>  
Sends an HTTP PUT request with the given headers and body to the given
URL.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[read](https://pub.dev/documentation/http/1.5.0/http/Client/read.html)</span><span class="signature">(<span id="read-param-url" class="parameter"><span class="type-annotation">[Uri](https://api.flutter.dev/flutter/dart-core/Uri-class.md)</span> <span class="parameter-name">url</span>, </span><span id="read-param-headers" class="parameter"></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>\></span></span> </span>  
Sends an HTTP GET request with the given headers to the given URL and
returns a Future that completes to the body of the response as a String.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[readBytes](https://pub.dev/documentation/http/1.5.0/http/Client/readBytes.html)</span><span class="signature">(<span id="readBytes-param-url" class="parameter"><span class="type-annotation">[Uri](https://api.flutter.dev/flutter/dart-core/Uri-class.md)</span> <span class="parameter-name">url</span>, </span><span id="readBytes-param-headers" class="parameter"></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[Uint8List](https://api.flutter.dev/flutter/dart-typed_data/Uint8List-class.html)</span>\></span></span> </span>  
Sends an HTTP GET request with the given headers to the given URL and
returns a Future that completes to the body of the response as a list of
bytes.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[send](../services_graphql_config/MockHttpClient/send.md)</span><span class="signature">(<span id="send-param-request" class="parameter"><span class="type-annotation">[BaseRequest](https://pub.dev/documentation/http/1.5.0/http/BaseRequest-class.md)?</span> <span class="parameter-name">request</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[StreamedResponse](https://pub.dev/documentation/http/1.5.0/http/StreamedResponse-class.html)</span>\></span></span> </span>  
Sends an HTTP request and asynchronously returns the response.

<div class="features">

<span class="feature">override</span>

</div>

<span class="name">[toString](https://pub.dev/documentation/mockito/5.4.4/mockito/Mock/toString.html)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
A string representation of this object.

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

<div id="operators" class="section summary offset-anchor inherited">

## Operators

<span class="name">[operator ==](https://pub.dev/documentation/mockito/5.4.4/mockito/Mock/operator_equals.html)</span><span class="signature">(<span id="==-param-other" class="parameter"><span class="type-annotation">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)</span> <span class="parameter-name">other</span></span>) <span class="returntype parameter">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span> </span>  
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
2.  [graphql_config](../services_graphql_config/services_graphql_config-library.md)
3.  MockHttpClient class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
