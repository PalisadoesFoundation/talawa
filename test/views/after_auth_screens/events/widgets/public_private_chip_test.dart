import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/views/after_auth_screens/events/widgets/public_private_chip.dart';

void main() {
  group('PublicPrivateChip Widget Tests', () {
    Widget createPublicPrivateChip({required bool isPublic}) {
      return MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: const [
          AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: Scaffold(
          body: PublicPrivateChip(isPublic: isPublic),
        ),
      );
    }

    group('Public Event', () {
      testWidgets('shows open lock icon for public event', (tester) async {
        await tester.pumpWidget(createPublicPrivateChip(isPublic: true));
        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.lock_open), findsOneWidget);
        expect(find.byIcon(Icons.lock), findsNothing);
      });

      testWidgets('shows "public" text for public event', (tester) async {
        await tester.pumpWidget(createPublicPrivateChip(isPublic: true));
        await tester.pumpAndSettle();

        expect(find.text('public'), findsOneWidget);
      });

      testWidgets('uses secondary color for public event icon', (tester) async {
        await tester.pumpWidget(createPublicPrivateChip(isPublic: true));
        await tester.pumpAndSettle();

        final BuildContext context = tester.element(find.text('public'));
        final iconWidget = tester.widget<Icon>(find.byIcon(Icons.lock_open));
        expect(iconWidget.color, Theme.of(context).colorScheme.secondary);
      });
    });

    group('Private Event', () {
      testWidgets('shows lock icon for private event', (tester) async {
        await tester.pumpWidget(createPublicPrivateChip(isPublic: false));
        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.lock), findsOneWidget);
        expect(find.byIcon(Icons.lock_open), findsNothing);
      });

      testWidgets('shows "private" text for private event', (tester) async {
        await tester.pumpWidget(createPublicPrivateChip(isPublic: false));
        await tester.pumpAndSettle();

        expect(find.text('private'), findsOneWidget);
      });

      testWidgets('uses primary color for private event icon', (tester) async {
        await tester.pumpWidget(createPublicPrivateChip(isPublic: false));
        await tester.pumpAndSettle();

        final BuildContext context = tester.element(find.text('private'));
        final iconWidget = tester.widget<Icon>(find.byIcon(Icons.lock));
        expect(iconWidget.color, Theme.of(context).colorScheme.primary);
      });
    });

    group('Common Properties', () {
      testWidgets('icon has correct size', (tester) async {
        await tester.pumpWidget(createPublicPrivateChip(isPublic: true));
        await tester.pumpAndSettle();

        final iconWidget = tester.widget<Icon>(find.byIcon(Icons.lock_open));
        expect(iconWidget.size, 14);
      });

      testWidgets('text uses bodySmall style', (tester) async {
        await tester.pumpWidget(createPublicPrivateChip(isPublic: true));
        await tester.pumpAndSettle();

        final BuildContext context = tester.element(find.text('public'));
        final textWidget = tester.widget<Text>(find.text('public'));
        expect(textWidget.style, Theme.of(context).textTheme.bodySmall);
      });

      testWidgets('has correct spacing between icon and text', (tester) async {
        await tester.pumpWidget(createPublicPrivateChip(isPublic: true));
        await tester.pumpAndSettle();

        final sizedBoxes = tester.widgetList<SizedBox>(find.byType(SizedBox));
        expect(sizedBoxes.any((box) => box.width == 4), true);
      });

      testWidgets('uses Row with min size', (tester) async {
        await tester.pumpWidget(createPublicPrivateChip(isPublic: true));
        await tester.pumpAndSettle();

        final rowWidget = tester.widget<Row>(find.byType(Row));
        expect(rowWidget.mainAxisSize, MainAxisSize.min);
      });
    });

    group('Edge Cases', () {
      testWidgets('renders correctly when switching from public to private',
          (tester) async {
        await tester.pumpWidget(createPublicPrivateChip(isPublic: true));
        await tester.pumpAndSettle();

        expect(find.text('public'), findsOneWidget);
        expect(find.byIcon(Icons.lock_open), findsOneWidget);

        await tester.pumpWidget(createPublicPrivateChip(isPublic: false));
        await tester.pumpAndSettle();

        expect(find.text('private'), findsOneWidget);
        expect(find.byIcon(Icons.lock), findsOneWidget);
      });
    });
  });
}
