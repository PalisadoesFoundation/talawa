




isReachable method - ConnectivityService class - connectivity\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/third\_party\_service/connectivity\_service.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_third_party_service_connectivity_service/)
3. [ConnectivityService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_third_party_service_connectivity_service/ConnectivityService-class.html)
4. isReachable method

isReachable


dark\_mode

light\_mode




# isReachable method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)>
isReachable({

1. dynamic client,
2. [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? uriString,

})

This function checks if a given URI is reachable within a specified timeout period.

Specifically designed to

**params**:

* `client`: An instance of `http.Client` to make the HTTP request.
* `uriString`: An optional `String` specifying the URI to check.
  Defaults to 'org link' if not provided.

**returns**:

* `Future<bool>`: indicates if the url is reachable.

## Implementation

```
Future<bool> isReachable({
  http.Client? client,
  String? uriString,
}) async {
  try {
    client ??= _client;
    await client
        .get(Uri.parse(uriString ?? graphqlConfig.httpLink.uri.toString()))
        .timeout(const Duration(seconds: 30));
    return true;
  } catch (e) {
    print('Timeout while checking reachability: $e');
    return false;
  }
}
```

 


1. [talawa](../../index.html)
2. [connectivity\_service](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_third_party_service_connectivity_service/)
3. [ConnectivityService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_third_party_service_connectivity_service/ConnectivityService-class.html)
4. isReachable method

##### ConnectivityService class





talawa
1.0.0+1






