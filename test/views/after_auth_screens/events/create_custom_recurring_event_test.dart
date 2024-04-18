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
import 'package:talawa/views/after_auth_screens/events/create_custom_recurring_event.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/create_recurring_event_helper_widgets.dart';
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
  SizeConfig().test();
  testSetupLocator();
  getAndRegisterNavigationService();

  // setUp(() {
  //   registerServices();
  // });

  // tearDown(() {
  //   unregisterServices();
  // });
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

    testWidgets('section1InputFields', (tester) async {
      await tester.pumpWidget(
        createCustomRecurrenceScreen(
          theme: TalawaTheme.darkTheme,
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

      final popupMenuButton = find.byType(PopupMenuButton<String>);

      await tester.tap(popupMenuButton);
      await tester.pumpAndSettle();

      expect(find.text("day"), findsOne);
      expect(find.text("month"), findsOne);
      expect(find.text("year"), findsOne);

      // Test dropdown selection working.
      await tester.tap(find.text("month"));
      await tester.pumpAndSettle();

      expect(find.text("month"), findsOne);

      // when clicked on day/year.
      await tester.tap(find.text('month'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('year'));
      await tester.pumpAndSettle();

      // expect(find.text('Monthly on day 3'), findsNothing);
    });

    testWidgets('CustomWeekDaySelector', (tester) async {
      final widget = createCustomRecurrenceScreen(
        theme: TalawaTheme.darkTheme,
      );
      await tester.pumpWidget(widget);
      await tester.pump();

      expect(find.byType(CustomWeekDaySelector), findsOne);

      await tester.tap(find.text("M"));
      await tester.pumpAndSettle();
      await tester.tap(find.text("W"));
      await tester.pumpAndSettle();

      expect(find.text("S"), findsNWidgets(2));
      expect(find.text("M"), findsNWidgets(1));
      expect(find.text("T"), findsNWidgets(2));
      expect(find.text("W"), findsNWidgets(1));
      expect(find.text("F"), findsNWidgets(1));
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
      expect(model.eventEndDate, null);

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

      expect(model.eventEndDate, null);

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
