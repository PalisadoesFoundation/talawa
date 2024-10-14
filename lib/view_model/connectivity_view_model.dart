import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:talawa/exceptions/critical_action_exception.dart';
import 'package:talawa/exceptions/graphql_exception_resolver.dart';
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
  late final Stream<ConnectivityResult> connectivityStream;

  /// Subscription of the [connectivityStream]
  StreamSubscription? _subscription;

  /// flag to handle online status.
  static late bool isOnline;

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

    // Extract the first result from the list of connectivity results
    List<ConnectivityResult> resultList =
        await connectivityService.getConnectionType();
    if (resultList.isNotEmpty) {
      handleConnection(resultList.first);
    } else {
      handleConnection(ConnectivityResult
          .none); // Default to 'none' if the list is unexpectedly empty
    }
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
      _subscription = connectivityStream.listen((ConnectivityResult result) {
        handleConnection(result);
      });
    } catch (e) {
      print("Error subscribing to connectivity stream: $e");
    }
  }

  /// This function handles the device's connectivity status based on the provided [ConnectivityResult].
  ///
  /// **params**:
  /// * `result`: A [ConnectivityResult] indicating the current connectivity status.
  ///
  /// **returns**:
  ///   None
  Future<void> handleConnection(ConnectivityResult result) async {
    if (![ConnectivityResult.none, ConnectivityResult.bluetooth]
        .contains(result)) {
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
    showSnackbar(isOnline: true);
    databaseFunctions.init();
    cacheService.offlineActionQueue.getActions().forEach((action) async {
      final result = await action.execute();
      GraphqlExceptionResolver.encounteredExceptionOrError(
        CriticalActionException('action done'),
      );
      debugPrint(result.toString());
    });
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
    showSnackbar(isOnline: false);
    databaseFunctions.init();
  }

  /// Triggers the snackbar UI to show online status.
  ///
  /// **params**:
  /// * `isOnline`: online status of the device.
  ///
  /// **returns**:
  ///   None
  static void showSnackbar({required bool isOnline}) {
    final context = navigationService.navigatorKey.currentContext;
    if (context != null) {
      final TextStyle customStyle = Theme.of(context).textTheme.bodyMedium!;
      if (isOnline) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 5),
            backgroundColor: Colors.green,
            content: Text(
              'You are back online!',
              style: customStyle,
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 5),
            backgroundColor: const Color.fromRGBO(65, 65, 66, 1),
            content: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'You are ',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.white),
                  ),
                  TextSpan(
                    text: 'Offline!',
                    style: customStyle.copyWith(color: Colors.green),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
