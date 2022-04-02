import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/views/after_auth_screens/events/explore_event_dialogue.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

Widget createExploreEventDialog() {
  return MaterialApp(
      localizationsDelegates: [
        const AppLocalizationsDelegate(isTest: true),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: router.generateRoute,
      home: Builder(builder: (context) {
        return Container(
            child: TextButton(
                key: const Key('TextButtonKey'),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) => const ExploreEventDialog(
                            key: Key('ExploreEventDialog'),
                          ));
                },
                child: const Text('EventDialog')));
      }));
}

main() {
  group('Tests for Explore Event Dialogue', () {
    locator.registerSingleton(SizeConfig());

    setUp(() {
      registerServices();
      locator<SizeConfig>().test();
      // _startDate = DateTime.now().toLocal();
      // _endDate = DateTime.now().add(const Duration(days: 1)).toLocal();
    });

    tearDown(() {
      unregisterServices();
    });
    testWidgets('Testing Explore Event dialog layout', (tester) async {
      await tester.pumpWidget(createExploreEventDialog());
      await tester.pumpAndSettle();

      expect(find.byType(TextButton), findsOneWidget);
      await tester.tap(find.byKey(const Key('TextButtonKey')));
      await tester.pump();

      expect(find.byType(ExploreEventDialog), findsOneWidget);

      final startDateText = find.text('Start Date');
      expect(startDateText, findsOneWidget);

      final endDateText = find.text('End Date');
      expect(endDateText, findsOneWidget);

      final cancelButtonText = find.text('Cancel');
      expect(cancelButtonText, findsOneWidget);

      final doneButtonText = find.text('Done');
      expect(doneButtonText, findsOneWidget);
    });

    testWidgets('Test for Cancel button', (tester) async {
      await tester.pumpWidget(createExploreEventDialog());
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('TextButtonKey')));
      await tester.pump();
      expect(find.byType(ExploreEventDialog), findsOneWidget);

      final cancelButton = find.byKey(const Key('CancelButton'));
      expect(cancelButton, findsOneWidget);
      await tester.tap(cancelButton);
      await tester.pumpAndSettle();
    });

    testWidgets('Test for Done button', (tester) async {
      await tester.pumpWidget(createExploreEventDialog());
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('TextButtonKey')));
      await tester.pump();

      expect(find.byType(ExploreEventDialog), findsOneWidget);

      final doneButton = find.byKey(const Key('DoneButton'));
      expect(doneButton, findsOneWidget);
    });

    testWidgets('Test for selecting Start Date', (tester) async {
      await tester.pumpWidget(createExploreEventDialog());
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('TextButtonKey')));
      await tester.pump();

      final startDateButton = find.byKey(const Key('StartDateSelector'));
      expect(startDateButton, findsOneWidget);
    });
    testWidgets('Test for selecting End Date', (tester) async {
      await tester.pumpWidget(createExploreEventDialog());
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('TextButtonKey')));
      await tester.pump();

      final endDateButton = find.byKey(const Key('EndDateSelector'));
      expect(endDateButton, findsOneWidget);
    });

    testWidgets('Testing the Cancel button', (tester) async {
      await tester.pumpWidget(createExploreEventDialog());
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('TextButtonKey')));
      await tester.pump();

      // finding Cancel Button
      final x = find.text('Cancel');
      expect(x, findsOneWidget);

      await tester.tap(x);
      expect(find.byKey(const Key('TextButtonKey')), findsOneWidget);
    });
    testWidgets('Testing the Done button', (tester) async {
      await tester.pumpWidget(createExploreEventDialog());
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('TextButtonKey')));
      await tester.pump();

      // finding Cancel Button
      final x = find.text('Done');
      expect(x, findsOneWidget);

      await tester.tap(x);
      expect(find.byKey(const Key('TextButtonKey')), findsOneWidget);
    });
  });
}
