import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:http/http.dart' as http;
import 'package:talawa/locator.dart';
import 'package:talawa/view_model/base_view_model.dart';

/// This class provides services related to network connectivity monitoring and handling.
///
/// It leverages the `connectivity` package to track the device's internet connection status.
/// It offers methods to:
///
/// * Initialize the AppConnectivity: [initialise]
/// * Subscribe to connectivity changes: [enableSubscription]
/// * Handle online and offline states: [handleOnline], [handleOffline]
/// * Handle the device's overall connectivity status: [handleConnection]
/// * Triggers the snackbar UI to show online status.: [showSnackbar]
class AppConnectivity extends BaseModel {
  /// Stream from [ConnectivityService].
  late final Stream<List<ConnectivityResult>> connectivityStream;

  /// Subscription of the [connectivityStream]
  StreamSubscription? _subscription;

  /// flag to handle online status.
  static bool isOnline = false;

  /// Initializes the [AppConnectivity].
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> initialise() async {
    await connectivityService.initConnectivity(client: http.Client());
    connectivityStream = connectivityService.connectionStream;
    enableSubscription();
    handleConnection(await connectivityService.getConnectionType());
  }

  /// Subscribes to [connectivityStream] of [ConnectivityService].
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
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

  /// This function handles the device's connectivity status based on the provided [List<ConnectivityResult>].
  ///
  /// **params**:
  /// * `result`: A [List<ConnectivityResult>] indicating the current connectivity status.
  ///
  /// **returns**:
  ///   None
  Future<void> handleConnection(List<ConnectivityResult> result) async {
    if (result.any(
      (r) =>
          ![ConnectivityResult.none, ConnectivityResult.bluetooth].contains(r),
    )) {
      handleOnline();
    } else {
      handleOffline();
    }
  }

  /// This function handles the actions to be taken when the device is online.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> handleOnline() async {
    isOnline = true;
    navigationService.showConnectivitySnackBar(isOnline: true);
    databaseFunctions.init();
    for (final action in cacheService.offlineActionQueue.getActions()) {
      await action.execute();
    }
  }

  /// This function handles the actions to be taken when the device is offline.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> handleOffline() async {
    isOnline = false;
    navigationService.showConnectivitySnackBar(isOnline: false);
    databaseFunctions.init();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
