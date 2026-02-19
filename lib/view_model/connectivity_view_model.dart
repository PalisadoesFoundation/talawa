import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:talawa/locator.dart';
import 'package:talawa/view_model/base_view_model.dart';

enum ConnectivityUIEvent {
  online,
  offline,
}

class AppConnectivity extends BaseModel {
  late final Stream<List<ConnectivityResult>> connectivityStream;
  StreamSubscription? _subscription;

  static bool isOnline = false;

  final StreamController<ConnectivityUIEvent> uiEvents =
      StreamController.broadcast();

  Future<void> initialise() async {
    await connectivityService.initConnectivity(client: http.Client());
    connectivityStream = connectivityService.connectionStream;
    enableSubscription();
    handleConnection(await connectivityService.getConnectionType());
  }

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

  Future<void> handleConnection(List<ConnectivityResult> result) async {
    if (result.any(
      (r) =>
          ![ConnectivityResult.none, ConnectivityResult.bluetooth].contains(r),
    )) {
      await handleOnline();
    } else {
      await handleOffline();
    }
  }

  Future<void> handleOnline() async {
    isOnline = true;
    uiEvents.add(ConnectivityUIEvent.online);

    databaseFunctions.init();

    for (final action in cacheService.offlineActionQueue.getActions()) {
      await action.execute();
    }
  }

  Future<void> handleOffline() async {
    isOnline = false;
    uiEvents.add(ConnectivityUIEvent.offline);

    databaseFunctions.init();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    uiEvents.close();
    super.dispose();
  }
}
