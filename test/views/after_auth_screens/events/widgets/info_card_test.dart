import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/views/after_auth_screens/events/widgets/info_card.dart';

void main() {
  group('InfoCard Widget Tests', () {
    Widget createInfoCard({required List<Widget> children}) {
      return MaterialApp(
        home: Scaffold(
          body: InfoCard(children: children),
        ),
      );
    }

    testWidgets('renders with single child', (tester) async {
      await tester.pumpWidget(
        createInfoCard(
          children: [const Text('Test Child')],
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Test Child'), findsOneWidget);
      expect(find.byType(InfoCard), findsOneWidget);
    });

    testWidgets('renders with multiple children', (tester) async {
      await tester.pumpWidget(
        createInfoCard(
          children: [
            const Text('Child 1'),
            const Text('Child 2'),
            const Text('Child 3'),
          ],
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Child 1'), findsOneWidget);
      expect(find.text('Child 2'), findsOneWidget);
      expect(find.text('Child 3'), findsOneWidget);
    });

    testWidgets('applies correct padding', (tester) async {
      await tester.pumpWidget(
        createInfoCard(children: [const Text('Padded')]),
      );
      await tester.pumpAndSettle();

      final containerWidget = tester.widget<Container>(
        find.ancestor(
          of: find.byType(Column),
          matching: find.byType(Container),
        ),
      );
      expect(containerWidget.padding, const EdgeInsets.all(16));
    });

    testWidgets('has full width', (tester) async {
      await tester.pumpWidget(
        createInfoCard(children: [const Text('Full Width')]),
      );
      await tester.pumpAndSettle();

      final containerWidget = tester.widget<Container>(
        find.ancestor(
          of: find.byType(Column),
          matching: find.byType(Container),
        ),
      );
      expect(containerWidget.constraints?.maxWidth, double.infinity);
    });

    testWidgets('applies border radius', (tester) async {
      await tester.pumpWidget(
        createInfoCard(children: [const Text('Rounded')]),
      );
      await tester.pumpAndSettle();

      final containerWidget = tester.widget<Container>(
        find.ancestor(
          of: find.byType(Column),
          matching: find.byType(Container),
        ),
      );
      final decoration = containerWidget.decoration! as BoxDecoration;
      expect(decoration.borderRadius, BorderRadius.circular(8));
    });

    testWidgets('uses theme card color', (tester) async {
      await tester.pumpWidget(
        createInfoCard(children: [const Text('Themed')]),
      );
      await tester.pumpAndSettle();

      final BuildContext context = tester.element(find.text('Themed'));
      final containerWidget = tester.widget<Container>(
        find.ancestor(
          of: find.byType(Column),
          matching: find.byType(Container),
        ),
      );
      final decoration = containerWidget.decoration! as BoxDecoration;
      expect(decoration.color, Theme.of(context).cardColor);
    });

    testWidgets('handles empty children list', (tester) async {
      await tester.pumpWidget(
        createInfoCard(children: []),
      );
      await tester.pumpAndSettle();

      expect(find.byType(InfoCard), findsOneWidget);
      expect(find.byType(Column), findsOneWidget);
    });

    testWidgets('children are aligned to start', (tester) async {
      await tester.pumpWidget(
        createInfoCard(
          children: [const Text('Aligned')],
        ),
      );
      await tester.pumpAndSettle();

      final columnWidget = tester.widget<Column>(find.byType(Column));
      expect(columnWidget.crossAxisAlignment, CrossAxisAlignment.start);
    });
  });
}
