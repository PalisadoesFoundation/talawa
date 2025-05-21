import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/views/demo_page_view.dart';

void main() {
  group('DemoPageView Widget Tests', () {
    setupLocator();
    testWidgets('DemoPageView displays AppBar title and model title',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: const [
            AppLocalizationsDelegate(isTest: true),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          home: ChangeNotifierProvider<DemoViewModel>(
            create: (_) => DemoViewModel(),
            child: const DemoPageView(key: Key('demo_page_view')),
          ),
        ),
      );

      await tester.pump();

      // Check for AppBar title
      expect(find.text('Demo Page'), findsOneWidget);

      // Check for body text from DemoViewModel
      expect(find.text('Title from the viewMode GSoC branch'), findsOneWidget);
    });

    testWidgets('DemoViewModel returns correct title', (tester) async {
      final model = DemoViewModel();
      expect(model.title, equals('Title from the viewMode GSoC branch'));
    });
  });
}
