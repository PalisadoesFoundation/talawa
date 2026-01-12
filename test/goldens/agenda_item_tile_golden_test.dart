import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/events/agendaItems/event_agenda_item.dart';
import 'package:talawa/models/events/event_agenda_category.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/widgets/agenda_item_tile.dart';

import '../helpers/test_locator.dart';
import 'golden_test_helpers.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    SizeConfig().test();
  });

  group('Golden Tests for Agenda Item Tile', () {
    late EventAgendaItem testAgendaItem;

    setUp(() {
      testAgendaItem = EventAgendaItem(
        id: 'agenda1',
        name: 'Test Agenda Item',
        description: 'This is a test description for the agenda item.',
        duration: '00:30',
        sequence: 1,
        categories: [
          AgendaCategory(
            id: 'cat1',
            name: 'Category 1',
            description: 'First category',
          ),
          AgendaCategory(
            id: 'cat2',
            name: 'Category 2',
            description: 'Second category',
          ),
        ],
        urls: [
          'https://example.com/resource1',
          'https://example.com/resource2',
        ],
        attachments: [],
      );
    });

    // Golden test (standard Flutter format)
    testWidgets('AgendaItemTile collapsed light theme golden',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        themed(
          ExpandableAgendaItemTile(
            item: testAgendaItem,
            onEdit: () {},
            onDelete: () {},
          ),
          ThemeMode.light,
        ),
      );
      await tester.pumpAndSettle();

      final tileFinder = find.byType(ExpandableAgendaItemTile);
      expect(tileFinder, findsOneWidget);

      await expectLater(
        tileFinder,
        matchesGoldenFile('goldens/agenda_item_tile_collapsed_light.png'),
      );
    });

    // Golden test (standard Flutter format)
    testWidgets('AgendaItemTile collapsed dark theme golden',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        themed(
          ExpandableAgendaItemTile(
            item: testAgendaItem,
            onEdit: () {},
            onDelete: () {},
          ),
          ThemeMode.dark,
        ),
      );
      await tester.pumpAndSettle();

      final tileFinder = find.byType(ExpandableAgendaItemTile);
      expect(tileFinder, findsOneWidget);

      await expectLater(
        tileFinder,
        matchesGoldenFile('goldens/agenda_item_tile_collapsed_dark.png'),
      );
    });

    // Golden test (standard Flutter format)
    testWidgets('AgendaItemTile expanded light theme golden',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        themed(
          ExpandableAgendaItemTile(
            item: testAgendaItem,
            onEdit: () {},
            onDelete: () {},
          ),
          ThemeMode.light,
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Test Agenda Item'));
      await tester.pumpAndSettle();

      final tileFinder = find.byType(ExpandableAgendaItemTile);
      expect(tileFinder, findsOneWidget);

      await expectLater(
        tileFinder,
        matchesGoldenFile('goldens/agenda_item_tile_expanded_light.png'),
      );
    });

    // Golden test (standard Flutter format)
    testWidgets('AgendaItemTile expanded dark theme golden',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        themed(
          ExpandableAgendaItemTile(
            item: testAgendaItem,
            onEdit: () {},
            onDelete: () {},
          ),
          ThemeMode.dark,
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Test Agenda Item'));
      await tester.pumpAndSettle();

      final tileFinder = find.byType(ExpandableAgendaItemTile);
      expect(tileFinder, findsOneWidget);

      await expectLater(
        tileFinder,
        matchesGoldenFile('goldens/agenda_item_tile_expanded_dark.png'),
      );
    });
  });
}
