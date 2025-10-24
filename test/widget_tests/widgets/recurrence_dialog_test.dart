import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
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
    });

    tearDown(() => unregisterServices());

    testWidgets('shows correct initial values', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ShowRecurrenceDialog(model: model),
        ),
      );

      expect(find.text('Does not repeat'), findsOneWidget);
      expect(find.text('Every day'), findsOneWidget);

      // Weekly option shows short day name (e.g., "Every Mon")
      final weeklyDay = days[model.eventStartDate.weekday - 1];
      final weeklyText = 'Every ${weeklyDay.substring(0, 3)}';
      expect(find.text(weeklyText), findsOneWidget);

      // Monthly option shows day of month
      final monthlyText = 'Every month on day ${model.eventStartDate.day}';
      expect(find.text(monthlyText), findsOneWidget);

      // Yearly option shows day and month
      final yearlyText =
          'Every year on ${model.eventStartDate.day} ${monthNames[model.eventStartDate.month - 1]}';
      expect(find.text(yearlyText), findsOneWidget);

      expect(find.text('Monday to Friday'), findsOneWidget);
      expect(find.text('Custom...'), findsOneWidget);
    });

    testWidgets('shows correct initial values for last weekday occurrence',
        (tester) async {
      model.eventStartDate = DateTime(2023, 02, 28);
      await tester.pumpWidget(
        MaterialApp(
          home: ShowRecurrenceDialog(model: model),
        ),
      );

      // The dialog shows "Every month on day 28" for this date
      final monthlyText = 'Every month on day ${model.eventStartDate.day}';
      expect(find.text(monthlyText), findsOneWidget);
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
      // When resetRecurrenceSettings is called, weekDays is reset to empty set
      expect(model.frequency, Frequency.weekly);
      expect(model.weekDays, isEmpty);
    });

    testWidgets('updates model when Daily is selected', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ShowRecurrenceDialog(model: model),
        ),
      );

      await tester.tap(find.text('Every day'));
      await tester.pump();

      expect(model.isRecurring, true);
      expect(model.recurrenceLabel, 'Every day');
      expect(model.frequency, Frequency.daily);
    });

    testWidgets('updates model when Weekly is selected', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ShowRecurrenceDialog(model: model),
        ),
      );

      // The dialog shows "Every Mon" (short day name)
      final weeklyDay = days[model.eventStartDate.weekday - 1];
      final label = 'Every ${weeklyDay.substring(0, 3)}';

      await tester.tap(find.text(label));
      await tester.pump();

      expect(model.isRecurring, true);
      expect(model.recurrenceLabel, label);
      expect(model.frequency, Frequency.weekly);
      expect(
        model.weekDays,
        {weeklyDay},
      );
    });

    testWidgets('updates model when Monthly is selected', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ShowRecurrenceDialog(model: model),
        ),
      );

      final label = 'Every month on day ${model.eventStartDate.day}';

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

      final label =
          'Every year on ${model.eventStartDate.day} ${monthNames[model.eventStartDate.month - 1]}';

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

      const label = 'Monday to Friday';

      await tester.tap(find.text(label));
      await tester.pump();

      expect(model.isRecurring, true);
      expect(model.recurrenceLabel, label);
      expect(model.frequency, Frequency.weekly);
      expect(
        model.weekDays,
        {
          WeekDays.monday,
          WeekDays.tuesday,
          WeekDays.wednesday,
          WeekDays.thursday,
          WeekDays.friday,
        },
      );
    });
  });
}
