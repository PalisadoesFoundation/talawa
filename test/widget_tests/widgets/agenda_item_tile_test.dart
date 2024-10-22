// ignore_for_file: talawa_api_doc
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/events/event_agenda_category.dart';
import 'package:talawa/models/events/event_agenda_item.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/widgets/agenda_item_tile.dart';

void main() {
  late EventAgendaItem testAgendaItem;
  SizeConfig().test();
  setUp(() {
    testAgendaItem = EventAgendaItem(
      id: '1',
      title: 'Test Agenda Item',
      description: 'Test Description',
      duration: '00:30',
      sequence: 1,
      categories: [
        AgendaCategory(id: '1', name: 'Category 1'),
        AgendaCategory(id: '2', name: 'Category 2'),
      ],
      attachments: [],
      urls: ['https://example.com'],
    );
  });

  Widget createExpandableAgendaItemTile() {
    return MaterialApp(
      home: Scaffold(
        body: ExpandableAgendaItemTile(
          item: testAgendaItem,
          onEdit: () {},
          onDelete: () {},
        ),
      ),
    );
  }

  group('ExpandableAgendaItemTile Widget Tests', () {
    testWidgets('ExpandableAgendaItemTile renders correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(createExpandableAgendaItemTile());
      await tester.pumpAndSettle();

      expect(find.byType(ExpandableAgendaItemTile), findsOneWidget);
      expect(find.text('Test Agenda Item'), findsOneWidget);
      expect(find.byIcon(Icons.drag_handle), findsOneWidget);
      expect(find.byIcon(Icons.edit), findsOneWidget);
      expect(find.byIcon(Icons.delete), findsOneWidget);
    });

    testWidgets('Expansion works correctly', (WidgetTester tester) async {
      await tester.pumpWidget(createExpandableAgendaItemTile());
      await tester.pumpAndSettle();

      // Initially, the expanded content should not be visible
      expect(find.text('Description:'), findsNothing);

      // Tap to expand
      await tester.tap(find.text('Test Agenda Item'));
      await tester.pumpAndSettle();

      // Now the expanded content should be visible
      expect(find.text('Description:'), findsOneWidget);
    });

    testWidgets('Categories are displayed correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(createExpandableAgendaItemTile());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Test Agenda Item'));
      await tester.pumpAndSettle();

      expect(find.text('Categories:'), findsOneWidget);
      expect(find.text('Category 1'), findsOneWidget);
      expect(find.text('Category 2'), findsOneWidget);
    });

    testWidgets('URLs are displayed correctly', (WidgetTester tester) async {
      await tester.pumpWidget(createExpandableAgendaItemTile());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Test Agenda Item'));
      await tester.pumpAndSettle();

      expect(find.text('URLs:'), findsOneWidget);
      expect(find.text('https://example.com'), findsOneWidget);
    });

    testWidgets('Edit button calls onEdit callback',
        (WidgetTester tester) async {
      bool editCalled = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ExpandableAgendaItemTile(
              item: testAgendaItem,
              onEdit: () => editCalled = true,
              onDelete: () {},
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.edit));
      await tester.pumpAndSettle();

      expect(editCalled, isTrue);
    });

    testWidgets('Delete button calls onDelete callback',
        (WidgetTester tester) async {
      bool deleteCalled = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ExpandableAgendaItemTile(
              item: testAgendaItem,
              onEdit: () {},
              onDelete: () => deleteCalled = true,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.delete));
      await tester.pumpAndSettle();

      expect(deleteCalled, isTrue);
    });
  });
}
