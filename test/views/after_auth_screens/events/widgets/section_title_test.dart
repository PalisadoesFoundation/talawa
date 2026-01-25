import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/views/after_auth_screens/events/widgets/section_title.dart';

void main() {
  group('SectionTitle Widget Tests', () {
    Widget createSectionTitle(String title) {
      return MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: const [
          AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: Scaffold(
          body: SectionTitle(title: title),
        ),
      );
    }

    testWidgets('renders with correct title', (tester) async {
      await tester.pumpWidget(createSectionTitle('Test Title'));
      await tester.pumpAndSettle();

      expect(find.text('Test Title'), findsOneWidget);
    });

    testWidgets('applies correct text style', (tester) async {
      await tester.pumpWidget(createSectionTitle('Styled Title'));
      await tester.pumpAndSettle();

      final textWidget = tester.widget<Text>(find.text('Styled Title'));
      expect(textWidget.style?.fontWeight, FontWeight.bold);
    });

    testWidgets('applies correct padding', (tester) async {
      await tester.pumpWidget(createSectionTitle('Padded Title'));
      await tester.pumpAndSettle();

      final paddingWidget = tester.widget<Padding>(
        find.ancestor(
          of: find.text('Padded Title'),
          matching: find.byType(Padding),
        ),
      );
      expect(paddingWidget.padding, const EdgeInsets.only(bottom: 8.0));
    });

    testWidgets('uses theme primary color', (tester) async {
      await tester.pumpWidget(createSectionTitle('Colored Title'));
      await tester.pumpAndSettle();

      final BuildContext context = tester.element(find.text('Colored Title'));
      final textWidget = tester.widget<Text>(find.text('Colored Title'));
      expect(
        textWidget.style?.color,
        Theme.of(context).colorScheme.primary,
      );
    });

    testWidgets('handles empty title', (tester) async {
      await tester.pumpWidget(createSectionTitle(''));
      await tester.pumpAndSettle();

      expect(find.byType(SectionTitle), findsOneWidget);
    });

    testWidgets('handles long title', (tester) async {
      const longTitle =
          'This is a very long title that might wrap to multiple lines';
      await tester.pumpWidget(createSectionTitle(longTitle));
      await tester.pumpAndSettle();

      expect(find.text(longTitle), findsOneWidget);
    });
  });
}
