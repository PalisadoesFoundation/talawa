




enableSubscription method - ConnectivityService class - connectivity\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/third\_party\_service/connectivity\_service.dart](../../services_third_party_service_connectivity_service/services_third_party_service_connectivity_service-library.html)
3. [ConnectivityService](../../services_third_party_service_connectivity_service/ConnectivityService-class.html)
4. enableSubscription method

enableSubscription


dark\_mode

light\_mode




# enableSubscription method


Future<void>
enableSubscription()

This function enables the subscription to connectivity changes.

**params**:
None

**returns**:
None


## Implementation

```
Future<void> enableSubscription() async {
  connectivityInstance.onConnectivityChanged.listen(
    (List<ConnectivityResult> result) {
      print(result);
      connectionStatusController.add(result);
    },
    onError: (error) {
      // Handle errors during listening for changes
      print('Error listening for connectivity changes: $error');
    },
  );
}
```

 


1. [talawa](../../index.html)
2. [connectivity\_service](../../services_third_party_service_connectivity_service/services_third_party_service_connectivity_service-library.html)
3. [ConnectivityService](../../services_third_party_service_connectivity_service/ConnectivityService-class.html)
4. enableSubscription method

##### ConnectivityService class





talawa
1.0.0+1






