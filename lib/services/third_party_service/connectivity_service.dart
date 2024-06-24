import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:talawa/locator.dart';

/// This class provides services related to network connectivity monitoring and handling.
///
/// It includes methods for:
/// * Initializing the network service - [initConnectivity]
/// * Monitoring connectivity changes - [enableSubscription]
/// * Handling online and offline states - [_handleOnline], [_handleOffline]
/// * Checking reachability of a given URI - [isReachable]
/// * Handling the device's connectivity status - [handleConnection]
/// * Checking if the device has any type of network connection - [hasConnection]
class ConnectivityService {
  /// This function is used to initialize the network service.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  ConnectivityService({required http.Client client}) {
    _client = client;
    _connectionStatusController = StreamController<ConnectivityResult>();
    initConnectivity();
  }

  /// Stream controller for network status changes
  late StreamController<ConnectivityResult> _connectionStatusController;

  /// Getter for the stream of connection status changes.
  Stream<ConnectivityResult> get connectionStream =>
      _connectionStatusController.stream;

  /// Client to access internet.
  late final http.Client _client;

  /// This function initializes connectivity monitoring.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> initConnectivity() async {
    /// Try getting initial connectivity status
    checkInitialConnection();

    /// Listen for future changes in connectivity
    enableSubscription();
  }

  /// This function checks the initial connection status.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> checkInitialConnection() async {
    try {
      final result = await connectivity.checkConnectivity();
      print(result);
      _connectionStatusController.add(result);
      handleConnection(result);
    } catch (e) {
      // Handle other exceptions
      print('Error checking connectivity: $e');
      _connectionStatusController
          .add(ConnectivityResult.none); // Assume no connection on error
      handleConnection(ConnectivityResult.none);
    }
  }

  /// This function enables the subscription to connectivity changes.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> enableSubscription() async {
    connectivity.onConnectivityChanged.listen(
      (ConnectivityResult result) {
        print(result);
        _connectionStatusController.add(result);
        handleConnection(result);
      },
      onError: (error) {
        // Handle errors during listening for changes
        print('Error listening for connectivity changes: $error');
      },
    );
  }

  /// This function handles the actions to be taken when the device is online.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> _handleOnline() async {
    // To be implemented.
  }

  /// This function handles the actions to be taken when the device is offline.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> _handleOffline() async {
    // To be implemented.
  }

  /// This function checks if a given URI is reachable within a specified timeout period.
  ///
  /// **params**:
  /// * `client`: An instance of `http.Client` to make the HTTP request.
  /// * `uriString`: An optional `String` specifying the URI to check.
  /// Defaults to 'http://www.google.com' if not provided.
  ///
  /// **returns**:
  /// * `Future<bool>`: indicates if the url is reachable.
  Future<bool> isReachable({
    http.Client? client,
    String? uriString,
  }) async {
    try {
      client ??= _client;
      await client
          .get(Uri.parse(uriString ?? 'http://www.google.com'))
          .timeout(const Duration(seconds: 5));
      return true;
    } catch (e) {
      print('Timeout while checking reachability: $e');
      return false;
    }
  }

  /// This function handles the device's connectivity status based on the provided `ConnectivityResult`.
  ///
  /// **params**:
  /// * `result`: A `ConnectivityResult` indicating the current connectivity status.
  ///
  /// **returns**:
  ///   None
  Future<void> handleConnection(ConnectivityResult result) async {
    if (await hasConnection() && await isReachable(client: _client)) {
      _handleOnline();
    } else {
      _handleOffline();
    }
  }

  /// This function checks if the device currently has any type of network connection.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Future<bool>`: indicating whether the device has a network connection.
  Future<bool> hasConnection() async {
    try {
      final result = await connectivity.checkConnectivity();
      return result != ConnectivityResult.none;
    } catch (e) {
      return false;
    }
  }
}
