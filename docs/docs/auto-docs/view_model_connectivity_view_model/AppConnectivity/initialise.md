
<div>

# initialise method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]




Initializes the
[AppConnectivity](../../view_model_connectivity_view_model/AppConnectivity-class.html).

**params**: None

**returns**: None



## Implementation

``` language-dart
Future<void>  async {
  await connectivityService.initConnectivity(client: http.);
  connectivityStream = connectivityService.connectionStream;
  ;
  handleConnection(await connectivityService.);
}
```







1.  [talawa](../../index.html)
2.  [connectivity_view_model](../../view_model_connectivity_view_model/)
3.  [AppConnectivity](../../view_model_connectivity_view_model/AppConnectivity-class.html)
4.  initialise method

##### AppConnectivity class







