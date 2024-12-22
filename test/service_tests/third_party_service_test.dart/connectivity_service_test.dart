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

List<ConnectivityResult>? connectivityStatus = [ConnectivityResult.mobile];
bool internetAccessible = true;

class MockConnectivityService extends Mock
    with MockPlatformInterfaceMixin
    implements ConnectivityService {
  final controller = StreamController<List<ConnectivityResult>>();

  @override
  // TODO: implement connectionStatusController
  StreamController<List<ConnectivityResult>> get connectionStatusController =>
      controller;

  @override
  Future<void> initConnectivity({required http.Client client}) {
    // TODO: implement initConnectivity
    return Future(() => null);
  }

  @override
  Stream<List<ConnectivityResult>> get connectionStream => controller.stream;

  @override
  Future<List<ConnectivityResult>> getConnectionType() {
    return Future.value(connectivityStatus!);
  }

  @override
  Future<bool> hasConnection() async {
    try {
      final results = await getConnectionType();
      return results.isNotEmpty &&
          results.any((result) => result != ConnectivityResult.none);
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> isReachable({
    http.Client? client,
    String? uriString,
  }) async {
    try {
      await client!
          .get(Uri.parse(uriString ?? graphqlConfig.httpLink.uri.toString()))
          .timeout(const Duration(seconds: 30));
      return true;
    } catch (e) {
      print('Timeout while checking reachability: $e');
      return false;
    }
  }
}

class MockConnectivity extends Mock implements Connectivity {
  final controller = StreamController<List<ConnectivityResult>>();

  StreamController<List<ConnectivityResult>> get connectivityController =>
      controller;

  @override
  Stream<List<ConnectivityResult>> get onConnectivityChanged =>
      controller.stream;

  @override
  Future<List<ConnectivityResult>> checkConnectivity() async {
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
  late MockConnectivityService service;
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    mockClient = MockClient();
    getAndRegisterConnectivity();
    connectivityStatus = [ConnectivityResult.mobile];
    service = MockConnectivityService();
    locator.registerSingleton<ConnectivityService>(service);
    connectivityService.initConnectivity(client: http.Client());
  });

  group('connectivity', () {
    test(
      'connectionStream getter',
      () async {
        expect(service, isA<ConnectivityService>());
        expect(
          service.connectionStream,
          isA<Stream<List<ConnectivityResult>>>(),
        );
      },
    );

    test('listener', () async {
      final mockConnectivity = testgetit.connectivity as MockConnectivity;
      mockConnectivity.connectivityController.add([ConnectivityResult.mobile]);

      mockConnectivity.connectivityController
          .addError(Exception("Something went wrong!"));
    });

    test('successfully listens to connectivity changes', () async {
      final expectedResults = [
        ConnectivityResult.mobile,
        ConnectivityResult.wifi,
      ];

      service.connectionStatusController.stream.listen(
        (List<ConnectivityResult> results) {
          expect(results, equals(expectedResults));
        },
      );

      // Trigger the event
      service.connectionStatusController.add(expectedResults);
    });

    test('check has connection - no connection', () async {
      connectivityStatus = [ConnectivityResult.none];
      expect(await service.hasConnection(), false);
    });

    test('check has connection - with connection', () async {
      connectivityStatus = [ConnectivityResult.mobile];
      expect(await service.hasConnection(), true);
    });

    test('check has connection - empty list', () async {
      connectivityStatus = [];
      expect(await service.hasConnection(), false);
    });

    test('check has connection - mixed results', () async {
      connectivityStatus = [ConnectivityResult.none, ConnectivityResult.wifi];
      expect(await service.hasConnection(), true);
    });

    test('check has connection - all none', () async {
      connectivityStatus = [ConnectivityResult.none, ConnectivityResult.none];
      expect(await service.hasConnection(), false);
    });

    test('isReachable', () async {
      final reached = await service.isReachable(
        client: mockClient,
        uriString: 'https://google.com',
      );
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
