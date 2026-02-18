// ignore_for_file: talawa_api_doc
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/events/agendaItems/event_agenda_item.dart';
import 'package:talawa/models/events/event_agenda_category.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/widgets/agenda_item_tile.dart';

void main() {
  late EventAgendaItem testAgendaItem;
  SizeConfig().test();
  setUp(() {
    testAgendaItem = EventAgendaItem(
      id: '1',
      name: 'Test Agenda Item',
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

    testWidgets('Handles empty lists correctly', (WidgetTester tester) async {
      testAgendaItem = EventAgendaItem(
        id: '1',
        name: 'Test Agenda Item',
        duration: '00:30',
        sequence: 1,
        categories: [],
        attachments: [],
        urls: [],
      );

      await tester.pumpWidget(createExpandableAgendaItemTile());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Test Agenda Item'));
      await tester.pumpAndSettle();

      expect(find.byType(Chip), findsNothing);
      expect(find.text('URLs:'), findsNothing);
      expect(find.text('Attachments:'), findsNothing);
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

    group('Attachment Tests', () {
      const validBase64Image1 =
          "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/wAAAwAB/4JAoQAAAABJRU5ErkJggg==";
      const validBase64Image2 =
          "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/wQACgAB/1TwbpAAAAAASUVORK5CYII=";
      final testAttachments = [
        validBase64Image1,
        validBase64Image2,
      ];
      testWidgets('Attachments Images display correctly',
          (WidgetTester tester) async {
        testAgendaItem = EventAgendaItem(
          id: '1',
          name: 'Test Agenda Item',
          description: 'Test Description',
          duration: '00:30',
          sequence: 1,
          categories: [],
          attachments: testAttachments,
          urls: [],
        );

        await tester.pumpWidget(createExpandableAgendaItemTile());
        await tester.pumpAndSettle();

        await tester.tap(find.text('Test Agenda Item'));
        await tester.pumpAndSettle();

        // Verify attachments header is displayed
        expect(find.text('Attachments:'), findsOneWidget);

        // Verify GridView is displayed
        expect(find.byType(GridView), findsOneWidget);

        // Verify the number of items in the grid
        expect(find.byType(Image), findsNWidgets(testAttachments.length));
      });

      testWidgets('GridView layout properties are correct',
          (WidgetTester tester) async {
        testAgendaItem = EventAgendaItem(
          id: '1',
          name: 'Test Agenda Item',
          description: 'Test Description',
          duration: '00:30',
          sequence: 1,
          categories: [],
          attachments: testAttachments,
          urls: [],
        );

        await tester.pumpWidget(createExpandableAgendaItemTile());
        await tester.pumpAndSettle();

        await tester.tap(find.text('Test Agenda Item'));
        await tester.pumpAndSettle();

        final GridView gridView = tester.widget(find.byType(GridView));
        final SliverGridDelegateWithFixedCrossAxisCount delegate =
            gridView.gridDelegate as SliverGridDelegateWithFixedCrossAxisCount;

        expect(delegate.crossAxisCount, 3);
        expect(delegate.crossAxisSpacing, 10);
        expect(delegate.mainAxisSpacing, 10);
      });

      testWidgets('ClipRRect is applied correctly to valid images',
          (WidgetTester tester) async {
        testAgendaItem = EventAgendaItem(
          id: '1',
          name: 'Test Agenda Item',
          description: 'Test Description',
          duration: '00:30',
          sequence: 1,
          categories: [],
          attachments: testAttachments,
          urls: [],
        );

        await tester.pumpWidget(createExpandableAgendaItemTile());
        await tester.pumpAndSettle();

        await tester.tap(find.text('Test Agenda Item'));
        await tester.pumpAndSettle();

        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is ClipRRect &&
                widget.borderRadius == BorderRadius.circular(8),
          ),
          findsNWidgets(testAttachments.length),
        );
      });

      testWidgets('Fallback icon is displayed for invalid attachments',
          (WidgetTester tester) async {
        final testAttachments = [
          "invalid_base64_data",
        ];

        testAgendaItem = EventAgendaItem(
          id: '1',
          name: 'Test Agenda Item',
          description: 'Test Description',
          duration: '00:30',
          sequence: 1,
          categories: [],
          attachments: testAttachments,
          urls: [],
        );

        await tester.pumpWidget(createExpandableAgendaItemTile());
        await tester.pumpAndSettle();

        await tester.tap(find.text('Test Agenda Item'));
        await tester.pumpAndSettle();

        // Verify Container is displayed and its properties are correct
        find.byWidgetPredicate(
          (widget) =>
              widget is Container &&
              (widget.decoration! as BoxDecoration).borderRadius ==
                  BorderRadius.circular(8),
        );

        // Verify fallback icon is displayed
        expect(find.byIcon(Icons.attachment), findsOneWidget);
      });

      testWidgets('Tap on attachment opens full-screen image view',
          (WidgetTester tester) async {
        testAgendaItem = EventAgendaItem(
          id: '1',
          name: 'Test Agenda Item',
          description: 'Test Description',
          duration: '00:30',
          sequence: 1,
          categories: [],
          attachments: testAttachments,
          urls: [],
        );

        await tester.pumpWidget(createExpandableAgendaItemTile());
        await tester.pumpAndSettle();

        await tester.tap(find.text('Test Agenda Item'));
        await tester.pumpAndSettle();

        // Tap on the first attachment
        await tester.tap(find.byType(Image).first);
        await tester.pumpAndSettle();

        // Verify full-screen image view is displayed
        expect(find.byType(InteractiveViewer), findsOneWidget);

        // Close the dialog
        await tester.tapAt(Offset.zero);
        await tester.pumpAndSettle();

        // Verify the dialog is dismissed
        expect(find.byType(InteractiveViewer), findsNothing);
      });

      testWidgets('verify full-screen image properties',
          (WidgetTester tester) async {
        testAgendaItem = EventAgendaItem(
          id: '1',
          name: 'Test Agenda Item',
          description: 'Test Description',
          duration: '00:30',
          sequence: 1,
          categories: [],
          attachments: testAttachments,
          urls: [],
        );

        await tester.pumpWidget(createExpandableAgendaItemTile());
        await tester.pumpAndSettle();

        await tester.tap(find.text('Test Agenda Item'));
        await tester.pumpAndSettle();

        // Tap on the first attachment
        await tester.tap(find.byType(Image).first);
        await tester.pumpAndSettle();

        // Colored box renders correctly
        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is ColoredBox &&
                widget.color == Colors.black.withAlpha((0.5 * 255).toInt()),
          ),
          findsOneWidget,
        );
        // Interactive viewer properties
        final InteractiveViewer viewer =
            tester.widget(find.byType(InteractiveViewer));
        expect(viewer.panEnabled, isTrue);
        expect(viewer.boundaryMargin, const EdgeInsets.all(20));
        expect(viewer.minScale, 0.5);
        expect(viewer.maxScale, 4);
      });
    });
  });
}
