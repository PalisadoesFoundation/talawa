
<div>

# isReachable method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]\>]]
isReachable({

1.  [[[Client](https://pub.dev/documentation/http/1.2.2/http/Client-class.md)?]
    client, ]
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
    uriString, ]

})



This function checks if a given URI is reachable within a specified
timeout period.

Specifically designed to

**params**:

-   `client`: An instance of `http.Client` to make the HTTP request.
-   `uriString`: An optional `String` specifying the URI to check.
    Defaults to \'org link\' if not provided.

**returns**:

-   `Future<bool>`: indicates if the url is reachable.



## Implementation

``` language-dart
Future<bool> isReachable({
  http.Client? client,
  String? uriString,
}) async {
  try {
    client ??= _client;
    await client
        .get(Uri.parse(uriString ?? graphqlConfig.httpLink.uri.))
        .timeout(const Duration(seconds: 30));
    return true;
  } catch (e) {
    print('Timeout while checking reachability: $e');
    return false;
  }
}
```







1.  [talawa](../../index.md)
2.  [connectivity_service](../../services_third_party_service_connectivity_service/)
3.  [ConnectivityService](../../services_third_party_service_connectivity_service/ConnectivityService-class.md)
4.  isReachable method

##### ConnectivityService class







