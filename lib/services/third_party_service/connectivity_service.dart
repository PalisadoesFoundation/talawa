import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:talawa/locator.dart';

/// This class provides services related to network connectivity monitoring and handling.
///
/// It includes methods for:
/// * Initializing the network service - [initConnectivity]
/// * Monitoring connectivity changes - [enableSubscription]
/// * Handling online and offline states - [handleOnline], [handleOffline]
/// * Checking reachability of a given URI - [isReachable]
/// * Handling the device's connectivity status - [handleConnection]
/// * Checking if the device has any type of network connection - [hasConnection]
class ConnectivityService {
  ConnectivityService(
    this.connectivityInstance,
  );

  /// dependency injection connectivity.
  late final Connectivity connectivityInstance;

  /// Stream controller for network status changes.
  late StreamController<List<ConnectivityResult>> connectionStatusController;

    /// Getter for the stream of connection status changes.
    Stream<List<ConnectivityResult>> get connectionStream =>
      connectionStatusController.stream;

  /// Checks the current internet connectivity status of the device.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Future<List<ConnectivityResult>>`: indicates if the url is reachable.
  Future<List<ConnectivityResult>> getConnectionType() async {
    final result = await connectivityInstance.checkConnectivity();
    // connectivity_plus 6.1.5 returns a single ConnectivityResult, wrap in a list for compatibility
    return [result];
  }

  /// Client to access internet.
  late final http.Client _client;

  /// This function initializes connectivity monitoring.
  ///
  /// **params**:
  /// * `client`: An instance of `http.Client` to make the HTTP request.
  ///
  /// **returns**:
  ///   None
  Future<void> initConnectivity({required http.Client client}) async {
    _client = client;
    connectionStatusController = StreamController<List<ConnectivityResult>>.broadcast();
    await enableSubscription();
  }

  /// This function enables the subscription to connectivity changes.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> enableSubscription() async {
    connectivityInstance.onConnectivityChanged.listen((ConnectivityResult result) {
      // Wrap in a list for compatibility with the rest of the app
      connectionStatusController.add([result]);
    });
  }

  /// This function checks if a given URI is reachable within a specified timeout period.
  ///
  /// Specifically designed to
  ///
  /// **params**:
  /// * `client`: An instance of `http.Client` to make the HTTP request.
  /// * `uriString`: An optional `String` specifying the URI to check.
  /// Defaults to 'org link' if not provided.
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
          .get(Uri.parse(uriString ?? graphqlConfig.httpLink.uri.toString()))
          .timeout(const Duration(seconds: 30));
      return true;
    } catch (e) {
      print('Timeout while checking reachability: $e');
      return false;
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
    final results = await getConnectionType();
    return results.any((r) => r != ConnectivityResult.none);
  }
}
