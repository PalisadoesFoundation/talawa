




enableSubscription method - ConnectivityService class - connectivity\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/third\_party\_service/connectivity\_service.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_third_party_service_connectivity_service/)
3. [ConnectivityService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_third_party_service_connectivity_service/ConnectivityService-class.html)
4. enableSubscription method

enableSubscription


dark\_mode

light\_mode




# enableSubscription method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
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
2. [connectivity\_service](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_third_party_service_connectivity_service/)
3. [ConnectivityService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_third_party_service_connectivity_service/ConnectivityService-class.html)
4. enableSubscription method

##### ConnectivityService class





talawa
1.0.0+1






