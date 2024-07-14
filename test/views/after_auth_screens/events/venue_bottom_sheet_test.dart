// ignore_for_file: talawa_api_doc
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:talawa/models/events/event_venue.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/views/after_auth_screens/events/venue_bottom_sheet.dart';
import 'package:talawa/widgets/venue_card.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

Widget createVenueBottomSheet(List<Venue> venues) {
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
      body: VenueBottomSheet(venues: venues),
    ),
  );
}

List<Venue> venues = [
  Venue(
    id: '1',
    capacity: 100,
    description: 'A beautiful venue for events.',
    imageUrl: 'http://localhost:4000/images/venue1.jpg',
    name: 'Main Hall',
    organizationId: 'org1',
  ),
  Venue(
    id: '2',
    capacity: 50,
    description: 'A small cozy venue.',
    imageUrl: 'http://localhost:4000/images/venue2.jpg',
    name: 'Conference Room',
    organizationId: 'org2',
  ),
];

void main() {
  testSetupLocator();
  group('VenueBottomSheet Widget Tests', () {
    setUp(() {
      registerServices();
      locator<SizeConfig>().test();
    });

    testWidgets('Displays venues correctly', (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(createVenueBottomSheet(venues));
        await tester.pumpAndSettle();

        expect(find.text('Add Venue'), findsOneWidget);
        expect(find.byType(VenueCard), findsNWidgets(venues.length));
        expect(find.text('Main Hall'), findsOneWidget);
        expect(find.text('Conference Room'), findsOneWidget);
      });
    });

    testWidgets('Searches venues correctly', (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(createVenueBottomSheet(venues));
        await tester.pumpAndSettle();

        await tester.tap(find.byIcon(Icons.search));
        await tester.pumpAndSettle();

        expect(find.byType(TextField), findsOneWidget);

        await tester.enterText(find.byType(TextField), 'Main');
        await tester.pumpAndSettle();

        expect(find.byType(VenueCard), findsOneWidget);
        expect(find.text('Main Hall'), findsOneWidget);
        expect(find.text('Conference Room'), findsNothing);

        await tester.tap(find.byIcon(Icons.close));
        await tester.pumpAndSettle();

        expect(find.byType(VenueCard), findsNWidgets(venues.length));
      });
    });

    testWidgets('Selects a venue correctly', (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(createVenueBottomSheet(venues));
        await tester.pumpAndSettle();

        await tester.tap(find.text('Main Hall'));
        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.check), findsOneWidget);

        await tester.tap(find.byIcon(Icons.check));
        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.arrow_back), findsNothing);
      });
    });

    testWidgets('Shows no venues available when list is empty',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(createVenueBottomSheet([]));
        await tester.pumpAndSettle();

        expect(find.text('No Venues added yet'), findsOneWidget);
      });
    });
    testWidgets(
        'Shows no venues available when search query doesnt match with any venue',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(createVenueBottomSheet(venues));
        await tester.pumpAndSettle();

        await tester.tap(find.byIcon(Icons.search));
        await tester.pumpAndSettle();

        expect(find.byType(TextField), findsOneWidget);

        await tester.enterText(find.byType(TextField), 'abc');
        await tester.pumpAndSettle();

        expect(find.byType(VenueCard), findsNothing);
        expect(find.text('Main Hall'), findsNothing);
        expect(find.text('Conference Room'), findsNothing);
        expect(find.text('No venues available'), findsOneWidget);

        await tester.tap(find.byIcon(Icons.close));
        await tester.pumpAndSettle();

        expect(find.byType(VenueCard), findsNWidgets(venues.length));
      });
    });
  });
}
