




send method - MockHttpClient class - graphql\_config library - Dart API







menu

1. [talawa](../../index.html)
2. [services/graphql\_config.dart](../../services_graphql_config/services_graphql_config-library.html)
3. [MockHttpClient](../../services_graphql_config/MockHttpClient-class.html)
4. send method

send


dark\_mode

light\_mode




# send method


1. @override

Future<[StreamedResponse](https://pub.dev/documentation/http/1.2.2/http/StreamedResponse-class.html)>
send(

1. [BaseRequest](https://pub.dev/documentation/http/1.2.2/http/BaseRequest-class.html)? request

)
override

Sends an HTTP request and asynchronously returns the response.


## Implementation

```
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

 


1. [talawa](../../index.html)
2. [graphql\_config](../../services_graphql_config/services_graphql_config-library.html)
3. [MockHttpClient](../../services_graphql_config/MockHttpClient-class.html)
4. send method

##### MockHttpClient class





talawa
1.0.0+1






