import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/constants/recurrence_values.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/create_event_view_model.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/after_auth_screens/events/create_event_page.dart';
import 'package:talawa/views/base_view.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

/// Creates a EventScreen for tests.
///
/// **params**:
/// * `themeMode`: ThemeMode
/// * `theme`: ThemeData of App
///
/// **returns**:
/// * `Widget`: Event Screen Widget
Widget createEventScreenForDateTimeTileTesting({
  ThemeMode themeMode = ThemeMode.light,
  required ThemeData theme,
}) =>
    BaseView<AppLanguage>(
      onModelReady: (model) => model.initialize(),
      builder: (context, langModel, child) {
        return MaterialApp(
          locale: const Locale('en'),
          localizationsDelegates: [
            const AppLocalizationsDelegate(isTest: true),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          key: const Key('Root'),
          themeMode: themeMode,
          theme: theme,
          home: const Scaffold(
            body: CreateEventPage(
              key: Key('CreateEventScreenForDateTimetile'),
            ),
          ),
          navigatorKey: navigationService.navigatorKey,
          onGenerateRoute: router.generateRoute,
        );
      },
    );

void main() {
  group('CreateEventPageState dateTimeTile', () {
    late CreateEventViewModel createEventViewModel;
    setUpAll(() {
      SizeConfig().test();
      testSetupLocator();
      registerServices();
    });

    tearDownAll(() {
      unregisterServices();
    });
    setUp(() {
      createEventViewModel = CreateEventViewModel();
    });
    testWidgets('dateUpdater1 shows snackbar for past date',
        (WidgetTester tester) async {
      final DateTime pastDate =
          DateTime.now().subtract(const Duration(days: 1));
      await tester.pumpWidget(
        createEventScreenForDateTimeTileTesting(
          themeMode: ThemeMode.dark,
          theme: TalawaTheme.darkTheme,
        ),
      );
      await tester.pumpAndSettle();

      final switches = find.descendant(
        of: find.byType(Row),
        matching: find.byType(Switch),
      );
      expect(switches, findsNWidgets(3));
      expect((tester.widgetList(switches).toList()[0] as Switch).value, true);
      await tester.ensureVisible(switches.at(0));
      await tester.tap(switches.at(1));

      await tester.pump();
      await tester.tap(find.byKey(const Key('EventDateTimeTileTime')).first);
      await tester.pump();

      final createState = tester.state(
        find.byKey(const Key('CreateEventScreenForDateTimetile')),
      ) as CreateEventPageState;

      createState.dateUpdater1(pastDate, createEventViewModel);

      verify(
        navigationService.showSnackBar(
          "Cannot create events having date prior than today",
        ),
      ).called(1);
      expect(
        createEventViewModel.eventStartDate,
        isNot(pastDate),
      );
    });

    testWidgets('dateUpdater1 updates model for future date',
        (WidgetTester tester) async {
      final DateTime currentDate = DateTime.now().add(const Duration(days: 5));
      await tester.pumpWidget(
        createEventScreenForDateTimeTileTesting(
          themeMode: ThemeMode.dark,
          theme: TalawaTheme.darkTheme,
        ),
      );
      await tester.pumpAndSettle();

      final switches = find.descendant(
        of: find.byType(Row),
        matching: find.byType(Switch),
      );
      expect(switches, findsNWidgets(3));
      expect((tester.widgetList(switches).toList()[0] as Switch).value, true);
      await tester.ensureVisible(switches.at(0));
      await tester.tap(switches.at(1));

      await tester.pump();
      await tester.tap(find.byKey(const Key('EventDateTimeTileTime')).first);
      await tester.pump();

      final createState = tester.state(
        find.byKey(const Key('CreateEventScreenForDateTimetile')),
      ) as CreateEventPageState;

      createState.dateUpdater1(currentDate, createEventViewModel);

      verifyNever(
        navigationService.showSnackBar(
          "Cannot create events having date prior than today",
        ),
      );
      expect(
        createEventViewModel.eventStartDate.toLocal().day,
        currentDate.toLocal().day,
      );
      expect(
        createEventViewModel.recurrenceStartDate.toLocal().day,
        currentDate.toLocal().day,
      );
      expect(
        createEventViewModel.recurrenceLabel,
        'Does not repeat',
      );
      expect(
        createEventViewModel.isRecurring,
        false,
      );
      expect(
        createEventViewModel.frequency,
        Frequency.weekly,
      );
      expect(createEventViewModel.weekDays, isEmpty);
      expect(
        createEventViewModel.weekDayOccurenceInMonth,
        isNull,
      );
    });

    testWidgets('timeUpdater1 updates model if startTime is before endTime',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createEventScreenForDateTimeTileTesting(
          themeMode: ThemeMode.dark,
          theme: TalawaTheme.darkTheme,
        ),
      );
      await tester.pumpAndSettle();

      final switches = find.descendant(
        of: find.byType(Row),
        matching: find.byType(Switch),
      );
      expect(switches, findsNWidgets(3));
      expect((tester.widgetList(switches).toList()[0] as Switch).value, true);
      await tester.ensureVisible(switches.at(0));
      await tester.tap(switches.at(1));

      await tester.pump();
      await tester.tap(find.byKey(const Key('EventDateTimeTileTime')).first);
      await tester.pump();

      final createState = tester.state(
        find.byKey(const Key('CreateEventScreenForDateTimetile')),
      ) as CreateEventPageState;

      const TimeOfDay startTime = TimeOfDay(hour: 9, minute: 0);
      const TimeOfDay endTime = TimeOfDay(hour: 10, minute: 0);
      createEventViewModel.eventEndTime = endTime;

      createState.timeUpdater1(startTime, createEventViewModel);

      verifyNever(
        navigationService.showTalawaErrorSnackBar(
          'Start time must be before end time',
          MessageType.error,
        ),
      );
      expect(
        createEventViewModel.eventStartTime,
        startTime,
      );
    });

    testWidgets(
        'timeUpdater1 shows error snackbar if startTime is after endTime',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createEventScreenForDateTimeTileTesting(
          themeMode: ThemeMode.dark,
          theme: TalawaTheme.darkTheme,
        ),
      );
      await tester.pumpAndSettle();

      final switches = find.descendant(
        of: find.byType(Row),
        matching: find.byType(Switch),
      );
      expect(switches, findsNWidgets(3));
      expect((tester.widgetList(switches).toList()[0] as Switch).value, true);
      await tester.ensureVisible(switches.at(0));
      await tester.tap(switches.at(1));

      await tester.pump();
      await tester.tap(find.byKey(const Key('EventDateTimeTileTime')).first);
      await tester.pump();

      final createState = tester.state(
        find.byKey(const Key('CreateEventScreenForDateTimetile')),
      ) as CreateEventPageState;

      const TimeOfDay startTime = TimeOfDay(hour: 11, minute: 0);
      const TimeOfDay endTime = TimeOfDay(hour: 10, minute: 0);
      createEventViewModel.eventEndTime = endTime;
      final TimeOfDay initialStartTime = createEventViewModel.eventStartTime;

      createState.timeUpdater1(startTime, createEventViewModel);

      verify(
        navigationService.showTalawaErrorSnackBar(
          'Start time must be before end time',
          MessageType.error,
        ),
      ).called(1);
      expect(
        createEventViewModel.eventStartTime,
        initialStartTime,
      );
    });
    testWidgets('dateUpdater2 updates model if endDate is after startDate',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createEventScreenForDateTimeTileTesting(
          themeMode: ThemeMode.dark,
          theme: TalawaTheme.darkTheme,
        ),
      );
      await tester.pumpAndSettle();

      final endDateTile = find.byKey(const Key('key for test cep')).first;
      await tester.ensureVisible(endDateTile);
      await tester.tap(
        find.descendant(
          of: endDateTile,
          matching: find.byKey(const Key('EventDateTimeTileDate')).last,
        ),
      );
      await tester.pump();

      final createState = tester.state(
        find.byKey(const Key('CreateEventScreenForDateTimetile')),
      ) as CreateEventPageState;

      final DateTime endDate = DateTime.now().add(const Duration(days: 3));

      createState.dateUpdater2(endDate, createEventViewModel);

      verifyNever(
        navigationService.showSnackBar(
          "End Date cannot be after start date",
        ),
      );
      expect(
        createEventViewModel.eventEndDate.toLocal().day,
        endDate.toLocal().day,
      );
    });

    testWidgets(
        'dateUpdater2 shows error snackbar if endDate is before startDate',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createEventScreenForDateTimeTileTesting(
          themeMode: ThemeMode.dark,
          theme: TalawaTheme.darkTheme,
        ),
      );
      await tester.pumpAndSettle();

      final endDateTile = find.byKey(const Key('key for test cep')).first;
      await tester.ensureVisible(endDateTile);
      await tester.tap(
        find.descendant(
          of: endDateTile,
          matching: find.byKey(const Key('EventDateTimeTileDate')).last,
        ),
      );
      await tester.pump();

      final createState = tester.state(
        find.byKey(const Key('CreateEventScreenForDateTimetile')),
      ) as CreateEventPageState;

      final DateTime endDate = DateTime.now().subtract(const Duration(days: 5));
      final DateTime initialEndDate = createEventViewModel.eventEndDate;

      createState.dateUpdater2(endDate, createEventViewModel);

      verify(
        navigationService.showSnackBar(
          "End Date cannot be after start date",
        ),
      ).called(1);
      expect(
        createEventViewModel.eventEndDate,
        initialEndDate,
      );
    });
    testWidgets('timeUpdater2 updates model if endTime is after startTime',
        (WidgetTester tester) async {
      createEventViewModel.eventStartTime = const TimeOfDay(hour: 9, minute: 0);
      createEventViewModel.eventEndTime = const TimeOfDay(hour: 10, minute: 0);

      await tester.pumpWidget(
        createEventScreenForDateTimeTileTesting(
          themeMode: ThemeMode.dark,
          theme: TalawaTheme.darkTheme,
        ),
      );
      await tester.pumpAndSettle();

      final endDateTile = find.byKey(const Key('key for test cep')).first;
      await tester.ensureVisible(endDateTile);
      await tester.tap(
        find.descendant(
          of: endDateTile,
          matching: find.byKey(const Key('EventDateTimeTileDate')).last,
        ),
      );
      await tester.pump();

      final createState = tester.state(
        find.byKey(const Key('CreateEventScreenForDateTimetile')),
      ) as CreateEventPageState;

      const TimeOfDay endTime = TimeOfDay(hour: 11, minute: 0);

      createState.timeUpdater2(endTime, createEventViewModel);

      verifyNever(
        navigationService.showTalawaErrorSnackBar(
          'Start time must be before end time',
          MessageType.error,
        ),
      );
      expect(createEventViewModel.eventEndTime, endTime);
    });

    testWidgets(
        'timeUpdater2 shows error snackbar if endTime is before startTime',
        (WidgetTester tester) async {
      createEventViewModel.eventStartTime = const TimeOfDay(hour: 9, minute: 0);
      createEventViewModel.eventEndTime = const TimeOfDay(hour: 10, minute: 0);

      await tester.pumpWidget(
        createEventScreenForDateTimeTileTesting(
          themeMode: ThemeMode.dark,
          theme: TalawaTheme.darkTheme,
        ),
      );
      await tester.pumpAndSettle();

      final endDateTile = find.byKey(const Key('key for test cep')).first;
      await tester.ensureVisible(endDateTile);
      await tester.tap(
        find.descendant(
          of: endDateTile,
          matching: find.byKey(const Key('EventDateTimeTileDate')).last,
        ),
      );
      await tester.pump();

      final createState = tester.state(
        find.byKey(const Key('CreateEventScreenForDateTimetile')),
      ) as CreateEventPageState;

      const TimeOfDay endTime = TimeOfDay(hour: 8, minute: 0);
      final TimeOfDay initialEndTime = createEventViewModel.eventEndTime;

      createState.timeUpdater2(endTime, createEventViewModel);

      verify(
        navigationService.showTalawaErrorSnackBar(
          'Start time must be before end time',
          MessageType.error,
        ),
      ).called(1);
      expect(createEventViewModel.eventEndTime, initialEndTime);
    });
  });
}
