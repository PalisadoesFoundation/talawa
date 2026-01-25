// ignore_for_file: talawa_api_doc
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/events/event_agenda_category.dart';
import 'package:talawa/models/events/event_agenda_item.dart';
import 'package:talawa/widgets/agenda_item_tile.dart';

import 'golden_test_helpers.dart';

void main() {
  group('ExpandableAgendaItemTile Golden Tests', () {
    testWidgets('agenda_item_tile with full data - light theme',
        (WidgetTester tester) async {
      final testItem = EventAgendaItem(
        id: '1',
        title: 'Team Planning Meeting',
        description: 'Quarterly planning session for the development team',
        duration: '01:30',
        sequence: 1,
        categories: [
          AgendaCategory(id: '1', name: 'Planning'),
          AgendaCategory(id: '2', name: 'Development'),
        ],
        urls: ['https://example.com/meeting'],
        attachments: [],
      );

      await tester.pumpWidget(
        themedWidget(
          ExpandableAgendaItemTile(
            item: testItem,
            onEdit: () {},
            onDelete: () {},
          ),
          themeMode: ThemeMode.light,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(ExpandableAgendaItemTile),
        matchesGoldenFile(
          goldenFileName('agenda_item_tile', 'full_data_collapsed', 'light'),
        ),
      );
    });

    testWidgets('agenda_item_tile with full data - dark theme',
        (WidgetTester tester) async {
      final testItem = EventAgendaItem(
        id: '1',
        title: 'Team Planning Meeting',
        description: 'Quarterly planning session for the development team',
        duration: '01:30',
        sequence: 1,
        categories: [
          AgendaCategory(id: '1', name: 'Planning'),
          AgendaCategory(id: '2', name: 'Development'),
        ],
        urls: ['https://example.com/meeting'],
        attachments: [],
      );

      await tester.pumpWidget(
        themedWidget(
          ExpandableAgendaItemTile(
            item: testItem,
            onEdit: () {},
            onDelete: () {},
          ),
          themeMode: ThemeMode.dark,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(ExpandableAgendaItemTile),
        matchesGoldenFile(
          goldenFileName('agenda_item_tile', 'full_data_collapsed', 'dark'),
        ),
      );
    });

    testWidgets('agenda_item_tile expanded state - light theme',
        (WidgetTester tester) async {
      final testItem = EventAgendaItem(
        id: '1',
        title: 'Team Planning Meeting',
        description: 'Quarterly planning session for the development team',
        duration: '01:30',
        sequence: 1,
        categories: [
          AgendaCategory(id: '1', name: 'Planning'),
          AgendaCategory(id: '2', name: 'Development'),
        ],
        urls: ['https://example.com/meeting'],
        attachments: [],
      );

      await tester.pumpWidget(
        themedWidget(
          ExpandableAgendaItemTile(
            item: testItem,
            onEdit: () {},
            onDelete: () {},
          ),
          themeMode: ThemeMode.light,
        ),
      );
      await tester.pumpAndSettle();

      // Tap to expand
      await tester.tap(find.text('Team Planning Meeting'));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(ExpandableAgendaItemTile),
        matchesGoldenFile(
          goldenFileName('agenda_item_tile', 'full_data_expanded', 'light'),
        ),
      );
    });

    testWidgets('agenda_item_tile expanded state - dark theme',
        (WidgetTester tester) async {
      final testItem = EventAgendaItem(
        id: '1',
        title: 'Team Planning Meeting',
        description: 'Quarterly planning session for the development team',
        duration: '01:30',
        sequence: 1,
        categories: [
          AgendaCategory(id: '1', name: 'Planning'),
          AgendaCategory(id: '2', name: 'Development'),
        ],
        urls: ['https://example.com/meeting'],
        attachments: [],
      );

      await tester.pumpWidget(
        themedWidget(
          ExpandableAgendaItemTile(
            item: testItem,
            onEdit: () {},
            onDelete: () {},
          ),
          themeMode: ThemeMode.dark,
        ),
      );
      await tester.pumpAndSettle();

      // Tap to expand
      await tester.tap(find.text('Team Planning Meeting'));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(ExpandableAgendaItemTile),
        matchesGoldenFile(
          goldenFileName('agenda_item_tile', 'full_data_expanded', 'dark'),
        ),
      );
    });

    testWidgets('agenda_item_tile with minimal data - light theme',
        (WidgetTester tester) async {
      final testItem = EventAgendaItem(
        id: '2',
        title: 'Quick Standup',
        duration: '00:15',
        sequence: 2,
        categories: [],
        urls: [],
        attachments: [],
      );

      await tester.pumpWidget(
        themedWidget(
          ExpandableAgendaItemTile(
            item: testItem,
            onEdit: () {},
            onDelete: () {},
          ),
          themeMode: ThemeMode.light,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(ExpandableAgendaItemTile),
        matchesGoldenFile(
          goldenFileName('agenda_item_tile', 'minimal_data', 'light'),
        ),
      );
    });

    testWidgets('agenda_item_tile with long title - light theme',
        (WidgetTester tester) async {
      final testItem = EventAgendaItem(
        id: '3',
        title: 'Very Long Agenda Item Title That Should Wrap to Multiple Lines',
        description:
            'This is a very long description that contains a lot of text to test how the widget handles long content and whether it wraps properly without breaking the layout',
        duration: '02:00',
        sequence: 3,
        categories: [
          AgendaCategory(id: '1', name: 'Category 1'),
          AgendaCategory(id: '2', name: 'Category 2'),
          AgendaCategory(id: '3', name: 'Category 3'),
        ],
        urls: [
          'https://example.com/very-long-url-that-might-need-wrapping',
          'https://another-example.com/url',
        ],
        attachments: [],
      );

      await tester.pumpWidget(
        themedWidget(
          ExpandableAgendaItemTile(
            item: testItem,
            onEdit: () {},
            onDelete: () {},
          ),
          themeMode: ThemeMode.light,
        ),
      );
      await tester.pumpAndSettle();

      // Tap to expand
      await tester.tap(find.text(
        'Very Long Agenda Item Title That Should Wrap to Multiple Lines',
      ));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(ExpandableAgendaItemTile),
        matchesGoldenFile(
          goldenFileName('agenda_item_tile', 'long_content', 'light'),
        ),
      );
    });
  });
}
