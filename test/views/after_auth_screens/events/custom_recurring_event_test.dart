import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/constants/recurrence_utils.dart';
import 'package:talawa/constants/recurrence_values.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/create_event_view_model.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/after_auth_screens/events/custom_recurring_event.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/custom_weekday_selector.dart';
import 'package:talawa/widgets/recurring_event_helper_widgets.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

/// Creates a EventScreen for tests.
///
/// **params**:
/// * `themeMode`: ThemeMode
/// * `theme`: ThemeData of App
/// * `model`: CreateEventViewModel
///
/// **returns**:
/// * `Widget`: Event Screen Widget
Widget createCustomRecurrenceScreen({
  ThemeMode themeMode = ThemeMode.light,
  required ThemeData theme,
  CreateEventViewModel? model,
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
          home: Scaffold(
            body: CustomRecurringEvent(
              model: model ?? CreateEventViewModel(),
            ),
          ),
          navigatorKey: navigationService.navigatorKey,
          onGenerateRoute: router.generateRoute,
        );
      },
    );

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    SizeConfig().test();
    testSetupLocator();
    getAndRegisterNavigationService();
  });

  // setUp(() {
  //   registerServices();
  // });

  // tearDown(() {
  //   unregisterServices();
  // });

  group("RecurrenceUtils Tests", () {
    test("getRecurrenceRuleText for all frequency types with intervals", () {
      // Daily
      expect(
        RecurrenceUtils.getRecurrenceRuleText(
          frequency: Frequency.daily,
          interval: 2,
          weekDays: {},
          never: true,
        ),
        'Every 2 days',
      );
      expect(
        RecurrenceUtils.getRecurrenceRuleText(
          frequency: Frequency.daily,
          interval: 1,
          weekDays: {},
          never: true,
        ),
        'Daily',
      );

      // Weekly
      expect(
        RecurrenceUtils.getRecurrenceRuleText(
          frequency: Frequency.weekly,
          interval: 2,
          weekDays: {WeekDays.monday, WeekDays.friday},
          never: true,
        ),
        'Every 2 weeks on Monday, Friday',
      );
      expect(
        RecurrenceUtils.getRecurrenceRuleText(
          frequency: Frequency.weekly,
          interval: 1,
          weekDays: {WeekDays.monday},
          never: true,
        ),
        'Weekly on Monday',
      );

      // Monthly - by day
      expect(
        RecurrenceUtils.getRecurrenceRuleText(
          frequency: Frequency.monthly,
          interval: 2,
          weekDays: {},
          byMonthDay: [15],
          never: true,
        ),
        'Every 2 months on day 15',
      );

      // Monthly - by weekday position
      expect(
        RecurrenceUtils.getRecurrenceRuleText(
          frequency: Frequency.monthly,
          interval: 1,
          weekDays: {WeekDays.monday},
          useDayOfWeekMonthly: true,
          byPosition: 2,
          never: true,
        ),
        'Monthly on the 2 nd Monday',
      );

      // Yearly - by day
      expect(
        RecurrenceUtils.getRecurrenceRuleText(
          frequency: Frequency.yearly,
          interval: 3,
          weekDays: {},
          byMonth: [1],
          byMonthDay: [1],
          never: true,
        ),
        'Every 3 years in January on day 1',
      );

      // Yearly - by weekday position
      expect(
        RecurrenceUtils.getRecurrenceRuleText(
          frequency: Frequency.yearly,
          interval: 1,
          weekDays: {WeekDays.thursday},
          byMonth: [11],
          useDayOfWeekYearly: true,
          byPosition: 4,
          never: true,
        ),
        'Yearly in November on the 4 th Thursday',
      );
    });

    test("getRecurrenceRuleText with end conditions", () {
      // With count
      expect(
        RecurrenceUtils.getRecurrenceRuleText(
          frequency: Frequency.daily,
          interval: 1,
          weekDays: {},
          count: 10,
          never: false,
        ),
        'Daily, 10 times',
      );

      // With end date
      final endDate = DateTime(2025, 12, 31);
      final ruleText = RecurrenceUtils.getRecurrenceRuleText(
        frequency: Frequency.weekly,
        interval: 1,
        weekDays: {WeekDays.monday},
        endDate: endDate,
        never: false,
      );
      expect(ruleText, contains('Weekly on Monday, until'));
      expect(ruleText, contains('Dec 31, 2025'));
    });

    test('weekday occurrence and last occurrence detection', () {
      // First occurrence
      final firstMonday = DateTime(2022, 1, 3);
      expect(RecurrenceUtils.getWeekDayOccurrenceInMonth(firstMonday), 1);

      // Second occurrence
      final secondMonday = DateTime(2022, 1, 10);
      expect(RecurrenceUtils.getWeekDayOccurrenceInMonth(secondMonday), 2);

      // Last occurrence check - true cases
      expect(
        RecurrenceUtils.isLastOccurrenceOfWeekDay(DateTime(2022, 1, 31)),
        true,
      ); // Last Monday of January 2022
      expect(
        RecurrenceUtils.isLastOccurrenceOfWeekDay(DateTime(2022, 8, 29)),
        true,
      ); // Last Monday of August 2022

      // Last occurrence check - false cases
      expect(
        RecurrenceUtils.isLastOccurrenceOfWeekDay(DateTime(2022, 1, 24)),
        false,
      );
      expect(
        RecurrenceUtils.isLastOccurrenceOfWeekDay(DateTime(2022, 1, 10)),
        false,
      );
    });

    test('day suffix generation', () {
      expect(RecurrenceUtils.getDaySuffix(1), 'st');
      expect(RecurrenceUtils.getDaySuffix(2), 'nd');
      expect(RecurrenceUtils.getDaySuffix(3), 'rd');
      expect(RecurrenceUtils.getDaySuffix(4), 'th');
      expect(RecurrenceUtils.getDaySuffix(11), 'th');
      expect(RecurrenceUtils.getDaySuffix(21), 'st');
      expect(RecurrenceUtils.getDaySuffix(22), 'nd');
      expect(RecurrenceUtils.getDaySuffix(23), 'rd');
    });
  });
  group('Custom Recurrence Page Widget Tests', () {
    testWidgets('Page renders with correct UI elements', (tester) async {
      await tester.pumpWidget(
        createCustomRecurrenceScreen(
          theme: TalawaTheme.darkTheme,
        ),
      );
      await tester.pumpAndSettle();

      // AppBar
      expect(find.byType(AppBar), findsOne);
      expect(find.text('Custom recurrence'), findsOneWidget);
      expect(find.text('Done'), findsOneWidget);

      // Dividers
      expect(find.byType(Divider), findsAtLeast(1));

      // Section headings
      expect(find.text("Repeats every"), findsOne);
      expect(find.text("Ends"), findsOne);

      // Input fields - only 1 CustomRectangle (for frequency dropdown)
      expect(find.byType(CustomRectangle), findsOne);
      expect(find.byType(CustomTextField), findsAtLeast(1));
    });

    testWidgets(
        'Frequency dropdown switches between daily, weekly, monthly, yearly',
        (tester) async {
      final model = CreateEventViewModel();
      await tester.pumpWidget(
        createCustomRecurrenceScreen(
          theme: TalawaTheme.darkTheme,
          model: model,
        ),
      );
      await tester.pumpAndSettle();

      final popupMenuButton = find.byType(PopupMenuButton<String>).first;

      // Initial state should be weekly (default)
      expect(find.text("weekly"), findsOne);

      // Switch to daily
      await tester.tap(popupMenuButton);
      await tester.pumpAndSettle();
      expect(find.text("daily"), findsOne);
      await tester.tap(find.text("daily"));
      await tester.pumpAndSettle();
      expect(model.frequency, Frequency.daily);
      expect(model.weekDays, isEmpty);

      // Switch to weekly
      await tester.tap(popupMenuButton);
      await tester.pumpAndSettle();
      await tester.tap(find.text("weekly"));
      await tester.pumpAndSettle();
      expect(model.frequency, Frequency.weekly);
      expect(model.weekDays, isNotEmpty); // Should initialize with current day

      // Switch to monthly
      await tester.tap(popupMenuButton);
      await tester.pumpAndSettle();
      await tester.tap(find.text("monthly"));
      await tester.pumpAndSettle();
      expect(model.frequency, Frequency.monthly);

      // Switch to yearly
      await tester.tap(popupMenuButton);
      await tester.pumpAndSettle();
      await tester.tap(find.text("yearly"));
      await tester.pumpAndSettle();
      expect(model.frequency, Frequency.yearly);
    });

    testWidgets('Interval text field accepts and limits input', (tester) async {
      final model = CreateEventViewModel();
      await tester.pumpWidget(
        createCustomRecurrenceScreen(
          theme: TalawaTheme.darkTheme,
          model: model,
        ),
      );
      await tester.pumpAndSettle();

      final textField = find.byType(CustomTextField).first;

      // Enter valid input
      await tester.enterText(textField, "23");
      await tester.pumpAndSettle();
      expect(find.text("23"), findsOne);

      // Test limit (should only accept 2 digits)
      await tester.enterText(textField, "235");
      await tester.pumpAndSettle();
      expect(find.text("23"), findsOne);
    });

    testWidgets('Weekly frequency shows weekday selector', (tester) async {
      final model = CreateEventViewModel();
      await tester.pumpWidget(
        createCustomRecurrenceScreen(
          theme: TalawaTheme.darkTheme,
          model: model,
        ),
      );
      await tester.pumpAndSettle();

      // Should show "Repeats on" heading and weekday selector for weekly
      expect(find.text("Repeats on"), findsOne);
    });

    testWidgets('Monthly frequency shows day and weekday options',
        (tester) async {
      final model = CreateEventViewModel();
      model.eventStartDate = DateTime(2023, 2, 15); // 3rd Wednesday
      await tester.pumpWidget(
        createCustomRecurrenceScreen(
          theme: TalawaTheme.darkTheme,
          model: model,
        ),
      );
      await tester.pumpAndSettle();

      // Switch to monthly
      final popupMenuButton = find.byType(PopupMenuButton<String>).first;
      await tester.tap(popupMenuButton);
      await tester.pumpAndSettle();
      await tester.tap(find.text("monthly"));
      await tester.pumpAndSettle();

      // Should show both radio options (weekday names are in uppercase like "MONDAY")
      expect(find.text('Monthly options'), findsOne);
      expect(find.text('On day 15 of the month'), findsOne);
      expect(find.textContaining('WEDNESDAY'), findsOne);
      expect(find.textContaining('of the month'), findsAtLeast(1));

      // Test selecting day of week option
      await tester.tap(find.textContaining('WEDNESDAY').first);
      await tester.pumpAndSettle();
      expect(model.useDayOfWeekMonthly, true);
      expect(model.weekDays, isNotEmpty);
      expect(model.byPosition, 3);

      // Test selecting day of month option
      await tester.tap(find.text('On day 15 of the month'));
      await tester.pumpAndSettle();
      expect(model.useDayOfWeekMonthly, false);
      expect(model.byMonthDay, [15]);
    });

    testWidgets('Yearly frequency shows date and weekday options',
        (tester) async {
      final model = CreateEventViewModel();
      model.eventStartDate = DateTime(2023, 11, 23); // 4th Thursday of November
      await tester.pumpWidget(
        createCustomRecurrenceScreen(
          theme: TalawaTheme.darkTheme,
          model: model,
        ),
      );
      await tester.pumpAndSettle();

      // Switch to yearly
      final popupMenuButton = find.byType(PopupMenuButton<String>).first;
      await tester.tap(popupMenuButton);
      await tester.pumpAndSettle();
      await tester.tap(find.text("yearly"));
      await tester.pumpAndSettle();

      // Should show both radio options (weekday names are uppercase)
      expect(find.text('Yearly options'), findsOne);
      expect(find.text('On November 23'), findsOne);
      expect(find.textContaining('THURSDAY'), findsOne);
      expect(find.textContaining('November'), findsAtLeast(1));

      // Test selecting weekday option
      await tester.tap(find.textContaining('THURSDAY').first);
      await tester.pumpAndSettle();
      expect(model.useDayOfWeekYearly, true);
      expect(model.byPosition, 4);
      expect(model.byMonth, [11]);

      // Test selecting date option
      await tester.tap(find.text('On November 23'));
      await tester.pumpAndSettle();
      expect(model.useDayOfWeekYearly, false);
      expect(model.byMonthDay, [23]);
      expect(model.byMonth, [11]);
    });

    testWidgets('Event end options work correctly', (tester) async {
      final model = CreateEventViewModel();
      await tester.pumpWidget(
        createCustomRecurrenceScreen(
          theme: TalawaTheme.darkTheme,
          model: model,
        ),
      );
      await tester.pumpAndSettle();

      // Test 'never' option (capitalized)
      await tester.tap(find.text('Never'));
      await tester.pumpAndSettle();
      expect(model.eventEndType, EventEndTypes.never);
      expect(model.recurrenceEndDate, null);
      expect(model.never, true);

      // Test 'on' option with date picker
      await tester.tap(find.text('On'));
      await tester.pumpAndSettle();
      expect(model.eventEndType, EventEndTypes.on);
      expect(model.never, false);

      // Date should be auto-set to 30 days from now when 'On' is selected
      expect(model.recurrenceEndDate, isNotNull);

      // Test 'after' option
      await tester.tap(find.text('After'));
      await tester.pumpAndSettle();
      expect(model.eventEndType, EventEndTypes.after);
      expect(model.never, false);

      // Test occurrence input field exists and has default value
      final occurrenceField = find.widgetWithText(TextField, '10');
      expect(occurrenceField, findsOne);
    });

    testWidgets('CustomWeekDaySelector handles selection', (tester) async {
      final model = CreateEventViewModel();
      model.weekDays = {};

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomWeekDaySelector(model: model),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Initially no weekdays selected
      expect(model.weekDays, isEmpty);

      // Select Sunday (S)
      await tester.tap(find.text("S").first);
      await tester.pumpAndSettle();
      expect(model.weekDays, contains(WeekDays.sunday));

      // Select Monday (M)
      await tester.tap(find.text("M"));
      await tester.pumpAndSettle();
      expect(model.weekDays, contains(WeekDays.monday));

      // Deselect Sunday
      await tester.tap(find.text("S").first);
      await tester.pumpAndSettle();
      expect(model.weekDays, isNot(contains(WeekDays.sunday)));
      expect(model.weekDays, contains(WeekDays.monday));
    });

    testWidgets('Done button validates and saves configuration',
        (tester) async {
      final model = CreateEventViewModel();
      await tester.pumpWidget(
        createCustomRecurrenceScreen(
          theme: TalawaTheme.darkTheme,
          model: model,
        ),
      );
      await tester.pumpAndSettle();

      // Set interval
      final intervalField = find.byType(CustomTextField).first;
      await tester.enterText(intervalField, "2");
      await tester.pumpAndSettle();

      // Tap the dropdown button first to open the menu
      final popupMenuButton = find.byType(PopupMenuButton<String>).first;
      await tester.tap(popupMenuButton);
      await tester.pumpAndSettle();

      // Now select weekly from the menu
      final weeklyMenuItem = find.text("weekly").last;
      await tester.tap(weeklyMenuItem);
      await tester.pumpAndSettle();

      // Set end type to 'After' with count
      await tester.tap(find.text('After'));
      await tester.pumpAndSettle();

      // Tap Done
      await tester.tap(find.text('Done'));
      await tester.pumpAndSettle();

      // Model should have correct values
      expect(model.interval, 2);
      expect(model.frequency, Frequency.weekly);
      expect(model.isRecurring, true);
    });

    testWidgets('Last occurrence detection in monthly options', (tester) async {
      final model = CreateEventViewModel();
      model.eventStartDate = DateTime(2023, 2, 28); // Last Tuesday of Feb
      await tester.pumpWidget(
        createCustomRecurrenceScreen(
          theme: TalawaTheme.darkTheme,
          model: model,
        ),
      );
      await tester.pumpAndSettle();

      // Switch to monthly
      final popupMenuButton = find.byType(PopupMenuButton<String>).first;
      await tester.tap(popupMenuButton);
      await tester.pumpAndSettle();
      await tester.tap(find.text("monthly"));
      await tester.pumpAndSettle();

      // Should show "last" option (weekday names are uppercase)
      expect(find.textContaining('last'), findsOne);
      expect(find.textContaining('TUESDAY'), findsOne);
      expect(find.textContaining('of the month'), findsAtLeast(1));

      // Select the last occurrence option
      await tester.tap(find.textContaining('last'));
      await tester.pumpAndSettle();
      expect(model.byPosition, -1);
    });
  });
}
