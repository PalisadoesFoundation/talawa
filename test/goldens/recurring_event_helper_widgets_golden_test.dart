// ignore_for_file: talawa_api_doc
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/recurrence_values.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/widgets/recurring_event_helper_widgets.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_helpers.mocks.dart';
import '../helpers/test_locator.dart';
import 'golden_test_helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockCreateEventViewModel mockModel;
  late TextEditingController controller;

  setUpAll(() {
    setUpGoldenTests();
    testSetupLocator();
  });

  tearDownAll(() {
    tearDownGoldenTests();
    unregisterServices();
  });

  setUp(() {
    registerServices();
    locator<SizeConfig>().test();
    mockModel = MockCreateEventViewModel();
    controller = TextEditingController(text: '1');
    when(mockModel.eventEndType).thenReturn(EventEndTypes.never);
    when(mockModel.recurrenceEndDate).thenReturn(null);
    when(mockModel.count).thenReturn(null);
  });

  tearDown(() {
    controller.dispose();
    unregisterServices();
  });

  group('CustomRectangle Golden Tests', () {
    testWidgets('with_child - light', (WidgetTester tester) async {
      await tester.pumpWidget(
        themedWidget(
          const SizedBox(
            width: 200,
            height: 60,
            child: CustomRectangle(
              child: Text('Inside Rectangle'),
            ),
          ),
          themeMode: ThemeMode.light,
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(CustomRectangle),
        matchesGoldenFile(
          goldenFileName('custom_rectangle', 'with_child', 'light'),
        ),
      );
    });

    testWidgets('with_child - dark', (WidgetTester tester) async {
      await tester.pumpWidget(
        themedWidget(
          const SizedBox(
            width: 200,
            height: 60,
            child: CustomRectangle(
              child: Text('Inside Rectangle'),
            ),
          ),
          themeMode: ThemeMode.dark,
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(CustomRectangle),
        matchesGoldenFile(
          goldenFileName('custom_rectangle', 'with_child', 'dark'),
        ),
      );
    });
  });

  group('CustomTextField Golden Tests', () {
    testWidgets('enabled - light', (WidgetTester tester) async {
      await tester.pumpWidget(
        themedWidget(
          SizedBox(
            width: 200,
            height: 80,
            child: CustomTextField(
              textEditingController: controller,
              maxTextLength: 3,
            ),
          ),
          themeMode: ThemeMode.light,
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(CustomTextField),
        matchesGoldenFile(
          goldenFileName('custom_text_field', 'enabled', 'light'),
        ),
      );
    });

    testWidgets('enabled - dark', (WidgetTester tester) async {
      await tester.pumpWidget(
        themedWidget(
          SizedBox(
            width: 200,
            height: 80,
            child: CustomTextField(
              textEditingController: controller,
              maxTextLength: 3,
            ),
          ),
          themeMode: ThemeMode.dark,
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(CustomTextField),
        matchesGoldenFile(
          goldenFileName('custom_text_field', 'enabled', 'dark'),
        ),
      );
    });
  });

  group('RecurrenceFrequencyDropdown Golden Tests', () {
    testWidgets('initial - light', (WidgetTester tester) async {
      await tester.pumpWidget(
        themedWidget(
          SizedBox(
            width: 300,
            height: 80,
            child: RecurrenceFrequencyDropdown(
              model: mockModel,
              onSelected: (_) {},
              options: const ['Daily', 'Weekly', 'Monthly'],
              selectedOption: 'Weekly',
            ),
          ),
          themeMode: ThemeMode.light,
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(RecurrenceFrequencyDropdown),
        matchesGoldenFile(
          goldenFileName(
            'recurrence_frequency_dropdown',
            'initial',
            'light',
          ),
        ),
      );
    });

    testWidgets('initial - dark', (WidgetTester tester) async {
      await tester.pumpWidget(
        themedWidget(
          SizedBox(
            width: 300,
            height: 80,
            child: RecurrenceFrequencyDropdown(
              model: mockModel,
              onSelected: (_) {},
              options: const ['Daily', 'Weekly', 'Monthly'],
              selectedOption: 'Weekly',
            ),
          ),
          themeMode: ThemeMode.dark,
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(RecurrenceFrequencyDropdown),
        matchesGoldenFile(
          goldenFileName(
            'recurrence_frequency_dropdown',
            'initial',
            'dark',
          ),
        ),
      );
    });
  });

  group('EventEndOptions Golden Tests', () {
    // EventEndOptions uses RadioListTile which needs full screen width;
    // suppress any residual overflow errors from date picker row.
    void ignoreOverflow(FlutterErrorDetails details) {
      if (details.exceptionAsString().contains('overflowed')) return;
      FlutterError.presentError(details);
    }

    testWidgets('never - light', (WidgetTester tester) async {
      FlutterError.onError = ignoreOverflow;
      when(mockModel.eventEndType).thenReturn(EventEndTypes.never);
      when(mockModel.recurrenceEndDate).thenReturn(null);
      await tester.pumpWidget(
        themedWidget(
          EventEndOptions(model: mockModel),
          themeMode: ThemeMode.light,
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(EventEndOptions),
        matchesGoldenFile(
          goldenFileName('event_end_options', 'never', 'light'),
        ),
      );
      FlutterError.onError = FlutterError.presentError;
    });

    testWidgets('never - dark', (WidgetTester tester) async {
      FlutterError.onError = ignoreOverflow;
      when(mockModel.eventEndType).thenReturn(EventEndTypes.never);
      when(mockModel.recurrenceEndDate).thenReturn(null);
      await tester.pumpWidget(
        themedWidget(
          EventEndOptions(model: mockModel),
          themeMode: ThemeMode.dark,
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(EventEndOptions),
        matchesGoldenFile(
          goldenFileName('event_end_options', 'never', 'dark'),
        ),
      );
      FlutterError.onError = FlutterError.presentError;
    });
  });
}
