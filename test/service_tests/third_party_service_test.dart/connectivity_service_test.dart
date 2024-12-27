import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/third_party_service/connectivity_service.dart';
import '../../helpers/test_locator.dart' as testgetit;

List<ConnectivityResult>? connectivityStatus = [ConnectivityResult.mobile];
bool internetAccessible = true;

class MockConnectivityService extends Mock
    with MockPlatformInterfaceMixin
    implements ConnectivityService {
  final controller = StreamController<List<ConnectivityResult>>();

  @override
  StreamController<List<ConnectivityResult>> get connectionStatusController =>
      controller;

  @override
  Future<void> initConnectivity({required http.Client client}) {
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
      final response = await client!
          .get(Uri.parse(uriString ?? graphqlConfig.httpLink.uri.toString()))
          .timeout(const Duration(seconds: 30));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Timeout while checking reachability: $e');
      return false;
    }
  }
}

class MockConnectivity extends Mock implements Connectivity {
  final _controller = StreamController<List<ConnectivityResult>>.broadcast();

  @override
  Stream<List<ConnectivityResult>> get onConnectivityChanged =>
      _controller.stream;

  void emitConnectivityChange(List<ConnectivityResult> results) {
    _controller.add(results);
  }

  @override
  Future<List<ConnectivityResult>> checkConnectivity() async {
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
    } else if (url.toString() == 'https://youtube.com') {
      return http.Response('Server Error', 500);
    }
    return http.Response('{}', 200);
  }
}

void main() {
  late MockClient mockClient;
  late MockConnectivityService mockService;
  late ConnectivityService actualService;
  late MockConnectivity mockConnectivity;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    mockClient = MockClient();
    mockConnectivity = MockConnectivity();
    mockService = MockConnectivityService();

    // Register both mock and actual services
    locator.registerSingleton<Connectivity>(mockConnectivity);
    locator.registerSingleton<ConnectivityService>(mockService);

    // Initialize actual service for specific tests
    actualService = ConnectivityService(mockConnectivity);
    actualService.initConnectivity(client: mockClient);
  });

  tearDown(() {
    locator.unregister<Connectivity>();
    locator.unregister<ConnectivityService>();
  });

  group('connectivity', () {
    test('connectionStream getter', () async {
      expect(mockService, isA<ConnectivityService>());
      expect(
        mockService.connectionStream,
        isA<Stream<List<ConnectivityResult>>>(),
      );
    });

    test('listener', () async {
      final mockConnectivity = testgetit.connectivity as MockConnectivity;
      final List<ConnectivityResult> result = [
        ConnectivityResult.mobile,
        ConnectivityResult.none,
      ];
      mockConnectivity._controller.add(result);

      mockConnectivity._controller.addError(Exception("Something went wrong!"));
    });

    test('enableSubscription with actual service', () async {
      final testResults = [ConnectivityResult.wifi];

      // First verify the mock works
      expect(
        mockConnectivity.onConnectivityChanged,
        isA<Stream<List<ConnectivityResult>>>(),
      );

      // Then verify the service stream
      expect(
        actualService.connectionStream,
        isA<Stream<List<ConnectivityResult>>>(),
      );

      // Listen to both streams
      mockConnectivity.onConnectivityChanged.listen(
        expectAsync1(
          (List<ConnectivityResult> results) {
            expect(results, isA<List<ConnectivityResult>>());
            expect(results, equals(testResults));
          },
          count: 1,
        ),
      );

      // Emit and wait
      mockConnectivity.emitConnectivityChange(testResults);
    });

    test('hasConnection - with connection', () async {
      connectivityStatus = [ConnectivityResult.mobile];
      final hasConnection = await actualService.hasConnection();
      expect(hasConnection, true);
    });
    test('hasConnection - with no connection', () async {
      connectivityStatus = [ConnectivityResult.none];
      final hasConnection = await actualService.hasConnection();
      expect(hasConnection, false);
    });
    test('hasConnection - with empty list', () async {
      connectivityStatus = [];
      final hasConnection = await actualService.hasConnection();
      expect(hasConnection, false);
    });

    test('hasConnection - with mixed results', () async {
      connectivityStatus = [ConnectivityResult.none, ConnectivityResult.wifi];
      final result = await actualService.hasConnection();
      expect(result, true);
    });

    test('hasConnection - with all none', () async {
      connectivityStatus = [ConnectivityResult.none, ConnectivityResult.none];
      final result = await actualService.hasConnection();
      expect(result, false);
    });

    test('isReachable', () async {
      final reached = await actualService.isReachable(
        client: mockClient,
        uriString: 'https://google.com',
      );
      expect(reached, true);
    });

    test('isReachable throws TimeoutException on timeout', () async {
      final isReachableResult = await mockService.isReachable(
        client: mockClient,
        uriString: 'https://timeout.com',
      );
      expect(isReachableResult, false);
    });

    test('isReachable handles server error', () async {
      final reached = await mockService.isReachable(
        client: mockClient,
        uriString: 'https://youtube.com',
      );
      expect(reached, false);
    });
  });
}
