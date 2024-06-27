import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:talawa/constants/recurrence_values.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/create_event_view_model.dart';
import 'package:talawa/widgets/recurrence_dialog.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

void main() {
  late CreateEventViewModel model;

  group('ShowRecurrenceDialog', () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
      testSetupLocator();
      locator<SizeConfig>().test();
    });

    setUp(() {
      locator<SizeConfig>().test();
      registerServices();
      model = CreateEventViewModel();
      model.initialize();
    });

    tearDown(() => unregisterServices());

    testWidgets('shows correct initial values', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ShowRecurrenceDialog(model: model),
        ),
      );

      expect(find.text('Does not repeat'), findsOneWidget);
      expect(find.text('Daily'), findsOneWidget);
      expect(
        find.text(
          RecurrenceUtils.getRecurrenceRuleText(
            Frequency.weekly,
            {RecurrenceUtils.weekDays[model.recurrenceStartDate.weekday - 1]},
            model.interval,
            model.count,
            model.weekDayOccurenceInMonth,
            model.recurrenceStartDate,
            model.recurrenceEndDate,
          ),
        ),
        findsOneWidget,
      );
      expect(
        find.text(
          RecurrenceUtils.getRecurrenceRuleText(
            Frequency.monthly,
            null,
            model.interval,
            model.count,
            model.weekDayOccurenceInMonth,
            model.recurrenceStartDate,
            model.recurrenceEndDate,
          ),
        ),
        findsOneWidget,
      );
      expect(
        find.text(
          RecurrenceUtils.getRecurrenceRuleText(
            Frequency.yearly,
            null,
            model.interval,
            model.count,
            model.weekDayOccurenceInMonth,
            model.recurrenceStartDate,
            model.recurrenceEndDate,
          ),
        ),
        findsOneWidget,
      );
      expect(
        find.text(
          'Monday to Friday ${model.recurrenceEndDate != null ? "until ${DateFormat('MMMM d, y').format(model.recurrenceEndDate!)}" : ""}',
        ),
        findsOneWidget,
      );
      expect(find.text('Custom...'), findsOneWidget);
    });

    testWidgets('shows correct initial values for last weekday occurrence',
        (tester) async {
      model.recurrenceStartDate = DateTime(2023, 02, 28);
      await tester.pumpWidget(
        MaterialApp(
          home: ShowRecurrenceDialog(model: model),
        ),
      );

      expect(
        find.text(
          RecurrenceUtils.getRecurrenceRuleText(
            Frequency.monthly,
            {'TUESDAY'},
            model.interval,
            model.count,
            -1,
            model.recurrenceStartDate,
            model.recurrenceEndDate,
          ),
        ),
        findsOneWidget,
      );
    });

    testWidgets('updates model when Does not repeat is selected',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ShowRecurrenceDialog(model: model),
        ),
      );

      await tester.tap(find.text('Does not repeat'));
      await tester.pump();

      expect(model.isRecurring, false);
      expect(model.recurrenceLabel, 'Does not repeat');
      expect(model.frequency, Frequency.weekly);
      expect(model.weekDays, {
        days[DateTime.now().weekday - 1],
      });
      expect(model.weekDayOccurenceInMonth, null);
    });

    testWidgets('updates model when Daily is selected', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ShowRecurrenceDialog(model: model),
        ),
      );

      await tester.tap(find.text('Daily'));
      await tester.pump();

      expect(model.isRecurring, true);
      expect(model.recurrenceLabel, 'Daily');
      expect(model.frequency, Frequency.daily);
    });

    testWidgets('updates model when Weekly is selected', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ShowRecurrenceDialog(model: model),
        ),
      );
      final label = RecurrenceUtils.getRecurrenceRuleText(
        Frequency.weekly,
        {RecurrenceUtils.weekDays[model.recurrenceStartDate.weekday - 1]},
        model.interval,
        model.count,
        model.weekDayOccurenceInMonth,
        model.recurrenceStartDate,
        model.recurrenceEndDate,
      );
      await tester.tap(find.text(label));
      await tester.pump();

      expect(model.isRecurring, true);
      expect(model.recurrenceLabel, label);
      expect(model.frequency, Frequency.weekly);
      expect(
        model.weekDays,
        {
          RecurrenceUtils.weekDays[model.recurrenceStartDate.weekday - 1]
              .toUpperCase(),
        },
      );
    });

    testWidgets('updates model when Monthly is selected', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ShowRecurrenceDialog(model: model),
        ),
      );

      final label = RecurrenceUtils.getRecurrenceRuleText(
        Frequency.monthly,
        null,
        model.interval,
        model.count,
        model.weekDayOccurenceInMonth,
        model.recurrenceStartDate,
        model.recurrenceEndDate,
      );

      await tester.tap(find.text(label));
      await tester.pump();

      expect(model.isRecurring, true);
      expect(model.recurrenceLabel, label);
      expect(model.frequency, Frequency.monthly);
    });

    testWidgets('updates model when Yearly is selected', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ShowRecurrenceDialog(model: model),
        ),
      );

      final label = RecurrenceUtils.getRecurrenceRuleText(
        Frequency.yearly,
        null,
        model.interval,
        model.count,
        model.weekDayOccurenceInMonth,
        model.recurrenceStartDate,
        model.recurrenceEndDate,
      );

      await tester.tap(find.text(label));
      await tester.pump();

      expect(model.isRecurring, true);
      expect(model.recurrenceLabel, label);
      expect(model.frequency, Frequency.yearly);
    });

    testWidgets('updates model when Monday to Friday is selected',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ShowRecurrenceDialog(model: model),
        ),
      );

      final label =
          'Monday to Friday ${model.recurrenceEndDate != null ? "until ${DateFormat('MMMM d, y').format(model.recurrenceEndDate!)}" : ""}';

      await tester.tap(find.text(label));
      await tester.pump();

      expect(model.isRecurring, true);
      expect(model.recurrenceLabel, label);
      expect(model.frequency, Frequency.weekly);
      expect(
        model.weekDays,
        {
          'MONDAY',
          'TUESDAY',
          'WEDNESDAY',
          'THURSDAY',
          'FRIDAY',
        },
      );
    });
  });
}
