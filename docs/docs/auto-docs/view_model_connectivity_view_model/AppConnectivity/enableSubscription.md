
<div>

# enableSubscription method

</div>


void 



Subscribes to
[connectivityStream](../../view_model_connectivity_view_model/AppConnectivity/connectivityStream.html)
of
[ConnectivityService](../../services_third_party_service_connectivity_service/ConnectivityService-class.html).

**params**: None

**returns**: None



## Implementation

``` language-dart
void  {
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







1.  [talawa](../../index.html)
2.  [connectivity_view_model](../../view_model_connectivity_view_model/)
3.  [AppConnectivity](../../view_model_connectivity_view_model/AppConnectivity-class.html)
4.  enableSubscription method

##### AppConnectivity class







