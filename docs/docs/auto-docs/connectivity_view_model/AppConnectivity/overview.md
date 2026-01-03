# Overview for `AppConnectivity`

## Description

This class provides services related to network connectivity monitoring and handling.

 It leverages the `connectivity` package to track the device's internet connection status.
 It offers methods to:

 * Initialize the AppConnectivity: [initialise]
 * Subscribe to connectivity changes: [enableSubscription]
 * Handle online and offline states: [handleOnline], [handleOffline]
 * Handle the device's overall connectivity status: [handleConnection]
 * Triggers the snackbar UI to show online status.: [showSnackbar]

## Dependencies

- BaseModel

## Members

- **connectivityStream**: `Stream<List<ConnectivityResult>>`
  Stream from [ConnectivityService].

- **_subscription**: `StreamSubscription?`
  Subscription of the [connectivityStream]

- **isOnline**: `bool`
  flag to handle online status.

