:::::::::: {#dartdoc-main-content .main-content above-sidebar="services_graphql_config/services_graphql_config-library-sidebar.html" below-sidebar="services_graphql_config/MockHttpClient-class-sidebar.html"}
<div>

# [MockHttpClient]{.kind-class} class

</div>

::: {.section .desc .markdown}
A mock HTTP client designed for use when testing code that uses
BaseClient.
:::

::: section

Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [Mock](https://pub.dev/documentation/mockito/5.4.4/mockito/Mock-class.html)
    -   MockHttpClient

Implemented types

:   -   [Client](https://pub.dev/documentation/http/1.2.2/http/Client-class.html)
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[MockHttpClient](../services_graphql_config/MockHttpClient/MockHttpClient.html)]{.name}[()]{.signature}

:   
:::

::: {#instance-properties .section .summary .offset-anchor .inherited}
## Properties

[[hashCode](https://pub.dev/documentation/mockito/5.4.4/mockito/Mock/hashCode.html)]{.name} [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.signature}
:   The hash code for this object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)]{.name} [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]{.signature}
:   A representation of the runtime type of the object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::
:::

::: {#instance-methods .section .summary .offset-anchor}
## Methods

[[close](https://pub.dev/documentation/http/1.2.2/http/Client/close.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Closes the client and cleans up any resources associated with it.
    ::: features
    [inherited]{.feature}
    :::

[[delete](https://pub.dev/documentation/http/1.2.2/http/Client/delete.html)]{.name}[([[[Uri](https://api.flutter.dev/flutter/dart-core/Uri-class.html)]{.type-annotation} [url]{.parameter-name}, {]{#delete-param-url .parameter}[[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}, [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}\>]{.signature}?]{.type-annotation} [headers]{.parameter-name}, ]{#delete-param-headers .parameter}[[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]{.type-annotation} [body]{.parameter-name}, ]{#delete-param-body .parameter}[[[Encoding](https://api.flutter.dev/flutter/dart-convert/Encoding-class.html)?]{.type-annotation} [encoding]{.parameter-name}]{#delete-param-encoding .parameter}}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[Response](https://pub.dev/documentation/http/1.2.2/http/Response-class.html)]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Sends an HTTP DELETE request with the given headers to the given
    URL.
    ::: features
    [inherited]{.feature}
    :::

[[get](https://pub.dev/documentation/http/1.2.2/http/Client/get.html)]{.name}[([[[Uri](https://api.flutter.dev/flutter/dart-core/Uri-class.html)]{.type-annotation} [url]{.parameter-name}, {]{#get-param-url .parameter}[[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}, [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}\>]{.signature}?]{.type-annotation} [headers]{.parameter-name}]{#get-param-headers .parameter}}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[Response](https://pub.dev/documentation/http/1.2.2/http/Response-class.html)]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Sends an HTTP GET request with the given headers to the given URL.
    ::: features
    [inherited]{.feature}
    :::

[[head](https://pub.dev/documentation/http/1.2.2/http/Client/head.html)]{.name}[([[[Uri](https://api.flutter.dev/flutter/dart-core/Uri-class.html)]{.type-annotation} [url]{.parameter-name}, {]{#head-param-url .parameter}[[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}, [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}\>]{.signature}?]{.type-annotation} [headers]{.parameter-name}]{#head-param-headers .parameter}}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[Response](https://pub.dev/documentation/http/1.2.2/http/Response-class.html)]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Sends an HTTP HEAD request with the given headers to the given URL.
    ::: features
    [inherited]{.feature}
    :::

[[noSuchMethod](https://pub.dev/documentation/mockito/5.4.4/mockito/Mock/noSuchMethod.html)]{.name}[([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)]{.type-annotation} [invocation]{.parameter-name}, {]{#noSuchMethod-param-invocation .parameter}[[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]{.type-annotation} [returnValue]{.parameter-name}, ]{#noSuchMethod-param-returnValue .parameter}[[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]{.type-annotation} [returnValueForMissingStub]{.parameter-name} = [deferToDefaultResponse]{.default-value}]{#noSuchMethod-param-returnValueForMissingStub .parameter}}) [→ dynamic]{.returntype .parameter} ]{.signature}
:   Handles method stubbing, method call verification, and real method
    calls.
    ::: features
    [inherited]{.feature}
    :::

[[patch](https://pub.dev/documentation/http/1.2.2/http/Client/patch.html)]{.name}[([[[Uri](https://api.flutter.dev/flutter/dart-core/Uri-class.html)]{.type-annotation} [url]{.parameter-name}, {]{#patch-param-url .parameter}[[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}, [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}\>]{.signature}?]{.type-annotation} [headers]{.parameter-name}, ]{#patch-param-headers .parameter}[[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]{.type-annotation} [body]{.parameter-name}, ]{#patch-param-body .parameter}[[[Encoding](https://api.flutter.dev/flutter/dart-convert/Encoding-class.html)?]{.type-annotation} [encoding]{.parameter-name}]{#patch-param-encoding .parameter}}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[Response](https://pub.dev/documentation/http/1.2.2/http/Response-class.html)]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Sends an HTTP PATCH request with the given headers and body to the
    given URL.
    ::: features
    [inherited]{.feature}
    :::

[[post](https://pub.dev/documentation/http/1.2.2/http/Client/post.html)]{.name}[([[[Uri](https://api.flutter.dev/flutter/dart-core/Uri-class.html)]{.type-annotation} [url]{.parameter-name}, {]{#post-param-url .parameter}[[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}, [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}\>]{.signature}?]{.type-annotation} [headers]{.parameter-name}, ]{#post-param-headers .parameter}[[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]{.type-annotation} [body]{.parameter-name}, ]{#post-param-body .parameter}[[[Encoding](https://api.flutter.dev/flutter/dart-convert/Encoding-class.html)?]{.type-annotation} [encoding]{.parameter-name}]{#post-param-encoding .parameter}}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[Response](https://pub.dev/documentation/http/1.2.2/http/Response-class.html)]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Sends an HTTP POST request with the given headers and body to the
    given URL.
    ::: features
    [inherited]{.feature}
    :::

[[put](https://pub.dev/documentation/http/1.2.2/http/Client/put.html)]{.name}[([[[Uri](https://api.flutter.dev/flutter/dart-core/Uri-class.html)]{.type-annotation} [url]{.parameter-name}, {]{#put-param-url .parameter}[[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}, [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}\>]{.signature}?]{.type-annotation} [headers]{.parameter-name}, ]{#put-param-headers .parameter}[[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]{.type-annotation} [body]{.parameter-name}, ]{#put-param-body .parameter}[[[Encoding](https://api.flutter.dev/flutter/dart-convert/Encoding-class.html)?]{.type-annotation} [encoding]{.parameter-name}]{#put-param-encoding .parameter}}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[Response](https://pub.dev/documentation/http/1.2.2/http/Response-class.html)]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Sends an HTTP PUT request with the given headers and body to the
    given URL.
    ::: features
    [inherited]{.feature}
    :::

[[read](https://pub.dev/documentation/http/1.2.2/http/Client/read.html)]{.name}[([[[Uri](https://api.flutter.dev/flutter/dart-core/Uri-class.html)]{.type-annotation} [url]{.parameter-name}, {]{#read-param-url .parameter}[[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}, [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}\>]{.signature}?]{.type-annotation} [headers]{.parameter-name}]{#read-param-headers .parameter}}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Sends an HTTP GET request with the given headers to the given URL
    and returns a Future that completes to the body of the response as a
    String.
    ::: features
    [inherited]{.feature}
    :::

[[readBytes](https://pub.dev/documentation/http/1.2.2/http/Client/readBytes.html)]{.name}[([[[Uri](https://api.flutter.dev/flutter/dart-core/Uri-class.html)]{.type-annotation} [url]{.parameter-name}, {]{#readBytes-param-url .parameter}[[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}, [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}\>]{.signature}?]{.type-annotation} [headers]{.parameter-name}]{#readBytes-param-headers .parameter}}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[Uint8List](https://api.flutter.dev/flutter/dart-typed_data/Uint8List-class.html)]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Sends an HTTP GET request with the given headers to the given URL
    and returns a Future that completes to the body of the response as a
    list of bytes.
    ::: features
    [inherited]{.feature}
    :::

[[send](../services_graphql_config/MockHttpClient/send.html)]{.name}[([[[BaseRequest](https://pub.dev/documentation/http/1.2.2/http/BaseRequest-class.html)?]{.type-annotation} [request]{.parameter-name}]{#send-param-request .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[StreamedResponse](https://pub.dev/documentation/http/1.2.2/http/StreamedResponse-class.html)]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Sends an HTTP request and asynchronously returns the response.
    ::: features
    [override]{.feature}
    :::

[[toString](https://pub.dev/documentation/mockito/5.4.4/mockito/Mock/toString.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   A string representation of this object.
    ::: features
    [inherited]{.feature}
    :::
:::

::: {#operators .section .summary .offset-anchor .inherited}
## Operators

[[operator ==](https://pub.dev/documentation/mockito/5.4.4/mockito/Mock/operator_equals.html)]{.name}[([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)]{.type-annotation} [other]{.parameter-name}]{#==-param-other .parameter}) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.returntype .parameter} ]{.signature}
:   The equality operator.
    ::: features
    [inherited]{.feature}
    :::
:::
::::::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [graphql_config](../services_graphql_config/)
3.  MockHttpClient class

##### graphql_config library

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
