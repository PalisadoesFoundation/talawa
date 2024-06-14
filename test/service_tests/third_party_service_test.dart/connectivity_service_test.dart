import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/third_party_service/connectivity_service.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart' as testgetit;

ConnectivityResult? connectivityStatus = ConnectivityResult.mobile;
bool internetAccessible = true;

class MockConnectivityService extends Mock
    with MockPlatformInterfaceMixin
    implements ConnectivityService {
  final controller = StreamController<ConnectivityResult>();

  @override
  // TODO: implement connectionStatusController
  StreamController<ConnectivityResult> get connectionStatusController =>
      controller;

  @override
  Future<void> initConnectivity() {
    return Future(() => null);
  }

  @override
  Stream<ConnectivityResult> get connectionStream => controller.stream;

  @override
  Future<ConnectivityResult> getConnectionType() {
    return Future.value(connectivityStatus);
  }

  @override
  Future<bool> isReachable({http.Client? client, String? uriString}) {
    return Future.value(internetAccessible);
  }
}

class MockConnectivity extends Mock implements Connectivity {
  final controller = StreamController<ConnectivityResult>();

  StreamController<ConnectivityResult> get connectivityController => controller;

  @override
  Stream<ConnectivityResult> get onConnectivityChanged => controller.stream;

  @override
  Future<ConnectivityResult> checkConnectivity() async {
    // TODO: implement checkConnectivity
    if (connectivityStatus == null) {
      throw const SocketException('socket exception');
    }
    return connectivityStatus!;
  }
}

class MockClient extends Mock implements http.Client {
  @override
  Future<http.Response> get(Uri url, {Map<String, String>? headers}) async {
    if (url.toString() == 'https://timeout.com') {
      throw TimeoutException('site took too long to respond');
    }
    return http.Response('{}', 200);
  }
}

void main() {
  late MockClient mockClient;
  late ConnectivityService service;
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    mockClient = MockClient();
    getAndRegisterConnectivity();
    connectivityStatus = ConnectivityResult.mobile;
    service = ConnectivityService(client: mockClient);
    locator.registerSingleton<ConnectivityService>(service);
  });

  group('connectivity', () {
    test('connectionStream getter', () async {
      expect(connectivityService, isA<ConnectivityService>());
      expect(service.connectionStream, isA<Stream<ConnectivityResult>>());
    });

    test('check initConnectivity', () async {
      connectivityStatus = null;
      service.initConnectivity();
    });

    test('listener', () async {
      final mockConnectivity = testgetit.connectivity as MockConnectivity;
      mockConnectivity.connectivityController.add(ConnectivityResult.mobile);

      mockConnectivity.connectivityController
          .addError(Exception("Something went wrong!"));
    });

    test('check has connection', () async {
      connectivityStatus = ConnectivityResult.none;
      expect(await service.hasConnection(), false);

      connectivityStatus = ConnectivityResult.mobile;
      expect(await service.hasConnection(), true);
    });

    test('isReachable', () async {
      final reached =
          await service.isReachable(uriString: 'https://google.com');
      expect(reached, true);
    });

    test('isReachable throws TimeoutException on timeout', () async {
      final isReachableResult = await service.isReachable(
        client: mockClient,
        uriString: 'https://timeout.com',
      );

      // Verify results (timeout should be thrown before verification)
      expect(isReachableResult, false);
    });
  });
}
