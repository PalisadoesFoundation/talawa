// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/views/after_auth_screens/events/explore_event_dialogue.dart';
import 'package:talawa/widgets/date_time_picker.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

Widget createExploreEventDialog() {
  return MaterialApp(
    localizationsDelegates: [
      const AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    navigatorKey: navigationService.navigatorKey,
    onGenerateRoute: router.generateRoute,
    home: Builder(
      builder: (context) {
        return Container(
          child: TextButton(
            key: const Key('TextButtonKey'),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => const ExploreEventDialog(
                  key: Key('ExploreEventDialog'),
                ),
              );
            },
            child: const Text('EventDialog'),
          ),
        );
      },
    ),
  );
}

void main() {
  DateTime startDate = DateTime.now().toLocal();
  // DateTime _endDate = DateTime.now().add(const Duration(days: 1)).toLocal();
  setUp(() {
    registerServices();
    locator<SizeConfig>().test();
  });

  tearDown(() {
    unregisterServices();
  });

  Future<void> prepareDatePicker(
    WidgetTester tester,
    Future<void> Function(Future<DateTime> date) callback,
  ) async {
    await tester.pumpWidget(createExploreEventDialog());
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('TextButtonKey')));
    final date = customDatePicker(initialDate: startDate);

    await tester.pumpAndSettle();
    expect(find.text(startDate.toString().split(' ')[0]), findsOneWidget);
    await tester.ensureVisible(find.byKey(const Key('StartDateSelector')));
    await tester.tap(find.byKey(const Key('StartDateSelector')));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    callback(date);
  }

  group('Tests for DatePicker', () {
    testWidgets('Testing the OK button', (tester) async {
      await prepareDatePicker(tester, (date) async {
        expect(find.text('OK'), findsOneWidget);
        await tester.tap(find.text('OK'));
        await tester.pumpAndSettle();

        expect(
          (await date).toString().split(' ')[0],
          DateTime.now().toLocal().toString().split(' ')[0],
        );

        expect(
          find.textContaining(
            (await date).toLocal().toString().split(' ')[0],
          ),
          findsOneWidget,
        );
      });
    });
    testWidgets('Testing the Cancel button', (tester) async {
      await prepareDatePicker(tester, (date) async {
        expect(find.text('CANCEL'), findsOneWidget);
        await tester.tap(find.text('CANCEL'));
        await tester.pumpAndSettle();
        expect(
          find.textContaining(
            (await date).toLocal().toString().split(' ')[0],
          ),
          findsOneWidget,
        );
      });
    });

    testWidgets('Changing Date test', (tester) async {
      await prepareDatePicker(tester, (date) async {
        await tester.tap(find.text('10'));
        await tester.pumpAndSettle(const Duration(seconds: 1));
        await tester.tap(find.text('OK'));
        await tester.pumpAndSettle(const Duration(seconds: 1));
        expect(
          (await date).toString().split(' ')[0],
          DateTime(DateTime.now().year, DateTime.now().month, 10)
              .toString()
              .split(' ')[0],
        );
        startDate = await date;
        await tester.pumpAndSettle();
        expect(find.byKey(const Key('TextButtonKey')), findsOneWidget);

        expect(
          startDate,
          DateTime(DateTime.now().year, DateTime.now().month, 10),
        );
      });
    });
  });

  group('Tests for Explore Event Dialogue', () {
    locator.registerSingleton(SizeConfig());

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

      // finding Done Button
      final x = find.text('Done');
      expect(x, findsOneWidget);

      await tester.tap(x);
      expect(find.byKey(const Key('TextButtonKey')), findsOneWidget);
    });
    testWidgets('Tap on StartDateSelector', (tester) async {
      await tester.pumpWidget(createExploreEventDialog());
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('TextButtonKey')));
      await tester.pump();

      await tester.tap(find.byKey(const Key('StartDateSelector')));
      await tester.pump();

      expect(find.byType(CalendarDatePicker), findsOneWidget);

      await tester.tap(find.text('16'));
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();
    });
    testWidgets('Tap on EndDateSelector', (tester) async {
      await tester.pumpWidget(createExploreEventDialog());
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('TextButtonKey')));
      await tester.pump();

      await tester.tap(find.byKey(const Key('EndDateSelector')));
      await tester.pump();

      expect(find.byType(CalendarDatePicker), findsOneWidget);

      await tester.tap(find.text('16'));
      await tester.tap(find.text('OK'));
      await tester.pump();
    });
  });
}
