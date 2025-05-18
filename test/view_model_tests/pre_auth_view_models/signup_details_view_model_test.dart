import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/view_model/pre_auth_view_models/signup_details_view_model.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

class MockNavigationService extends Mock implements NavigationService {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;
}

class MockSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {
  setUpAll(() {
    testSetupLocator();
    registerServices();
  });

  group('SignupDetailsViewModel Test -', () {
    testWidgets('Check if initialise() is working fine', (tester) async {
      final model = SignupDetailsViewModel();
      final navigationService = locator<NavigationService>();

      // Creating a test MaterialApp to provide a BuildContext
      await tester.pumpWidget(
        MaterialApp(
          navigatorKey: navigationService.navigatorKey,
          home: Builder(
            builder: (context) {
              return const SizedBox();
            },
          ),
        ),
      );

      await tester.runAsync(() async {
        model.initialise(null);
      });
      await tester.pumpAndSettle();

      expect(model.greeting, isNotEmpty);
      expect(model.greeting, isNotNull);
    });

    test('Should handle exception while storing data', () async {
      final model = SignupDetailsViewModel();
      FlutterSecureStorage.setMockInitialValues(
        {"userEmail": "test@example.com", "userPassword": "password123"},
      );
      final mockSecureStorage = MockSecureStorage();
      model.secureStorage = mockSecureStorage;

      String log = "";

      await runZonedGuarded(
        () async {
          await model.storingCredentialsInSecureStorage();
        },
        (error, stack) {
          expect(error, isA<Exception>());
          expect(error.toString(), contains("Failed to save credentials:"));
          expect(stack, isNotNull);
        },
        zoneSpecification: ZoneSpecification(
          print: (self, parent, zone, line) {
            log = line;
          },
        ),
      );
      expect(
        log,
        contains("Failed to save credentials:"),
      );
    });
  });
  tearDownAll(() {
    locator.reset();
    unregisterServices();
  });
}
