




hasConnection method - ConnectivityService class - connectivity\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/third\_party\_service/connectivity\_service.dart](../../services_third_party_service_connectivity_service/services_third_party_service_connectivity_service-library.html)
3. [ConnectivityService](../../services_third_party_service_connectivity_service/ConnectivityService-class.html)
4. hasConnection method

hasConnection


dark\_mode

light\_mode




# hasConnection method


Future<bool>
hasConnection()

This function checks if the device currently has any type of network connection.

**params**:
None

**returns**:

* `Future<bool>`: indicating whether the device has a network connection.

## Implementation

```
Future<bool> hasConnection() async {
  try {
    final results = await getConnectionType();
    return results.isNotEmpty &&
        results.any((result) => result != ConnectivityResult.none);
  } catch (e) {
    return false;
  }
}
```

 


1. [talawa](../../index.html)
2. [connectivity\_service](../../services_third_party_service_connectivity_service/services_third_party_service_connectivity_service-library.html)
3. [ConnectivityService](../../services_third_party_service_connectivity_service/ConnectivityService-class.html)
4. hasConnection method

##### ConnectivityService class





talawa
1.0.0+1






