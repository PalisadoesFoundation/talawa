// ignore_for_file: talawa_api_doc
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:talawa/models/events/event_venue.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/widgets/venue_card.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';
import 'golden_test_helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Venue venue;

  setUpAll(() {
    setUpGoldenTests();
    testSetupLocator();
  });

  tearDownAll(() {
    tearDownGoldenTests();
    unregisterServices();
  });

  setUp(() {
    GraphqlConfig.orgURI = 'http://example.com/graphql';
    registerServices();
    locator<SizeConfig>().test();
    venue = Venue(
      id: 'v1',
      capacity: 200,
      description: 'A spacious conference hall.',
      imageUrl: 'http://localhost:4000/images/venue.jpg',
      name: 'Grand Hall',
      organizationId: 'org1',
    );
  });

  tearDown(() {
    unregisterServices();
  });

  group('VenueCard Golden Tests', () {
    testWidgets('unselected - light', (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          themedWidget(
            VenueCard(venue: venue, isSelected: false),
            themeMode: ThemeMode.light,
          ),
        );
        await tester.pumpAndSettle();
        await expectLater(
          find.byType(VenueCard),
          matchesGoldenFile(
            goldenFileName('venue_card', 'unselected', 'light'),
          ),
        );
      });
    });

    testWidgets('unselected - dark', (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          themedWidget(
            VenueCard(venue: venue, isSelected: false),
            themeMode: ThemeMode.dark,
          ),
        );
        await tester.pumpAndSettle();
        await expectLater(
          find.byType(VenueCard),
          matchesGoldenFile(
            goldenFileName('venue_card', 'unselected', 'dark'),
          ),
        );
      });
    });

    testWidgets('selected - light', (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          themedWidget(
            VenueCard(venue: venue, isSelected: true),
            themeMode: ThemeMode.light,
          ),
        );
        await tester.pumpAndSettle();
        await expectLater(
          find.byType(VenueCard),
          matchesGoldenFile(
            goldenFileName('venue_card', 'selected', 'light'),
          ),
        );
      });
    });

    testWidgets('selected - dark', (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          themedWidget(
            VenueCard(venue: venue, isSelected: true),
            themeMode: ThemeMode.dark,
          ),
        );
        await tester.pumpAndSettle();
        await expectLater(
          find.byType(VenueCard),
          matchesGoldenFile(
            goldenFileName('venue_card', 'selected', 'dark'),
          ),
        );
      });
    });
  });
}
