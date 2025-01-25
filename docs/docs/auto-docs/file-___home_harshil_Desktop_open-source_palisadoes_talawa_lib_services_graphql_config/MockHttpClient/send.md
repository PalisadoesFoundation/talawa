




send method - MockHttpClient class - graphql\_config library - Dart API







menu

1. [talawa](../../index.html)
2. [services/graphql\_config.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_graphql_config/)
3. [MockHttpClient](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_graphql_config/MockHttpClient-class.html)
4. send method

send


dark\_mode

light\_mode




# send method


1. @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)
send(

1. dynamic request

)

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
2. [graphql\_config](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_graphql_config/)
3. [MockHttpClient](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_graphql_config/MockHttpClient-class.html)
4. send method

##### MockHttpClient class





talawa
1.0.0+1






