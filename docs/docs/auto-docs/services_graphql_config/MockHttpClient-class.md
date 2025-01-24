




MockHttpClient class - graphql\_config library - Dart API







menu

1. [talawa](../index.html)
2. [services/graphql\_config.dart](../services_graphql_config/services_graphql_config-library.html)
3. MockHttpClient class

MockHttpClient


dark\_mode

light\_mode




# MockHttpClient class


A mock HTTP client designed for use when testing code that uses BaseClient.


Inheritance

* Object
* [Mock](https://pub.dev/documentation/mockito/5.4.4/mockito/Mock-class.html)
* MockHttpClient

Implemented types

* [Client](https://pub.dev/documentation/http/1.2.2/http/Client-class.html)



## Constructors

[MockHttpClient](../services_graphql_config/MockHttpClient/MockHttpClient.html)()




## Properties

[hashCode](https://pub.dev/documentation/mockito/5.4.4/mockito/Mock/hashCode.html)
→ int

The hash code for this object.
no setterinherited

[runtimeType](https://pub.dev/documentation/http/1.2.2/http/Client/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited



## Methods

[close](https://pub.dev/documentation/http/1.2.2/http/Client/close.html)()
→ void


Closes the client and cleans up any resources associated with it.
inherited

[delete](https://pub.dev/documentation/http/1.2.2/http/Client/delete.html)(Uri url, {Map<String, String>? headers, Object? body, Encoding? encoding})
→ Future<[Response](https://pub.dev/documentation/http/1.2.2/http/Response-class.html)>


Sends an HTTP DELETE request with the given headers to the given URL.
inherited

[get](https://pub.dev/documentation/http/1.2.2/http/Client/get.html)(Uri url, {Map<String, String>? headers})
→ Future<[Response](https://pub.dev/documentation/http/1.2.2/http/Response-class.html)>


Sends an HTTP GET request with the given headers to the given URL.
inherited

[head](https://pub.dev/documentation/http/1.2.2/http/Client/head.html)(Uri url, {Map<String, String>? headers})
→ Future<[Response](https://pub.dev/documentation/http/1.2.2/http/Response-class.html)>


Sends an HTTP HEAD request with the given headers to the given URL.
inherited

[noSuchMethod](https://pub.dev/documentation/mockito/5.4.4/mockito/Mock/noSuchMethod.html)(Invocation invocation, {Object? returnValue, Object? returnValueForMissingStub = deferToDefaultResponse})
→ dynamic


Handles method stubbing, method call verification, and real method calls.
inherited

[patch](https://pub.dev/documentation/http/1.2.2/http/Client/patch.html)(Uri url, {Map<String, String>? headers, Object? body, Encoding? encoding})
→ Future<[Response](https://pub.dev/documentation/http/1.2.2/http/Response-class.html)>


Sends an HTTP PATCH request with the given headers and body to the given
URL.
inherited

[post](https://pub.dev/documentation/http/1.2.2/http/Client/post.html)(Uri url, {Map<String, String>? headers, Object? body, Encoding? encoding})
→ Future<[Response](https://pub.dev/documentation/http/1.2.2/http/Response-class.html)>


Sends an HTTP POST request with the given headers and body to the given
URL.
inherited

[put](https://pub.dev/documentation/http/1.2.2/http/Client/put.html)(Uri url, {Map<String, String>? headers, Object? body, Encoding? encoding})
→ Future<[Response](https://pub.dev/documentation/http/1.2.2/http/Response-class.html)>


Sends an HTTP PUT request with the given headers and body to the given
URL.
inherited

[read](https://pub.dev/documentation/http/1.2.2/http/Client/read.html)(Uri url, {Map<String, String>? headers})
→ Future<String>


Sends an HTTP GET request with the given headers to the given URL and
returns a Future that completes to the body of the response as a String.
inherited

[readBytes](https://pub.dev/documentation/http/1.2.2/http/Client/readBytes.html)(Uri url, {Map<String, String>? headers})
→ Future<[Uint8List](https://api.flutter.dev/flutter/dart-typed_data/Uint8List-class.html)>


Sends an HTTP GET request with the given headers to the given URL and
returns a Future that completes to the body of the response as a list of
bytes.
inherited

[send](../services_graphql_config/MockHttpClient/send.html)([BaseRequest](https://pub.dev/documentation/http/1.2.2/http/BaseRequest-class.html)? request)
→ Future<[StreamedResponse](https://pub.dev/documentation/http/1.2.2/http/StreamedResponse-class.html)>


Sends an HTTP request and asynchronously returns the response.
override

[toString](https://pub.dev/documentation/mockito/5.4.4/mockito/Mock/toString.html)()
→ String


A string representation of this object.
inherited



## Operators

[operator ==](https://pub.dev/documentation/mockito/5.4.4/mockito/Mock/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [graphql\_config](../services_graphql_config/services_graphql_config-library.html)
3. MockHttpClient class

##### graphql\_config library





talawa
1.0.0+1






