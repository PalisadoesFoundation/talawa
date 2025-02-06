


# send method







- @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;[StreamedResponse](https://pub.dev/documentation/http/0.13.6/http/StreamedResponse-class.html)> send
([BaseRequest](https://pub.dev/documentation/http/0.13.6/http/BaseRequest-class.html)? request)

_<span class="feature">override</span>_



<p>Sends an HTTP request and asynchronously returns the response.</p>



## Implementation

```dart
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







