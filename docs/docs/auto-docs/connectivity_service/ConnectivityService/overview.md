# Overview for `ConnectivityService`

## Description

This class provides services related to network connectivity monitoring and handling.

 It includes methods for:
 * Initializing the network service - [initConnectivity]
 * Monitoring connectivity changes - [enableSubscription]
 * Handling online and offline states - [handleOnline], [handleOffline]
 * Checking reachability of a given URI - [isReachable]
 * Handling the device's connectivity status - [handleConnection]
 * Checking if the device has any type of network connection - [hasConnection]

## Members

- **connectivityInstance**: `Connectivity`
  dependency injection connectivity.

- **connectionStatusController**: `StreamController&lt;List&lt;ConnectivityResult&gt;&gt;`
  Stream controller for network status changes.

- **_client**: `http.Client`
  Client to access internet.

## Constructors

### Unnamed Constructor


