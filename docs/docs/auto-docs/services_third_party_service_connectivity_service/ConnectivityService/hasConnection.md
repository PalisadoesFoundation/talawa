
<div>

# hasConnection method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]\>]]




This function checks if the device currently has any type of network
connection.

**params**: None

**returns**:

-   `Future<bool>`: indicating whether the device has a network
    connection.



## Implementation

``` language-dart
Future<bool>  async {
  try {
    final results = await ;
    return results.isNotEmpty &&
        results.any((result) => result != ConnectivityResult.none);
  } catch (e) {
    return false;
  }
}
```







1.  [talawa](../../index.md)
2.  [connectivity_service](../../services_third_party_service_connectivity_service/)
3.  [ConnectivityService](../../services_third_party_service_connectivity_service/ConnectivityService-class.md)
4.  hasConnection method

##### ConnectivityService class







