




initialise method - AppConnectivity class - connectivity\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/connectivity\_view\_model.dart](../../view_model_connectivity_view_model/view_model_connectivity_view_model-library.html)
3. [AppConnectivity](../../view_model_connectivity_view_model/AppConnectivity-class.html)
4. initialise method

initialise


dark\_mode

light\_mode




# initialise method


Future<void>
initialise()

Initializes the [AppConnectivity](../../view_model_connectivity_view_model/AppConnectivity-class.html).

**params**:
None

**returns**:
None


## Implementation

```
Future<void> initialise() async {
  await connectivityService.initConnectivity(client: http.Client());
  connectivityStream = connectivityService.connectionStream;
  enableSubscription();
  handleConnection(await connectivityService.getConnectionType());
}
```

 


1. [talawa](../../index.html)
2. [connectivity\_view\_model](../../view_model_connectivity_view_model/view_model_connectivity_view_model-library.html)
3. [AppConnectivity](../../view_model_connectivity_view_model/AppConnectivity-class.html)
4. initialise method

##### AppConnectivity class





talawa
1.0.0+1






