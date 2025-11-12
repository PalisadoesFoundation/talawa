



menu

1.  [talawa](../index.md)
2.  [services/graphql_config.dart](../services_graphql_config/)
3.  MockHttpClient class


MockHttpClient


 dark_mode   light_mode 




<div>

# MockHttpClient class

</div>


A mock HTTP client designed for use when testing code that uses
BaseClient.




Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [Mock](https://pub.dev/documentation/mockito/5.5.1/mockito/Mock-class.html)
    -   MockHttpClient

Implemented types

:   -   [Client](https://pub.dev/documentation/http/1.5.0/http/Client-class.html)



## Constructors

[MockHttpClient](../services_graphql_config/MockHttpClient/MockHttpClient.md)

:   



## Properties

[[hashCode](https://pub.dev/documentation/mockito/5.5.1/mockito/Mock/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
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

[close](https://pub.dev/documentation/http/1.5.0/http/Client/close.html) [→ void ]
:   Closes the client and cleans up any resources associated with it.
    ::: features
    inherited
    :::

[[delete](https://pub.dev/documentation/http/1.5.0/http/Client/delete.html)][([[[Uri](https://api.flutter.dev/flutter/dart-core/Uri-class.md)] url, ) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[Response](https://pub.dev/documentation/http/1.5.0/http/Response-class.html)]\>]] ]
:   Sends an HTTP DELETE request with the given headers to the given
    URL.
    ::: features
    inherited
    :::

[[get](https://pub.dev/documentation/http/1.5.0/http/Client/get.html)][([[[Uri](https://api.flutter.dev/flutter/dart-core/Uri-class.md)] url, ) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[Response](https://pub.dev/documentation/http/1.5.0/http/Response-class.html)]\>]] ]
:   Sends an HTTP GET request with the given headers to the given URL.
    ::: features
    inherited
    :::

[[head](https://pub.dev/documentation/http/1.5.0/http/Client/head.html)][([[[Uri](https://api.flutter.dev/flutter/dart-core/Uri-class.md)] url, ) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[Response](https://pub.dev/documentation/http/1.5.0/http/Response-class.html)]\>]] ]
:   Sends an HTTP HEAD request with the given headers to the given URL.
    ::: features
    inherited
    :::

[[noSuchMethod](https://pub.dev/documentation/mockito/5.5.1/mockito/Mock/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)] invocation, ) → dynamic ]
:   Handles method stubbing, method call verification, and real method
    calls.
    ::: features
    inherited
    :::

[[patch](https://pub.dev/documentation/http/1.5.0/http/Client/patch.html)][([[[Uri](https://api.flutter.dev/flutter/dart-core/Uri-class.md)] url, ) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[Response](https://pub.dev/documentation/http/1.5.0/http/Response-class.html)]\>]] ]
:   Sends an HTTP PATCH request with the given headers and body to the
    given URL.
    ::: features
    inherited
    :::

[[post](https://pub.dev/documentation/http/1.5.0/http/Client/post.html)][([[[Uri](https://api.flutter.dev/flutter/dart-core/Uri-class.md)] url, ) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[Response](https://pub.dev/documentation/http/1.5.0/http/Response-class.html)]\>]] ]
:   Sends an HTTP POST request with the given headers and body to the
    given URL.
    ::: features
    inherited
    :::

[[put](https://pub.dev/documentation/http/1.5.0/http/Client/put.html)][([[[Uri](https://api.flutter.dev/flutter/dart-core/Uri-class.md)] url, ) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[Response](https://pub.dev/documentation/http/1.5.0/http/Response-class.html)]\>]] ]
:   Sends an HTTP PUT request with the given headers and body to the
    given URL.
    ::: features
    inherited
    :::

[[read](https://pub.dev/documentation/http/1.5.0/http/Client/read.html)][([[[Uri](https://api.flutter.dev/flutter/dart-core/Uri-class.md)] url, ) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]\>]] ]
:   Sends an HTTP GET request with the given headers to the given URL
    and returns a Future that completes to the body of the response as a
    String.
    ::: features
    inherited
    :::

[[readBytes](https://pub.dev/documentation/http/1.5.0/http/Client/readBytes.html)][([[[Uri](https://api.flutter.dev/flutter/dart-core/Uri-class.md)] url, ) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[Uint8List](https://api.flutter.dev/flutter/dart-typed_data/Uint8List-class.html)]\>]] ]
:   Sends an HTTP GET request with the given headers to the given URL
    and returns a Future that completes to the body of the response as a
    list of bytes.
    ::: features
    inherited
    :::

[[send](../services_graphql_config/MockHttpClient/send.md)][([[[BaseRequest](https://pub.dev/documentation/http/1.5.0/http/BaseRequest-class.md)?] request]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[StreamedResponse](https://pub.dev/documentation/http/1.5.0/http/StreamedResponse-class.html)]\>]] ]
:   Sends an HTTP request and asynchronously returns the response.
    ::: features
    override
    :::

[[toString](https://pub.dev/documentation/mockito/5.5.1/mockito/Mock/toString.html)][ [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::



## Operators

[[operator ==](https://pub.dev/documentation/mockito/5.5.1/mockito/Mock/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.md)
2.  [graphql_config](../services_graphql_config/)
3.  MockHttpClient class

##### graphql_config library









 talawa 1.0.0+1 
