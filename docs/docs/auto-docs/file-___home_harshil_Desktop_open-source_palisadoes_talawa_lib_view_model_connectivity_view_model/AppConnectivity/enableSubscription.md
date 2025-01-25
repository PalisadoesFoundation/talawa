




enableSubscription method - AppConnectivity class - connectivity\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/connectivity\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_connectivity_view_model/)
3. [AppConnectivity](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_connectivity_view_model/AppConnectivity-class.html)
4. enableSubscription method

enableSubscription


dark\_mode

light\_mode




# enableSubscription method


void
enableSubscription()

Subscribes to [connectivityStream](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_connectivity_view_model/AppConnectivity/connectivityStream.html) of [ConnectivityService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_third_party_service_connectivity_service/ConnectivityService-class.html).

**params**:
None

**returns**:
None


## Implementation

```
void enableSubscription() {
  try {
    _subscription =
        connectivityStream.listen((List<ConnectivityResult> result) {
      handleConnection(result);
    });
  } catch (e) {
    print("Error subscribing to connectivity stream: $e");
  }
}
```

 


1. [talawa](../../index.html)
2. [connectivity\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_connectivity_view_model/)
3. [AppConnectivity](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_connectivity_view_model/AppConnectivity-class.html)
4. enableSubscription method

##### AppConnectivity class





talawa
1.0.0+1






