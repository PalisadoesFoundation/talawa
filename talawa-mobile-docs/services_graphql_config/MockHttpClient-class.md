


# MockHttpClient class









<p>A mock HTTP client designed for use when testing code that uses BaseClient.</p>



**Inheritance**

- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [Mock](https://pub.dev/documentation/mockito/5.4.0/mockito/Mock-class.html)
- MockHttpClient

**Implemented types**

- [Client](https://pub.dev/documentation/http/0.13.6/http/Client-class.html)







## Constructors

[MockHttpClient](../services_graphql_config/MockHttpClient/MockHttpClient.md) ()

   


## Properties

##### [hashCode](https://pub.dev/documentation/mockito/5.4.0/mockito/Mock/hashCode.html) &#8594; [int](https://api.flutter.dev/flutter/dart-core/int-class.html)



The hash code for this object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html) &#8594; [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)



A representation of the runtime type of the object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_





## Methods

##### [close](https://pub.dev/documentation/http/0.13.6/http/Client/close.html)() void



Closes the client and cleans up any resources associated with it.  
_<span class="feature">inherited</span>_



##### [delete](https://pub.dev/documentation/http/0.13.6/http/Client/delete.html)([Uri](https://api.flutter.dev/flutter/dart-core/Uri-class.html) url, {[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html), [String](https://api.flutter.dev/flutter/dart-core/String-class.html)>? headers, [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)? body, [Encoding](https://api.flutter.dev/flutter/dart-convert/Encoding-class.html)? encoding}) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;[Response](https://pub.dev/documentation/http/0.13.6/http/Response-class.html)>



Sends an HTTP DELETE request with the given headers to the given URL.  
_<span class="feature">inherited</span>_



##### [get](https://pub.dev/documentation/http/0.13.6/http/Client/get.html)([Uri](https://api.flutter.dev/flutter/dart-core/Uri-class.html) url, {[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html), [String](https://api.flutter.dev/flutter/dart-core/String-class.html)>? headers}) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;[Response](https://pub.dev/documentation/http/0.13.6/http/Response-class.html)>



Sends an HTTP GET request with the given headers to the given URL.  
_<span class="feature">inherited</span>_



##### [head](https://pub.dev/documentation/http/0.13.6/http/Client/head.html)([Uri](https://api.flutter.dev/flutter/dart-core/Uri-class.html) url, {[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html), [String](https://api.flutter.dev/flutter/dart-core/String-class.html)>? headers}) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;[Response](https://pub.dev/documentation/http/0.13.6/http/Response-class.html)>



Sends an HTTP HEAD request with the given headers to the given URL.  
_<span class="feature">inherited</span>_



##### [noSuchMethod](https://pub.dev/documentation/mockito/5.4.0/mockito/Mock/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation, {[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)? returnValue, [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)? returnValueForMissingStub = deferToDefaultResponse}) dynamic



Handles method stubbing, method call verification, and real method calls.  
_<span class="feature">inherited</span>_



##### [patch](https://pub.dev/documentation/http/0.13.6/http/Client/patch.html)([Uri](https://api.flutter.dev/flutter/dart-core/Uri-class.html) url, {[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html), [String](https://api.flutter.dev/flutter/dart-core/String-class.html)>? headers, [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)? body, [Encoding](https://api.flutter.dev/flutter/dart-convert/Encoding-class.html)? encoding}) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;[Response](https://pub.dev/documentation/http/0.13.6/http/Response-class.html)>



Sends an HTTP PATCH request with the given headers and body to the given
URL.  
_<span class="feature">inherited</span>_



##### [post](https://pub.dev/documentation/http/0.13.6/http/Client/post.html)([Uri](https://api.flutter.dev/flutter/dart-core/Uri-class.html) url, {[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html), [String](https://api.flutter.dev/flutter/dart-core/String-class.html)>? headers, [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)? body, [Encoding](https://api.flutter.dev/flutter/dart-convert/Encoding-class.html)? encoding}) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;[Response](https://pub.dev/documentation/http/0.13.6/http/Response-class.html)>



Sends an HTTP POST request with the given headers and body to the given
URL.  
_<span class="feature">inherited</span>_



##### [put](https://pub.dev/documentation/http/0.13.6/http/Client/put.html)([Uri](https://api.flutter.dev/flutter/dart-core/Uri-class.html) url, {[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html), [String](https://api.flutter.dev/flutter/dart-core/String-class.html)>? headers, [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)? body, [Encoding](https://api.flutter.dev/flutter/dart-convert/Encoding-class.html)? encoding}) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;[Response](https://pub.dev/documentation/http/0.13.6/http/Response-class.html)>



Sends an HTTP PUT request with the given headers and body to the given
URL.  
_<span class="feature">inherited</span>_



##### [read](https://pub.dev/documentation/http/0.13.6/http/Client/read.html)([Uri](https://api.flutter.dev/flutter/dart-core/Uri-class.html) url, {[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html), [String](https://api.flutter.dev/flutter/dart-core/String-class.html)>? headers}) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html)>



Sends an HTTP GET request with the given headers to the given URL and
returns a Future that completes to the body of the response as a String.  
_<span class="feature">inherited</span>_



##### [readBytes](https://pub.dev/documentation/http/0.13.6/http/Client/readBytes.html)([Uri](https://api.flutter.dev/flutter/dart-core/Uri-class.html) url, {[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html), [String](https://api.flutter.dev/flutter/dart-core/String-class.html)>? headers}) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;[Uint8List](https://api.flutter.dev/flutter/dart-typed_data/Uint8List-class.html)>



Sends an HTTP GET request with the given headers to the given URL and
returns a Future that completes to the body of the response as a list of
bytes.  
_<span class="feature">inherited</span>_



##### [send](../services_graphql_config/MockHttpClient/send.md)([BaseRequest](https://pub.dev/documentation/http/0.13.6/http/BaseRequest-class.html)? request) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;[StreamedResponse](https://pub.dev/documentation/http/0.13.6/http/StreamedResponse-class.html)>



Sends an HTTP request and asynchronously returns the response.  
_<span class="feature">override</span>_



##### [toString](https://pub.dev/documentation/mockito/5.4.0/mockito/Mock/toString.html)() [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



A string representation of this object.  
_<span class="feature">inherited</span>_





## Operators

##### [operator ==](https://pub.dev/documentation/mockito/5.4.0/mockito/Mock/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



The equality operator.  
_<span class="feature">inherited</span>_















