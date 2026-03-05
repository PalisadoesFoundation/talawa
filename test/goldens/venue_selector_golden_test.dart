// ignore_for_file: talawa_api_doc
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/events/event_venue.dart';
import 'package:talawa/widgets/venue_selector.dart';

import '../helpers/test_helpers.mocks.dart';
import 'golden_test_helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockCreateEventViewModel mockModel;
  late List<Venue> venues;

  setUpAll(() => setUpGoldenTests());

  tearDownAll(() => tearDownGoldenTests());

  setUp(() {
    mockModel = MockCreateEventViewModel();
    venues = [
      Venue(
        id: 'v1',
        capacity: 100,
        description: 'First venue',
        imageUrl: 'http://example.com/v1.jpg',
        name: 'Venue Alpha',
        organizationId: 'org1',
      ),
      Venue(
        id: 'v2',
        capacity: 50,
        description: 'Second venue',
        imageUrl: 'http://example.com/v2.jpg',
        name: 'Venue Beta',
        organizationId: 'org1',
      ),
    ];
    when(mockModel.fetchVenues()).thenAnswer((_) async => venues);
  });

  // Venues without imageUrl — used for VenueBottomSheet golden tests
  // so that CachedNetworkImage is not triggered (avoids pumpAndSettle timeout).
  List<Venue>  venuesNoImage = [
        Venue(
          id: 'v1',
          capacity: 100,
          description: 'First venue',
          imageUrl: '',
          name: 'Venue Alpha',
          organizationId: 'org1',
        ),
        Venue(
          id: 'v2',
          capacity: 50,
          description: 'Second venue',
          imageUrl: '',
          name: 'Venue Beta',
          organizationId: 'org1',
        ),
      ];

  group('VenueSelectionWidget Golden Tests', () {
    testWidgets('no_venue_selected - light', (WidgetTester tester) async {
      await mockNetworkImages(() async {
        await tester.pumpWidget(
          themedWidget(
            SizedBox(
              width: 400,
              child: VenueSelectionWidget(model: mockModel),
            ),
            themeMode: ThemeMode.light,
          ),
        );
        await tester.pumpAndSettle();
        await expectLater(
          find.byType(VenueSelectionWidget),
          matchesGoldenFile(
            goldenFileName('venue_selector', 'no_venue_selected', 'light'),
          ),
        );
      });
    });

    testWidgets('no_venue_selected - dark', (WidgetTester tester) async {
      await mockNetworkImages(() async {
        await tester.pumpWidget(
          themedWidget(
            SizedBox(
              width: 400,
              child: VenueSelectionWidget(model: mockModel),
            ),
            themeMode: ThemeMode.dark,
          ),
        );
        await tester.pumpAndSettle();
        await expectLater(
          find.byType(VenueSelectionWidget),
          matchesGoldenFile(
            goldenFileName('venue_selector', 'no_venue_selected', 'dark'),
          ),
        );
      });
    });
  });

  group('VenueBottomSheet Golden Tests', () {
    testWidgets('with_venues - light', (WidgetTester tester) async {
      await tester.pumpWidget(
        themedWidget(
          SizedBox(
            height: 400,
            child: VenueBottomSheet(venues: venuesNoImage),
          ),
          themeMode: ThemeMode.light,
        ),
      );
      await tester.pump();
      await expectLater(
        find.byType(VenueBottomSheet),
        matchesGoldenFile(
          goldenFileName('venue_bottom_sheet', 'with_venues', 'light'),
        ),
      );
    });

    testWidgets('with_venues - dark', (WidgetTester tester) async {
      await tester.pumpWidget(
        themedWidget(
          SizedBox(
            height: 400,
            child: VenueBottomSheet(venues: venuesNoImage),
          ),
          themeMode: ThemeMode.dark,
        ),
      );
      await tester.pump();
      await expectLater(
        find.byType(VenueBottomSheet),
        matchesGoldenFile(
          goldenFileName('venue_bottom_sheet', 'with_venues', 'dark'),
        ),
      );
    });

    testWidgets('empty - light', (WidgetTester tester) async {
      await tester.pumpWidget(
        themedWidget(
          const SizedBox(
            height: 400,
            child: VenueBottomSheet(venues: []),
          ),
          themeMode: ThemeMode.light,
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(VenueBottomSheet),
        matchesGoldenFile(
          goldenFileName('venue_bottom_sheet', 'empty', 'light'),
        ),
      );
    });

    testWidgets('empty - dark', (WidgetTester tester) async {
      await tester.pumpWidget(
        themedWidget(
          const SizedBox(
            height: 400,
            child: VenueBottomSheet(venues: []),
          ),
          themeMode: ThemeMode.dark,
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(VenueBottomSheet),
        matchesGoldenFile(
          goldenFileName('venue_bottom_sheet', 'empty', 'dark'),
        ),
      );
    });
  });
}
