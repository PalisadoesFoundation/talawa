import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/constants/recurrence_values.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/create_event_view_model.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/after_auth_screens/events/custom_recurring_event.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/recurring_event_helper_widgets.dart';
import 'package:talawa/widgets/custom_weekday_selector.dart';

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
            body: CustomRecurrencePage(
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

  group("RecurrenceUtils", () {
    test("getRecurrenceRuleText for Frequency Daily", () {
      final ruleText = RecurrenceUtils.getRecurrenceRuleText(
        Frequency.daily,
        null,
        2,
        null,
        null,
        DateTime(2024, 1, 1),
        null,
      );
      expect(ruleText, 'Every 2 days');

      final ruleText2 = RecurrenceUtils.getRecurrenceRuleText(
        Frequency.daily,
        null,
        1,
        null,
        null,
        DateTime(2024, 1, 1),
        null,
      );
      expect(ruleText2, 'Daily');
    });

    test("getRecurrenceRuleText for Frequency Weekly", () {
      final ruleText = RecurrenceUtils.getRecurrenceRuleText(
        Frequency.weekly,
        {'MONDAY'},
        2,
        null,
        null,
        DateTime(2024, 1, 1),
        null,
      );
      expect(ruleText, 'Every 2 weeks on Monday');

      final ruleText2 = RecurrenceUtils.getRecurrenceRuleText(
        Frequency.weekly,
        {'MONDAY'},
        1,
        null,
        null,
        DateTime(2024, 1, 1),
        null,
      );
      expect(ruleText2, 'Weekly on Monday');
    });

    test("getRecurrenceRuleText for Frequency Monthly", () {
      final ruleText = RecurrenceUtils.getRecurrenceRuleText(
        Frequency.monthly,
        null,
        2,
        null,
        2,
        DateTime(2024, 1, 1),
        null,
      );
      expect(ruleText, 'Every 2 months on Second Monday');

      final ruleText2 = RecurrenceUtils.getRecurrenceRuleText(
        Frequency.monthly,
        null,
        1,
        null,
        null,
        DateTime(2024, 1, 1),
        null,
      );
      expect(ruleText2, 'Monthly on Day 1');
    });

    test("getRecurrenceRuleText for Frequency Yearly", () {
      final ruleText = RecurrenceUtils.getRecurrenceRuleText(
        Frequency.yearly,
        null,
        3,
        null,
        null,
        DateTime(2024, 1, 1),
        null,
      );
      expect(ruleText, 'Every 3 years on January 1');

      final ruleText2 = RecurrenceUtils.getRecurrenceRuleText(
        Frequency.yearly,
        null,
        1,
        null,
        null,
        DateTime(2024, 1, 1),
        null,
      );
      expect(ruleText2, 'Annually on January 1');
    });

    test('getWeekDaysString formats string correctly', () {
      final weekDaysString = RecurrenceUtils.getWeekDaysString([
        WeekDays.monday,
        WeekDays.tuesday,
        WeekDays.wednesday,
      ]);
      expect(weekDaysString, 'Monday, Tuesday & Wednesday');
    });

    test('isLastOccurenceOfWeekDay returns true for last occurrence', () {
      final date = DateTime(2022, 1, 31); // Last Monday of January 2022
      final isLastOccurrence = RecurrenceUtils.isLastOccurenceOfWeekDay(date);
      expect(isLastOccurrence, true);
    });

    test('isLastOccurenceOfWeekDay returns false for not last occurrence', () {
      final date = DateTime(2022, 1, 24); // Not the last Monday of January 2022
      final isLastOccurrence = RecurrenceUtils.isLastOccurenceOfWeekDay(date);
      expect(isLastOccurrence, false);
    });

    test(
        'isLastOccurenceOfWeekDay iterates through multiple days to find last occurrence',
        () {
      final date = DateTime(2022, 8, 29); // Last Monday of August 2022
      final isLastOccurrence = RecurrenceUtils.isLastOccurenceOfWeekDay(date);
      expect(isLastOccurrence, true); // 29th August is the last Monday
    });

    test('isLastOccurenceOfWeekDay iterates and adjusts last occurrence', () {
      final date = DateTime(2022, 3, 28); // Last Monday of March 2022
      final isLastOccurrence = RecurrenceUtils.isLastOccurenceOfWeekDay(date);
      expect(isLastOccurrence, true); // 28th March is the last Monday
    });
  });
  group('Test custom recurrence page.', () {
    testWidgets('Appbar is being rendered as expected.', (tester) async {
      await tester.pumpWidget(
        createCustomRecurrenceScreen(
          theme: TalawaTheme.darkTheme,
        ),
      );
      await tester.pumpAndSettle();
      final appBarFinder = find.byType(AppBar);

      expect(appBarFinder, findsOne);
      expect(find.text('Custom recurrence'), findsOneWidget);
      expect(find.text('Done'), findsOneWidget);
    });

    testWidgets('Custom divider widget.', (tester) async {
      await tester.pumpWidget(
        createCustomRecurrenceScreen(
          theme: TalawaTheme.darkTheme,
        ),
      );
      await tester.pump();
      final customDividerFinder = find.byType(Divider);
      expect(customDividerFinder, findsNWidgets(2));
    });

    testWidgets('Custom inpurFieldHeading widgets.', (tester) async {
      await tester.pumpWidget(
        createCustomRecurrenceScreen(
          theme: TalawaTheme.darkTheme,
        ),
      );
      await tester.pump();

      expect(find.text("Repeats every"), findsOne);
      expect(find.text("Repeats on"), findsOne);
      expect(find.text("Ends"), findsOne);
    });

    testWidgets('CustomRectangle & CustomTextField widgets.', (tester) async {
      await tester.pumpWidget(
        createCustomRecurrenceScreen(
          theme: TalawaTheme.darkTheme,
        ),
      );
      await tester.pump();

      final customRectangleFinder = find.byType(CustomRectangle);
      final customTextFieldFinder = find.byType(CustomTextField);

      expect(customRectangleFinder, findsNWidgets(2));
      expect(customTextFieldFinder, findsNWidgets(2));
    });

    testWidgets('Check functionality of Interval Frequency', (tester) async {
      final model = CreateEventViewModel();
      await tester.pumpWidget(
        createCustomRecurrenceScreen(
          theme: TalawaTheme.darkTheme,
          model: model,
        ),
      );
      await tester.pump();

      // Test text field.
      final inputsection1TextField =
          find.byKey(const Key('inputsection1TextField'));

      await tester.enterText(inputsection1TextField, "23");
      await tester.pumpAndSettle();

      expect(find.text("23"), findsOne);

      await tester.enterText(inputsection1TextField, "235");
      await tester.pumpAndSettle();

      // Testing the limit is set to 2.
      expect(find.text("23"), findsOne);

      // Test RecurrenceFrequencyDropdown
      expect(find.text("week"), findsOne);

      final popupMenuButton = find.byType(PopupMenuButton<String>).first;

      await tester.tap(popupMenuButton);
      await tester.pumpAndSettle();

      expect(find.text("day"), findsOne);
      expect(find.text("month"), findsOne);
      expect(find.text("year"), findsOne);

      // check functionality of interval frequency day
      await tester.tap(find.text(EventIntervals.daily));
      await tester.pumpAndSettle();

      expect(model.frequency, Frequency.daily);
      expect(model.recurrenceInterval, EventIntervals.daily);
      expect(model.weekDayOccurenceInMonth, null);
      expect(model.weekDays, []);

      // check functionality of interval frequency week
      await tester.tap(popupMenuButton);
      await tester.pumpAndSettle();
      await tester.tap(find.text(EventIntervals.weekly));
      await tester.pumpAndSettle();

      expect(model.frequency, Frequency.weekly);
      expect(model.recurrenceInterval, EventIntervals.weekly);
      expect(model.weekDayOccurenceInMonth, null);
      expect(model.weekDays, []);

      // check functionality of interval frequency week
      await tester.tap(popupMenuButton);
      await tester.pumpAndSettle();
      await tester.tap(find.text(EventIntervals.monthly));
      await tester.pumpAndSettle();

      expect(model.frequency, Frequency.monthly);
      expect(model.recurrenceInterval, EventIntervals.monthly);
      expect(model.weekDayOccurenceInMonth, null);
      expect(model.weekDays, []);

      // check functionality of interval frequency year
      await tester.tap(popupMenuButton);
      await tester.pumpAndSettle();
      await tester.tap(find.text(EventIntervals.yearly));
      await tester.pumpAndSettle();

      expect(model.frequency, Frequency.yearly);
      expect(model.recurrenceInterval, EventIntervals.yearly);
      expect(model.weekDayOccurenceInMonth, null);
      expect(model.weekDays, []);
    });

    testWidgets("Dropdown for Monthly frequency", (tester) async {
      final model = CreateEventViewModel();
      model.recurrenceStartDate = DateTime(2023, 02, 28);
      await tester.pumpWidget(
        createCustomRecurrenceScreen(
          theme: TalawaTheme.darkTheme,
          model: model,
        ),
      );
      await tester.pump();

      final frequencyDropdown = find.byType(PopupMenuButton<String>).first;
      await tester.tap(frequencyDropdown);
      await tester.pumpAndSettle();

      expect(find.text("day"), findsOne);
      expect(find.text("month"), findsOne);
      expect(find.text("year"), findsOne);

      // select interval frequency as month
      await tester.tap(find.text("month"));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(PopupMenuButton<String>).last);
      await tester.pumpAndSettle();

      // check all the functionality of dropdown option shown on isLastDayOccurence is true (monthlyOption[2])
      final monthlyRecurrenceLabel1 = RecurrenceUtils.getRecurrenceRuleText(
        Frequency.monthly,
        {
          RecurrenceUtils.weekDays[model.recurrenceStartDate.weekday - 1],
        },
        int.parse(model.repeatsEveryCountController.text),
        int.parse(model.endOccurenceController.text),
        -1,
        model.recurrenceStartDate,
        model.recurrenceEndDate,
      );
      expect(
        find.text(monthlyRecurrenceLabel1),
        findsOne,
      );

      await tester.tap(find.text(monthlyRecurrenceLabel1));
      await tester.pumpAndSettle();

      expect(model.frequency, Frequency.monthly);
      expect(model.recurrenceLabel, monthlyRecurrenceLabel1);
      expect(model.weekDayOccurenceInMonth, -1);
      expect(model.weekDays, {
        RecurrenceUtils.weekDays[model.recurrenceStartDate.weekday - 1],
      });

      // check all the functionality of dropdown option shown when weekDayOccurence~=5 (monthlyOption[1])
      await tester.tap(find.byType(PopupMenuButton<String>).last);
      await tester.pumpAndSettle();

      final monthlyRecurrenceLabel2 = RecurrenceUtils.getRecurrenceRuleText(
        Frequency.monthly,
        {
          RecurrenceUtils.weekDays[model.recurrenceStartDate.weekday - 1],
        },
        int.parse(model.repeatsEveryCountController.text),
        int.parse(model.endOccurenceController.text),
        RecurrenceUtils.getWeekDayOccurenceInMonth(
          model.recurrenceStartDate,
        ),
        model.recurrenceStartDate,
        model.recurrenceEndDate,
      );
      expect(
        find.text(monthlyRecurrenceLabel2),
        findsOne,
      );

      await tester.tap(find.text(monthlyRecurrenceLabel2));
      await tester.pumpAndSettle();

      expect(model.frequency, Frequency.monthly);
      expect(model.recurrenceLabel, monthlyRecurrenceLabel2);
      expect(
        model.weekDayOccurenceInMonth,
        RecurrenceUtils.getWeekDayOccurenceInMonth(
          model.recurrenceStartDate,
        ),
      );
      expect(model.weekDays, {
        RecurrenceUtils.weekDays[model.recurrenceStartDate.weekday - 1],
      });
    });

    testWidgets(
        'CustomWeekDaySelector handles selecting and deselecting weekdays',
        (tester) async {
      final mockModel = CreateEventViewModel();
      mockModel.weekDays = {}; // Start with an empty set of selected weekdays.

      // Create the widget with the mock model
      final widget = MaterialApp(
        home: Scaffold(
          body: CustomWeekDaySelector(model: mockModel),
        ),
      );

      await tester.pumpWidget(widget);
      await tester.pump();

      // Verify the CustomWeekDaySelector widget is present
      expect(find.byType(CustomWeekDaySelector), findsOne);

      // Tap "M" (Monday) to select it
      await tester.tap(find.text("M"));
      await tester.pumpAndSettle();

      // Verify that "M" is selected and added to the model
      expect(mockModel.weekDays, contains(WeekDays.monday));

      // Tap "W" (Wednesday) to select it
      await tester.tap(find.text("W"));
      await tester.pumpAndSettle();

      // Verify that "W" is selected and added to the model
      expect(mockModel.weekDays, contains(WeekDays.wednesday));

      // Verify that unrelated weekdays remain unselected
      expect(mockModel.weekDays, isNot(contains(WeekDays.sunday)));
      expect(mockModel.weekDays, isNot(contains(WeekDays.friday)));

      // Tap "M" again to deselect it
      await tester.tap(find.text("M"));
      await tester.pumpAndSettle();

      // Verify that "M" is removed from the model
      expect(mockModel.weekDays, isNot(contains(WeekDays.monday)));

      // Final state checks
      expect(mockModel.weekDays, contains(WeekDays.wednesday));
      expect(mockModel.weekDays.length, 1);
    });

    testWidgets('EventEndOptions', (tester) async {
      final CreateEventViewModel model = CreateEventViewModel();
      final widget = createCustomRecurrenceScreen(
        theme: TalawaTheme.darkTheme,
        model: model,
      );
      await tester.pumpWidget(widget);
      await tester.pump();

      expect(
        find.byKey(
          const Key('neverRadioButton'),
        ),
        findsOne,
      );
      expect(
        find.byKey(
          const Key('onRadioButton'),
        ),
        findsOne,
      );
      expect(find.byKey(const Key('afterRadioButton')), findsOne);

      final afterFinder = find.byKey(const Key('afterRadioButton'));

      await tester.tap(afterFinder);
      await tester.pumpAndSettle();

      final dateSelectorCalendar =
          find.byKey(const Key('dateSelectorCalendar'));

      await tester.tap(dateSelectorCalendar);
      await tester.pumpAndSettle();

      expect(find.byType(DatePickerDialog), findsOne);

      await tester.tap(find.text('15').last);
      await tester.pumpAndSettle();
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      expect(find.byType(DatePickerDialog), findsNothing);

      await tester.tap(find.text('never'));
      await tester.pumpAndSettle();

      expect(model.eventEndType, EventEndTypes.never);
      expect(model.recurrenceEndDate, null);

      await tester.tap(find.text('on'));
      await tester.pumpAndSettle();

      expect(model.eventEndType, EventEndTypes.on);
    });

    testWidgets('Done button', (tester) async {
      final CreateEventViewModel model = CreateEventViewModel();
      final widget = createCustomRecurrenceScreen(
        theme: TalawaTheme.darkTheme,
        model: model,
      );
      await tester.pumpWidget(widget);
      await tester.pump();

      await tester.tap(find.text('Done'));
      await tester.pumpAndSettle();

      expect(model.recurrenceEndDate, null);

      await tester.tap(find.text('on'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Done'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('after'));
      await tester.pumpAndSettle();

      final afterTextField = find.byType(CustomTextField).last;

      await tester.tap(afterTextField);
      await tester.pumpAndSettle();

      await tester.enterText(afterTextField, '2');

      await tester.tap(find.text('Done'));
      await tester.pumpAndSettle();

      expect(model.endOccurenceController.text, '2');
    });
  });
}
