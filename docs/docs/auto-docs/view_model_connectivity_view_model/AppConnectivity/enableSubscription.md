




enableSubscription method - AppConnectivity class - connectivity\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/connectivity\_view\_model.dart](../../view_model_connectivity_view_model/view_model_connectivity_view_model-library.html)
3. [AppConnectivity](../../view_model_connectivity_view_model/AppConnectivity-class.html)
4. enableSubscription method

enableSubscription


dark\_mode

light\_mode




# enableSubscription method


void
enableSubscription()

Subscribes to [connectivityStream](../../view_model_connectivity_view_model/AppConnectivity/connectivityStream.html) of [ConnectivityService](../../services_third_party_service_connectivity_service/ConnectivityService-class.html).

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
2. [connectivity\_view\_model](../../view_model_connectivity_view_model/view_model_connectivity_view_model-library.html)
3. [AppConnectivity](../../view_model_connectivity_view_model/AppConnectivity-class.html)
4. enableSubscription method

##### AppConnectivity class





talawa
1.0.0+1






