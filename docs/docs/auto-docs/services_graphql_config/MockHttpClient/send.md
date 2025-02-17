
<div>

# send method

</div>


<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[StreamedResponse](https://pub.dev/documentation/http/1.2.2/http/StreamedResponse-class.html)]\>]]
send(

1.  [[[BaseRequest](https://pub.dev/documentation/http/1.2.2/http/BaseRequest-class.md)?]
    request]

)


override




Sends an HTTP request and asynchronously returns the response.



## Implementation

``` language-dart
@override
Future<http.StreamedResponse> send(http.BaseRequest? request) =>
    // ignore: invalid_use_of_visible_for_testing_member
    super.noSuchMethod(
      Invocation.method(#send, [request]),
      returnValue: Future.value(
        http.StreamedResponse(
          Stream.fromIterable(const [<int>[]]),
          500,
        ),
      ),
    ) as Future<http.StreamedResponse>;
```







1.  [talawa](../../index.md)
2.  [graphql_config](../../services_graphql_config/)
3.  [MockHttpClient](../../services_graphql_config/MockHttpClient-class.md)
4.  send method

##### MockHttpClient class







