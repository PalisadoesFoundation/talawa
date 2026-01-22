import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/views/after_auth_screens/events/widgets/info_row.dart';

void main() {
  group('InfoRow Widget Tests', () {
    Widget createInfoRow({
      required IconData icon,
      required String text,
      Widget? trailing,
    }) {
      return MaterialApp(
        home: Scaffold(
          body: InfoRow(
            icon: icon,
            text: text,
            trailing: trailing,
          ),
        ),
      );
    }

    testWidgets('renders with icon and text', (tester) async {
      await tester.pumpWidget(
        createInfoRow(
          icon: Icons.event,
          text: 'Test Event',
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.event), findsOneWidget);
      expect(find.text('Test Event'), findsOneWidget);
    });

    testWidgets('renders with trailing widget', (tester) async {
      await tester.pumpWidget(
        createInfoRow(
          icon: Icons.location_on,
          text: 'Location',
          trailing: const Icon(Icons.arrow_forward),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.location_on), findsOneWidget);
      expect(find.text('Location'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
    });

    testWidgets('renders without trailing widget', (tester) async {
      await tester.pumpWidget(
        createInfoRow(
          icon: Icons.calendar_today,
          text: 'Date',
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.calendar_today), findsOneWidget);
      expect(find.text('Date'), findsOneWidget);
    });

    testWidgets('icon has correct size', (tester) async {
      await tester.pumpWidget(
        createInfoRow(
          icon: Icons.access_time,
          text: 'Time',
        ),
      );
      await tester.pumpAndSettle();

      final iconWidget = tester.widget<Icon>(find.byIcon(Icons.access_time));
      expect(iconWidget.size, 16);
    });

    testWidgets('icon uses theme primary color', (tester) async {
      await tester.pumpWidget(
        createInfoRow(
          icon: Icons.info,
          text: 'Info',
        ),
      );
      await tester.pumpAndSettle();

      final BuildContext context = tester.element(find.text('Info'));
      final iconWidget = tester.widget<Icon>(find.byIcon(Icons.info));
      expect(iconWidget.color, Theme.of(context).colorScheme.primary);
    });

    testWidgets('text has correct style', (tester) async {
      await tester.pumpWidget(
        createInfoRow(
          icon: Icons.description,
          text: 'Description',
        ),
      );
      await tester.pumpAndSettle();

      final BuildContext context = tester.element(find.text('Description'));
      final textWidget = tester.widget<Text>(find.text('Description'));
      expect(textWidget.style, Theme.of(context).textTheme.bodyMedium);
    });

    testWidgets('text is expanded', (tester) async {
      await tester.pumpWidget(
        createInfoRow(
          icon: Icons.text_fields,
          text: 'Expanded Text',
        ),
      );
      await tester.pumpAndSettle();

      expect(
        find.ancestor(
          of: find.text('Expanded Text'),
          matching: find.byType(Expanded),
        ),
        findsOneWidget,
      );
    });

    testWidgets('text has ellipsis overflow', (tester) async {
      await tester.pumpWidget(
        createInfoRow(
          icon: Icons.text_snippet,
          text: 'This is a very long text that should overflow with ellipsis',
        ),
      );
      await tester.pumpAndSettle();

      final textWidget = tester.widget<Text>(
        find.text(
            'This is a very long text that should overflow with ellipsis'),
      );
      expect(textWidget.overflow, TextOverflow.ellipsis);
      expect(textWidget.maxLines, 3);
    });

    testWidgets('has correct spacing between icon and text', (tester) async {
      await tester.pumpWidget(
        createInfoRow(
          icon: Icons.space_bar,
          text: 'Spaced',
        ),
      );
      await tester.pumpAndSettle();

      final sizedBoxes = tester.widgetList<SizedBox>(find.byType(SizedBox));
      expect(sizedBoxes.any((box) => box.width == 8), true);
    });

    testWidgets('handles empty text', (tester) async {
      await tester.pumpWidget(
        createInfoRow(
          icon: Icons.clear,
          text: '',
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(InfoRow), findsOneWidget);
    });
  });
}
