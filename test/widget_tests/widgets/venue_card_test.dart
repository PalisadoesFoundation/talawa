import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:talawa/models/events/event_venue.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/widgets/venue_card.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

void main() {
  testSetupLocator();
  setUp(() {
    GraphqlConfig.orgURI = 'http://example.com/graphql';
    registerServices();
    locator<SizeConfig>().test();
  });

  group('VenueCard Widget Tests', () {
    testWidgets('Displays venue details correctly',
        (WidgetTester tester) async {
      final venue = Venue(
        id: '1',
        capacity: 100,
        description: 'A beautiful venue for events.',
        imageUrl: 'http://localhost:4000/images/venue.jpg',
        name: 'Main Hall',
        organizationId: 'org1',
      );

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: VenueCard(
                venue: venue,
                isSelected: false,
              ),
            ),
          ),
        );

        expect(find.text('Main Hall'), findsOneWidget);
        expect(find.text('Capacity: 100'), findsOneWidget);
        expect(find.text('A beautiful venue for events.'), findsOneWidget);
        expect(find.byIcon(Icons.check_circle), findsNothing);
      });
    });

    testWidgets('Displays selected state correctly',
        (WidgetTester tester) async {
      final venue = Venue(
        id: '1',
        capacity: 100,
        description: 'A beautiful venue for events.',
        imageUrl: 'http://localhost:4000/images/venue.jpg',
        name: 'Main Hall',
        organizationId: 'org1',
      );

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: VenueCard(
                venue: venue,
                isSelected: true,
              ),
            ),
          ),
        );

        expect(find.byIcon(Icons.check_circle), findsOneWidget);
      });
    });

    testWidgets('Displays default image when imageUrl is empty',
        (WidgetTester tester) async {
      final venue = Venue(
        id: '1',
        capacity: 100,
        description: 'A beautiful venue for events.',
        imageUrl: '',
        name: 'Main Hall',
        organizationId: 'org1',
      );

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: VenueCard(
                venue: venue,
                isSelected: false,
              ),
            ),
          ),
        );
        expect(
          find.byKey(const Key('image_container')),
          findsWidgets,
        );
      });
    });
  });
}
