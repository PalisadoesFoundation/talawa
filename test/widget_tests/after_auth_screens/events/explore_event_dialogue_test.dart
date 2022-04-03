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
    home: const ExploreEventDialog(
      key: Key('ExploreEventDialog'),
    ),
  );
}

main() {
  group('Tests for Explore Event Dialogue', () {
    late DateTime _startDate;
    late DateTime _endDate;
    locator.registerSingleton(SizeConfig());

    setUp(() {
      registerServices();
      locator<SizeConfig>().test();
      _startDate = DateTime.now();
      _endDate = DateTime.now().add(const Duration(days: 1));
    });

    tearDown(() {
      unregisterServices();
    });
    testWidgets('Testing Explore Event dialog layout', (tester) async {
      await tester.pumpWidget(createExploreEventDialog());
      await tester.pumpAndSettle();
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
      expect(find.byType(ExploreEventDialog), findsOneWidget);

      final cancelButton = find.byKey(const Key('CancelButton'));
      expect(cancelButton, findsOneWidget);
      await tester.tap(cancelButton);
      await tester.pumpAndSettle();
    });

    testWidgets('Test for Done button', (tester) async {
      await tester.pumpWidget(createExploreEventDialog());
      await tester.pumpAndSettle();
      expect(find.byType(ExploreEventDialog), findsOneWidget);

      final doneButton = find.byKey(const Key('DoneButton'));
      expect(doneButton, findsOneWidget);
    });

    testWidgets('Test for selecting Start Date', (tester) async {
      await tester.pumpWidget(createExploreEventDialog());
      await tester.pumpAndSettle();
      expect(find.byType(ExploreEventDialog), findsOneWidget);

      final startDateText = find.text('Start Date');
      expect(startDateText, findsOneWidget);
      expect(
          find.text("${_startDate.toLocal()}".split(' ')[0]), findsOneWidget);
      final startDateButton = find.text(
        "${_startDate.toLocal()}".split(' ')[0],
      );

      expect(startDateButton, findsOneWidget);
    });

    testWidgets('Test for selecting End Date', (tester) async {
      await tester.pumpWidget(createExploreEventDialog());
      await tester.pumpAndSettle();
      expect(find.byType(ExploreEventDialog), findsOneWidget);

      final endDateText = find.text('End Date');
      expect(endDateText, findsOneWidget);
      expect(find.text("${_endDate.toLocal()}".split(' ')[0]), findsOneWidget);
      final endDateButton = find.text(
        "${_endDate.toLocal()}".split(' ')[0],
      );

      expect(endDateButton, findsOneWidget);
    });
  });
}
