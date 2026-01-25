import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:talawa/models/events/event_venue.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/widgets/venue_selector.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

Widget createVenueSelectionWidget({
  List<Venue>? mockVenues,
  Exception? fetchException,
}) {
  final model = getAndRegisterCreateEventModel();

  if (fetchException != null) {
    when(model.fetchVenues()).thenThrow(fetchException);
  } else {
    when(model.fetchVenues()).thenAnswer((_) async => mockVenues ?? []);
  }

  return MaterialApp(
    locale: const Locale('en'),
    supportedLocales: [
      const Locale('en', 'US'),
      const Locale('es', 'ES'),
      const Locale('fr', 'FR'),
      const Locale('hi', 'IN'),
      const Locale('zh', 'CN'),
      const Locale('de', 'DE'),
      const Locale('ja', 'JP'),
      const Locale('pt', 'PT'),
    ],
    localizationsDelegates: [
      const AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    home: Scaffold(
      body: VenueSelectionWidget(model: model),
    ),
  );
}

Widget createVenueBottomSheet(List<Venue> venues) {
  return MaterialApp(
    home: Scaffold(
      body: VenueBottomSheet(venues: venues),
    ),
  );
}

List<Venue> getMockVenues() {
  return [
    Venue(
      id: '1',
      name: 'Main Hall',
      capacity: 100,
      description: 'A large hall for events',
      imageUrl: 'https://example.com/venue1.jpg',
      organizationId: 'org1',
    ),
    Venue(
      id: '2',
      name: 'Conference Room',
      capacity: 50,
      description: 'A cozy room for meetings',
      imageUrl: '',
      organizationId: 'org1',
    ),
    Venue(
      id: '3',
      name: 'Outdoor Pavilion',
      capacity: null,
      description: null,
      imageUrl: null,
      organizationId: 'org1',
    ),
  ];
}

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    SizeConfig().test();
    testSetupLocator();
  });

  setUp(() {
    registerServices();
  });

  tearDown(() {
    unregisterServices();
  });

  group('VenueSelectionWidget Tests', () {
    testWidgets('should display add venue container when no venue is selected',
        (tester) async {
      mockNetworkImages(() async {
        await tester.pumpWidget(createVenueSelectionWidget());
        await tester.pumpAndSettle();

        expect(find.byKey(const Key('add_venue_container')), findsOneWidget);
        expect(find.text('Add Venue'), findsOneWidget);
        expect(find.byIcon(Icons.add_location), findsOneWidget);
        expect(find.byKey(const Key('selected_venue_container')), findsNothing);
      });
    });

    testWidgets('should show loading state when tapped', (tester) async {
      mockNetworkImages(() async {
        await tester.pumpWidget(createVenueSelectionWidget());
        await tester.pumpAndSettle();

        // Tap to trigger loading
        await tester.tap(find.byKey(const Key('venue_selector_gesture')));
        await tester.pump();

        // Should show loading indicator and text
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
        expect(find.text('Loading...'), findsOneWidget);
        expect(find.byIcon(Icons.add_location), findsNothing);
      });
    });

    testWidgets('should handle error when fetching venues', (tester) async {
      mockNetworkImages(() async {
        await tester.pumpWidget(
          createVenueSelectionWidget(
            fetchException: Exception('Network error'),
          ),
        );
        await tester.pumpAndSettle();

        // Tap to trigger fetch
        await tester.tap(find.byKey(const Key('venue_selector_gesture')));
        await tester.pump(const Duration(milliseconds: 500));

        // Should remain in initial state (error handled gracefully)
        expect(find.byKey(const Key('add_venue_container')), findsOneWidget);
        expect(find.text('Add Venue'), findsOneWidget);
      });
    });

    testWidgets('should show bottom sheet with venues when fetch succeeds',
        (tester) async {
      final venues = getMockVenues();

      mockNetworkImages(() async {
        await tester.pumpWidget(createVenueSelectionWidget(mockVenues: venues));
        await tester.pumpAndSettle();

        // Tap to open bottom sheet
        await tester.tap(find.byKey(const Key('venue_selector_gesture')));
        await tester.pump(const Duration(milliseconds: 300));

        // Verify bottom sheet is shown with venues
        expect(find.text('Select Venue'), findsOneWidget);
        expect(find.text('Main Hall'), findsOneWidget);
        expect(find.text('Conference Room'), findsOneWidget);
        expect(find.text('Outdoor Pavilion'), findsOneWidget);
      });
    });

    testWidgets(
        'should display selected venue details when a venue is selected',
        (tester) async {
      final venues = getMockVenues();

      mockNetworkImages(() async {
        await tester.pumpWidget(createVenueSelectionWidget(mockVenues: venues));
        await tester.pumpAndSettle();

        // Tap to open bottom sheet
        await tester.tap(find.byKey(const Key('venue_selector_gesture')));
        await tester.pump();
        await tester.pump(const Duration(seconds: 1));

        // Select a venue
        await tester.tap(find.text('Main Hall'));
        await tester.pumpAndSettle();

        // Verify selected venue container is shown
        expect(
            find.byKey(const Key('selected_venue_container')), findsOneWidget);
        expect(find.byKey(const Key('add_venue_container')), findsNothing);

        // Verify venue details
        expect(find.text('Main Hall'), findsOneWidget);
        expect(find.text('Capacity: 100'), findsOneWidget);

        // Verify buttons exist
        expect(find.byKey(const Key('edit_venue_button')), findsOneWidget);
        expect(find.byKey(const Key('clear_venue_button')), findsOneWidget);
      });
    });

    testWidgets('should clear selected venue when clear button is pressed',
        (tester) async {
      final venues = getMockVenues();

      mockNetworkImages(() async {
        await tester.pumpWidget(createVenueSelectionWidget(mockVenues: venues));
        await tester.pumpAndSettle();

        // Select a venue first
        await tester.tap(find.byKey(const Key('venue_selector_gesture')));
        await tester.pump();
        await tester.pump(const Duration(seconds: 1));
        await tester.tap(find.text('Main Hall'));
        await tester.pumpAndSettle();

        // Verify we represent selected state
        expect(
            find.byKey(const Key('selected_venue_container')), findsOneWidget);

        // Tap clear button
        await tester.tap(find.byKey(const Key('clear_venue_button')));
        await tester.pumpAndSettle();

        // Verify we are back to initial state
        expect(find.byKey(const Key('selected_venue_container')), findsNothing);
        expect(find.byKey(const Key('add_venue_container')), findsOneWidget);
        expect(find.text('Add Venue'), findsOneWidget);
      });
    });
  });

  group('VenueBottomSheet Tests', () {
    testWidgets('should display venue list correctly', (tester) async {
      final venues = [
        Venue(
          id: '1',
          name: 'Venue 1',
          capacity: 100,
          imageUrl: 'https://example.com/venue1.jpg',
        ),
        Venue(
          id: '2',
          name: 'Venue 2',
          capacity: 200,
          imageUrl: '',
        ),
      ];

      mockNetworkImages(() async {
        await tester.pumpWidget(createVenueBottomSheet(venues));
        await tester.pumpAndSettle();

        expect(find.text('Select Venue'), findsOneWidget);
        expect(find.text('Venue 1'), findsOneWidget);
        expect(find.text('Venue 2'), findsOneWidget);
        expect(find.text('Capacity: 100'), findsOneWidget);
        expect(find.text('Capacity: 200'), findsOneWidget);
      });
    });

    testWidgets('should display "No venues available" when list is empty',
        (tester) async {
      await tester.pumpWidget(createVenueBottomSheet([]));
      await tester.pumpAndSettle();

      expect(find.text('Select Venue'), findsOneWidget);
      expect(find.text('No venues available'), findsOneWidget);
      expect(find.byType(ListTile), findsNothing);
    });

    testWidgets('should handle venue with null capacity', (tester) async {
      final venues = [
        Venue(
          id: '1',
          name: 'Venue Without Capacity',
          capacity: null,
          imageUrl: 'https://example.com/venue.jpg',
        ),
      ];

      mockNetworkImages(() async {
        await tester.pumpWidget(createVenueBottomSheet(venues));
        await tester.pumpAndSettle();

        expect(find.text('Venue Without Capacity'), findsOneWidget);
        expect(find.text('Capacity:'), findsNothing);
      });
    });

    testWidgets('should display default image for venue without imageUrl',
        (tester) async {
      final venues = [
        Venue(
          id: '1',
          name: 'Venue 1',
          capacity: 100,
          imageUrl: '',
        ),
      ];

      mockNetworkImages(() async {
        await tester.pumpWidget(createVenueBottomSheet(venues));
        await tester.pumpAndSettle();

        // Should display default image
        expect(find.byType(Image), findsOneWidget);
      });
    });

    testWidgets('should handle venue with null name', (tester) async {
      final venues = [
        Venue(
          id: '1',
          name: null,
          capacity: 100,
          imageUrl: 'https://example.com/venue.jpg',
        ),
      ];

      mockNetworkImages(() async {
        await tester.pumpWidget(createVenueBottomSheet(venues));
        await tester.pumpAndSettle();

        expect(find.text('Unnamed Venue'), findsOneWidget);
        expect(find.text('Capacity: 100'), findsOneWidget);
      });
    });

    testWidgets('should return selected venue when tapped', (tester) async {
      final venues = [
        Venue(
          id: '1',
          name: 'Test Venue',
          capacity: 100,
          imageUrl: 'https://example.com/venue.jpg',
        ),
      ];

      Venue? selectedVenue;

      mockNetworkImages(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) => ElevatedButton(
                  onPressed: () async {
                    selectedVenue = await showModalBottomSheet<Venue>(
                      context: context,
                      builder: (context) => VenueBottomSheet(venues: venues),
                    );
                  },
                  child: const Text('Show Bottom Sheet'),
                ),
              ),
            ),
          ),
        );

        // Open bottom sheet
        await tester.tap(find.text('Show Bottom Sheet'));
        await tester.pumpAndSettle();

        // Tap on venue
        await tester.tap(find.text('Test Venue'));
        await tester.pumpAndSettle();

        // Verify venue was returned
        expect(selectedVenue, isNotNull);
        expect(selectedVenue!.name, equals('Test Venue'));
      });
    });
  });
}
